# 🔧 Dual-Context Navigation - Maintenance Guide

**Administrative documentation** for maintaining the dual-context navigation system

## Table of Contents

1. [System Overview](#system-overview)
2. [Maintenance Tools](#maintenance-tools)
3. [Regular Maintenance](#regular-maintenance)
4. [GitHub Actions Setup](#github-actions-setup)
5. [Manual Operations](#manual-operations)
6. [Monitoring & Validation](#monitoring--validation)
7. [Troubleshooting](#troubleshooting)
8. [Emergency Procedures](#emergency-procedures)

## System Overview

### Components

1. **Core Migration Tool**: `/maintenance/v2.0/dual-context.sh`
2. **Auto-Sync Script**: `/maintenance/v2.0/src/auto-sync.sh`
3. **GitHub Actions**: `/.github/workflows/dual-context-sync.yml`
4. **Support Scripts**: `/maintenance/v2.0/src/`

### Architecture

```
┌─────────────────┐     ┌──────────────────┐
│  Hierarchical   │ ←→  │   Page-Based     │
│   Structure     │     │   Structure      │
└─────────────────┘     └──────────────────┘
         ↑                        ↑
         └────────┬───────────────┘
                  │
          ┌───────────────┐
          │   Symlinks    │
          │  Navigation   │
          └───────────────┘
```

## Maintenance Tools

### dual-context.sh

Main migration tool for individual files:

```bash
# Basic usage
./maintenance/v2.0/dual-context.sh <command> <args>

# Commands:
migrate <file> <page_id>  # Migrate single file
validate <file>           # Check file navigation
help                      # Show usage
```

### auto-sync.sh

Batch operations and synchronization:

```bash
# Usage modes
./maintenance/v2.0/src/auto-sync.sh file <path>     # Single file
./maintenance/v2.0/src/auto-sync.sh batch <files>   # Multiple files
./maintenance/v2.0/src/auto-sync.sh changed         # Git changes
./maintenance/v2.0/src/auto-sync.sh all             # Full repository
```

### Helper Scripts

Located in `/maintenance/v2.0/src/`:

- `common.sh` - Shared functions
- `migrate.sh` - Migration logic
- `create.sh` - File creation
- `add.sh` - Add navigation
- `update.sh` - Update existing

## Regular Maintenance

### Daily Tasks

1. **Check GitHub Actions**
   ```bash
   # View recent workflow runs
   gh run list --workflow=dual-context-sync.yml
   ```

2. **Validate Recent Changes**
   ```bash
   # Check today's changes
   git log --since="1 day ago" --name-only | grep "\.md$" | \
     xargs -I {} ./maintenance/v2.0/src/auto-sync.sh file {}
   ```

### Weekly Tasks

1. **Full Validation**
   ```bash
   # Validate all files
   ./maintenance/v2.0/src/validate-all.sh
   
   # Check for orphaned symlinks
   find . -type l -xtype l
   ```

2. **ID Uniqueness Check**
   ```bash
   # Find duplicate page IDs
   find 2cu.atlassian.net -type d -name "[0-9]*" | \
     grep -o '[0-9]\{9\}' | sort | uniq -d
   ```

3. **Performance Metrics**
   ```bash
   # Check sync performance
   time ./maintenance/v2.0/src/auto-sync.sh all
   ```

### Monthly Tasks

1. **Deep Integrity Check**
   ```bash
   # Verify all navigation headers
   find . -name "*.md" -type f | while read f; do
     if ! grep -q "📁.*→.*🌐" "$f"; then
       echo "Missing navigation: $f"
     fi
   done
   ```

2. **Cleanup Orphaned Structures**
   ```bash
   # Find page dirs without source files
   find 2cu.atlassian.net -name "*.md" -type f | while read f; do
     if [ ! -L "$f" ]; then
       echo "Non-symlink in page structure: $f"
     fi
   done
   ```

## GitHub Actions Setup

### Enable Workflow

1. Check workflow exists:
   ```bash
   ls -la .github/workflows/dual-context-sync.yml
   ```

2. Ensure Actions enabled:
   - Go to Settings → Actions
   - Select "Allow all actions"

3. Verify permissions:
   - Settings → Actions → General
   - Workflow permissions: "Read and write"

### Configure Triggers

Edit `.github/workflows/dual-context-sync.yml`:

```yaml
on:
  push:
    branches: [ main, develop ]  # Add branches
    paths:
      - '**.md'
      - '!docs/**'  # Exclude paths
```

### Monitor Execution

```bash
# View logs
gh run view <run-id> --log

# Download artifacts
gh run download <run-id>

# Re-run failed
gh run rerun <run-id>
```

## Manual Operations

### Adding Navigation to Existing File

```bash
# Single file
./maintenance/v2.0/dual-context.sh migrate "path/to/file.md" "300000999"

# Generate ID automatically
PAGE_ID=$(date +%s%N | cut -b1-9)
./maintenance/v2.0/dual-context.sh migrate "path/to/file.md" "$PAGE_ID"
```

### Bulk Migration

```bash
# Create list of files
find governance -name "*.md" -type f > files_to_migrate.txt

# Generate IDs and migrate
i=300001000
while read file; do
  ./maintenance/v2.0/dual-context.sh migrate "$file" "$i"
  ((i++))
done < files_to_migrate.txt
```

### Moving Files

```bash
# 1. Move file
git mv old/path/file.md new/path/file.md

# 2. Update navigation
./maintenance/v2.0/src/update.sh "new/path/file.md"

# 3. Commit
git add -A
git commit -m "Move file with navigation update"
```

### Removing Files

```bash
# 1. Get page ID before deletion
PAGE_ID=$(grep -oP '(?<=pages/)\d+' old-file.md)

# 2. Remove file
rm old-file.md

# 3. Clean up page structure
rm -rf "2cu.atlassian.net/wiki/spaces/CCU/pages/$PAGE_ID"

# 4. Remove symlinks
find . -type l -xtype l -delete
```

## Monitoring & Validation

### Health Checks

Create `health-check.sh`:

```bash
#!/bin/bash
echo "=== Dual-Context Health Check ==="

# Count files
HIER_COUNT=$(find cerulean-circle-unlimited-2cu -name "*.md" -type f | wc -l)
PAGE_COUNT=$(find 2cu.atlassian.net -name "*.entry.md" -type l | wc -l)

echo "Hierarchical files: $HIER_COUNT"
echo "Page entries: $PAGE_COUNT"

if [ "$HIER_COUNT" -ne "$PAGE_COUNT" ]; then
  echo "⚠️  MISMATCH: Expected counts to be equal"
fi

# Check for broken symlinks
BROKEN=$(find . -type l -xtype l | wc -l)
echo "Broken symlinks: $BROKEN"

# Recent sync failures
echo "Recent errors:"
grep -i error maintenance/logs/*.log 2>/dev/null | tail -5
```

### Performance Monitoring

Track sync performance:

```bash
# Log sync times
time ./maintenance/v2.0/src/auto-sync.sh all 2>&1 | \
  tee -a maintenance/logs/sync-$(date +%Y%m%d).log
```

### Validation Reports

Generate weekly report:

```bash
#!/bin/bash
# weekly-report.sh

echo "# Weekly Dual-Context Report"
echo "Date: $(date)"
echo

echo "## Statistics"
echo "- Total files: $(find . -name "*.md" -type f | wc -l)"
echo "- With navigation: $(grep -r "📁.*🌐" --include="*.md" | wc -l)"
echo "- This week's new: $(find . -name "*.md" -mtime -7 | wc -l)"

echo
echo "## Issues"
find . -name "*.md" -type f -exec grep -L "📁.*🌐" {} \; | \
  head -10 | sed 's/^/- /'

echo
echo "## Actions Taken"
git log --since="1 week ago" --grep="dual-context\|navigation" --oneline
```

## Troubleshooting

### Common Issues

**Files Not Syncing**

1. Check GitHub Actions:
   ```bash
   gh workflow view dual-context-sync.yml
   ```

2. Run manual sync:
   ```bash
   ./maintenance/v2.0/src/auto-sync.sh file "problem-file.md"
   ```

3. Check permissions:
   ```bash
   ls -la maintenance/v2.0/*.sh
   chmod +x maintenance/v2.0/*.sh
   ```

**Duplicate Page IDs**

1. Find duplicates:
   ```bash
   find 2cu.atlassian.net -type d -name "[0-9]*" | \
     awk -F/ '{print $NF}' | sort | uniq -d
   ```

2. Fix by re-migrating:
   ```bash
   NEW_ID=$(date +%s%N | cut -b1-9)
   ./maintenance/v2.0/dual-context.sh migrate "file.md" "$NEW_ID"
   ```

**Broken Navigation Headers**

1. Find broken headers:
   ```bash
   grep -r "📁.*🌐" --include="*.md" | \
     grep -v "→" | cut -d: -f1
   ```

2. Fix with update:
   ```bash
   ./maintenance/v2.0/src/update.sh "broken-file.md"
   ```

### Advanced Debugging

Enable debug mode:

```bash
# In scripts
export DEBUG=1

# Or modify script
set -x  # Add to script for trace
```

Check logs:

```bash
# GitHub Actions logs
gh run view --log

# Local logs
tail -f maintenance/logs/*.log
```

## Emergency Procedures

### Full System Recovery

If the dual-context system is severely broken:

1. **Backup Current State**
   ```bash
   tar -czf dual-context-backup-$(date +%Y%m%d).tar.gz \
     2cu.atlassian.net/ \
     cerulean-circle-unlimited-2cu/
   ```

2. **Remove Page Structure**
   ```bash
   rm -rf 2cu.atlassian.net/
   ```

3. **Clean Navigation Headers**
   ```bash
   find . -name "*.md" -type f -exec sed -i '/^📁.*🌐/d' {} \;
   ```

4. **Re-run Full Migration**
   ```bash
   ./maintenance/v2.0/src/full-migration.sh
   ```

### Rollback Procedure

If a migration goes wrong:

1. **Git Revert**
   ```bash
   git revert HEAD
   git push
   ```

2. **Or Reset**
   ```bash
   git reset --hard HEAD~1
   git push --force
   ```

3. **Clean Orphans**
   ```bash
   find . -type l -xtype l -delete
   find 2cu.atlassian.net -type d -empty -delete
   ```

### Disable Auto-Sync

In case of emergencies:

1. **Disable GitHub Action**
   ```bash
   gh workflow disable dual-context-sync.yml
   ```

2. **Or rename workflow**
   ```bash
   mv .github/workflows/dual-context-sync.yml{,.disabled}
   git add -A
   git commit -m "Temporarily disable auto-sync"
   git push
   ```

---

**📌 Remember**: The dual-context system is designed to be resilient. Most issues can be fixed by re-running the sync. When in doubt, check the PDCA documentation for the original implementation details! 🚀