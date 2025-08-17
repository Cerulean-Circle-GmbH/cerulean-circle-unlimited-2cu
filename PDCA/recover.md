[../ai.roles/OntologyAgent.md](../ai.roles/OntologyAgent.md)

# 🔄 **RECOVERY DOCUMENTATION**

**Last Update**: 2025-01-28 UTC 01:00  
**Current Branch**: feat/linksMigrated (OUTDATED) ⚠️  
**Recovery Branch**: **ALWAYS USE MAIN BRANCH** ⚠️  

## **⚠️ CRITICAL: THIS BRANCH IS OUTDATED**

### **IMMEDIATELY SWITCH TO MAIN BRANCH**
```bash
# REQUIRED - Switch to main branch NOW:
cd /workspace
git checkout main
git pull origin main
```

**Why**: This feat/linksMigrated branch contains experimental code from PDCA Cycles 1-9. The main branch has the complete production system with all 251 files migrated and is actively maintained.

## **🚫 DO NOT USE THIS BRANCH**

This branch contains:
- ❌ Only 29 test files (incomplete migration)
- ❌ Outdated maintenance scripts (v1.0)
- ❌ No auto-synchronization
- ❌ No user documentation
- ❌ Experimental code only

## **✅ USE MAIN BRANCH INSTEAD**

The main branch contains:
- ✅ 251 files fully migrated
- ✅ Maintenance v2.0 tools
- ✅ Auto-synchronization
- ✅ Complete documentation
- ✅ Self-healing repository

## **🎯 Correct Recovery Process**

1. **Switch to main immediately**:
   ```bash
   git checkout main
   git pull origin main
   ```

2. **Read main branch recovery docs**:
   ```bash
   cat PDCA/recover.md
   ```

3. **Use production tools**:
   ```bash
   ./maintenance/v2.0/sync.sh
   ./maintenance/v2.0/test/health_check.sh
   ```

## **📋 Historical Context Only**

This branch was used for experimental development of:
- Initial dual-context architecture design
- Testing with 29 governance files
- Developing maintenance v1.0 scripts
- Git-based rollback strategy planning

All successful experiments have been integrated and improved in the main branch.

## **⚠️ If You Accidentally Started Here**

```bash
# Fix immediately:
git stash                    # Save any changes
git checkout main           # Switch to production
git pull origin main        # Get latest
cat PDCA/recover.md         # Read correct docs
```

---

**CRITICAL**: Do not continue on this branch. All work should be done on main.  
**Recovery Instruction**: "git checkout main && cat PDCA/recover.md"
