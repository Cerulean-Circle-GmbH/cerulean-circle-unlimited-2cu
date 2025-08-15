# 📋 **PDCA Cycle 27: Mass Migration to Dual-Context Navigation**

**🗓️ Date:** 2025-01-27 UTC 22:30  
**🎯 Objective:** Migrate all files reachable from index.md to dual-context navigation structure  
**👤 Role:** Tool Developer → Migration Engineer  
**🚨 Issues:** Page ID mapping, bulk operations, validation at scale

---

## **📊 Summary**

Planning mass migration of all repository content to dual-context navigation. Index.md references ~298 files across multiple domains. Need systematic approach for page ID discovery, batch migration, and validation. v2.0 tools tested successfully on eamducp-repository.md, ready for production deployment at scale.

### **🔗 Artifact Links**

- **PDCA Cycle 27 (Mass Migration)**: [GitHub](https://github.com/Cerulean-Circle-GmbH/cerulean-circle-unlimited-2cu/blob/main/PDCA/2025-01-27-mass-migration-planning.md) | [PDCA/2025-01-27-mass-migration-planning.md](workspacesMountPoint/2cuGitHub/cerulean-circle-unlimited-2cu/PDCA/2025-01-27-mass-migration-planning.md)
- **Repository Index**: [GitHub](https://github.com/Cerulean-Circle-GmbH/cerulean-circle-unlimited-2cu/blob/main/index.md) | [index.md](workspacesMountPoint/2cuGitHub/cerulean-circle-unlimited-2cu/index.md)
- **Migration Tools**: [GitHub](https://github.com/Cerulean-Circle-GmbH/cerulean-circle-unlimited-2cu/tree/main/maintenance/v2.0) | [maintenance/v2.0/](workspacesMountPoint/2cuGitHub/cerulean-circle-unlimited-2cu/maintenance/v2.0/)

### **⚖️ Migration Decisions Required**

1. **Page ID Strategy**: Map existing IDs or generate new sequential IDs
2. **Migration Order**: By domain, importance, or alphabetical
3. **Validation Approach**: Continuous or batch validation
4. **Rollback Strategy**: Git-based checkpoints or file backups

---

## **📝 Plan**

### **Migration Scope Analysis**
```bash
# Extract all .md links from index.md
grep -oE '\./[^)]+\.md' /workspace/index.md | sort -u | wc -l
# Expected: ~250-300 files

# Identify domains
grep -oE '\./cerulean-circle-unlimited-2cu/[^/]+' /workspace/index.md | sort -u
# Domains: corporate-strategy, customer, governance, marketing, people, product
```

### **Page ID Discovery Strategy**
1. **Existing Mappings**: Find files already in page structure
2. **Parent-Child Relations**: Maintain hierarchical IDs
3. **New ID Generation**: Sequential from 300000000+ for unmapped files

### **Migration Phases**
- **Phase 1**: High-priority files (governance, product)
- **Phase 2**: Customer and marketing content
- **Phase 3**: Corporate strategy and people
- **Phase 4**: Remaining orphaned files

---

## **🔧 Do**

### **Page ID Mapping Script**
```bash
#!/bin/bash
# Create page ID mapping from existing structure

echo "# Page ID Mapping for Mass Migration" > page_id_mapping.txt
echo "# Generated: $(date)" >> page_id_mapping.txt
echo "" >> page_id_mapping.txt

# Find existing page IDs
find /workspace/2cu.atlassian.net/wiki/spaces/CCU/pages -type d -name "[0-9]*" | while read -r dir; do
    PAGE_ID=$(basename "$dir")
    # Find .md files in this directory
    for file in "$dir"/*.md; do
        if [ -f "$file" ] && [[ ! "$file" =~ \.entry\.md$ ]]; then
            FILENAME=$(basename "$file")
            echo "$PAGE_ID:$FILENAME" >> page_id_mapping.txt
        fi
    done
done

# Generate new IDs for unmapped files
NEXT_ID=300000000
grep -oE '\./[^)]+\.md' /workspace/index.md | sort -u | while read -r link; do
    FILE_PATH="${link#./}"
    FILENAME=$(basename "$FILE_PATH")
    
    # Check if already mapped
    if ! grep -q ":$FILENAME$" page_id_mapping.txt; then
        echo "$NEXT_ID:$FILE_PATH" >> page_id_mapping.txt
        ((NEXT_ID++))
    fi
done
```

### **Batch Migration Script**
```bash
#!/bin/bash
# Mass migration executor

source /workspace/maintenance/v2.0/test/test_framework.sh

# Migration log
MIGRATION_LOG="/workspace/migration_$(date +%Y%m%d_%H%M%S).log"
FAILED_LOG="/workspace/migration_failed_$(date +%Y%m%d_%H%M%S).log"

# Statistics
TOTAL=0
SUCCESS=0
FAILED=0
SKIPPED=0

# Read page ID mapping
while IFS=: read -r PAGE_ID FILE_PATH; do
    [[ "$PAGE_ID" =~ ^# ]] && continue
    [[ -z "$PAGE_ID" ]] && continue
    
    ((TOTAL++))
    
    # Skip if already migrated
    if grep -q "📁.*🌐" "/workspace/$FILE_PATH" 2>/dev/null; then
        echo "SKIP: $FILE_PATH (already has navigation)" | tee -a "$MIGRATION_LOG"
        ((SKIPPED++))
        continue
    fi
    
    # Check if file exists
    if [ ! -f "/workspace/$FILE_PATH" ]; then
        echo "ERROR: $FILE_PATH not found" | tee -a "$FAILED_LOG"
        ((FAILED++))
        continue
    fi
    
    # Run migration
    echo "MIGRATE: $FILE_PATH -> Page ID $PAGE_ID" | tee -a "$MIGRATION_LOG"
    if /workspace/maintenance/v2.0/dual-context.sh migrate "$FILE_PATH" "$PAGE_ID" >> "$MIGRATION_LOG" 2>&1; then
        ((SUCCESS++))
        echo "SUCCESS: $FILE_PATH" | tee -a "$MIGRATION_LOG"
    else
        ((FAILED++))
        echo "FAILED: $FILE_PATH" | tee -a "$FAILED_LOG"
    fi
    
    # Progress update every 10 files
    if [ $((TOTAL % 10)) -eq 0 ]; then
        echo "Progress: $TOTAL processed, $SUCCESS successful, $FAILED failed, $SKIPPED skipped"
    fi
done < page_id_mapping.txt

# Final report
echo "
=== MIGRATION COMPLETE ===
Total files: $TOTAL
Successful: $SUCCESS
Failed: $FAILED
Skipped: $SKIPPED
Success rate: $(( (SUCCESS * 100) / (TOTAL - SKIPPED) ))%
" | tee -a "$MIGRATION_LOG"
```

### **Validation Script**
```bash
#!/bin/bash
# Validate all migrated files

VALIDATION_LOG="/workspace/validation_$(date +%Y%m%d_%H%M%S).log"
ISSUES=0

# Check all files referenced in index.md
grep -oE '\./[^)]+\.md' /workspace/index.md | sort -u | while read -r link; do
    FILE_PATH="${link#./}"
    
    # Run validation
    if /workspace/maintenance/v2.0/dual-context.sh update "$FILE_PATH" --check-only > /dev/null 2>&1; then
        echo "✓ VALID: $FILE_PATH" >> "$VALIDATION_LOG"
    else
        echo "✗ INVALID: $FILE_PATH" >> "$VALIDATION_LOG"
        ((ISSUES++))
    fi
done

echo "
=== VALIDATION COMPLETE ===
Issues found: $ISSUES
" >> "$VALIDATION_LOG"
```

### **Git Checkpoint Strategy**
```bash
# Create checkpoint before migration
git add -A
git commit -m "Pre-migration checkpoint: dual-context mass migration"
git tag -a "pre-dual-context-migration" -m "Checkpoint before mass migration"

# After each phase
git add -A
git commit -m "Migration phase X complete: [domain] files migrated"
```

---

## **✅ Check**

### **Pre-Migration Verification**
✅ **Tool Readiness**: v2.0 tools tested and functional ✅  
✅ **Test Migration**: eamducp-repository.md successful ✅  
✅ **Scripts Created**: Page mapping, batch migration, validation ✅  
⏳ **Page ID Mapping**: In progress... ⏳  

### **Migration Readiness Checklist**
- [ ] Page ID mapping completed
- [ ] Git checkpoint created
- [ ] Migration scripts tested on small batch
- [ ] Validation script verified
- [ ] Rollback procedure documented
- [ ] Team notification sent

### **Risk Assessment**
❌ **Page ID Conflicts**: Some files may share names ❌  
❌ **Large File Count**: ~300 files need careful handling ❌  
❌ **Symlink Depth**: Deep paths may have issues ❌  
✅ **Rollback Ready**: Git checkpoints provide safety ✅  

---

## **🚀 Act**

### **Immediate Migration Steps**
1. **Generate Page Mapping**: Run mapping script to create ID assignments
2. **Test Batch**: Migrate 10 files as pilot
3. **Validate Pilot**: Ensure navigation works correctly
4. **Phase 1 Execution**: Migrate governance and product domains

### **Monitoring During Migration**
```bash
# Real-time monitoring
tail -f migration_*.log | grep -E "(SUCCESS|FAILED|Progress)"

# Check symlink health
find /workspace -name "*.entry.md" -type l ! -exec test -e {} \; -print

# Navigation header coverage
find /workspace/cerulean-circle-unlimited-2cu -name "*.md" -type f | \
  xargs grep -L "📁.*🌐" | wc -l
```

### **Post-Migration Tasks**
1. **Update index.md**: Ensure all links still work
2. **Validate All Files**: Run comprehensive validation
3. **Documentation Update**: Migration guide for future files
4. **Git Release**: Tag v2.0 migration complete

### **Success Metrics**
- 90%+ files successfully migrated
- All symlinks valid and resolving
- Navigation functional in GitHub
- No content loss detected

---

## **📋 PDCA Process Update**

### **Mass Migration Learning**
⏳ **Scale Challenges**: Bulk operations need careful orchestration ⏳  
⏳ **ID Management**: Systematic mapping prevents conflicts ⏳  
⏳ **Validation Critical**: Automated checks essential at scale ⏳  
⏳ **Phased Approach**: Reduces risk and allows corrections ⏳  

### **Process Enhancements**
- **Automation First**: Scripts handle repetitive tasks
- **Checkpoint Strategy**: Git tags enable safe rollback
- **Progress Tracking**: Logs provide audit trail
- **Validation Gates**: Each phase verified before proceeding

---

**📊 Summary:** Mass migration planned for ~300 files from index.md to dual-context navigation. Strategy includes page ID mapping, phased migration by domain, comprehensive validation, and git-based rollback. Scripts created for automation. Ready to execute pilot batch! 🚀📋✅