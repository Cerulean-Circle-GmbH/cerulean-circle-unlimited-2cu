[PDCA/](PDCA/)

# Dual-Context Architecture Maintenance System

This maintenance system provides automated tools and git integrations to maintain the dual-context architecture for Atlassian link resolution in the Cerulean Circle Unlimited 2CU export repository.

## 🏗️ **Architecture Overview**

The dual-context architecture enables seamless navigation from two different contexts:

### **Navigation Contexts**
1. **Pages Context** (`.md` symlinks)
   - Files: `filename.md` → symlinks pointing to pages structure
   - Location: `2cu.atlassian.net/wiki/spaces/CCU/pages/[ID]/filename.md`
   - Links: Use relative paths within pages structure (`../[ID]/target.md`)

2. **Original Context** (`.entry.md` files)
   - Files: `filename.md.entry.md` → real files with original content
   - Location: Original hierarchical structure
   - Links: Use original relative paths (`../../../../../2cu.atlassian.net/...`)

### **File Relationships**
```
original_file.md                    → symlink to pages structure
original_file.md.entry.md           → real file with original links
original_file.md.migration.backup   → backup of original content
```

## 📁 **Directory Structure**

```
maintenance/
├── README.md                    # This documentation
├── install_git_hooks.sh         # Git hooks installer
├── src/sh/                      # Maintenance tools
│   ├── 01_initial_link_mapper.sh        # PDCA Cycle 1: Initial setup
│   ├── 02_initial_update_links.sh       # PDCA Cycle 2: Link updates
│   ├── 03_architecture_migration.sh     # PDCA Cycle 4: Architecture inversion
│   ├── 04_fix_page_links.sh            # PDCA Cycle 5: Link consistency
│   ├── 05_create_dual_entries.sh       # PDCA Cycle 6: Dual entries
│   ├── add_new_markdown.sh             # Add new MD files to system
│   ├── sync_dual_context.sh            # Sync between contexts
│   ├── validate_links.sh               # Link integrity validation
│   └── cleanup_maintenance.sh          # Cleanup backup files
├── test/sh/                     # Test suite
│   ├── run_all_tests.sh               # Test runner
│   ├── test_add_new_markdown.sh       # Test integration tool
│   └── test_validate_links.sh         # Test validation tool
└── git-hooks/                   # Git automation
    ├── pre-commit                      # Pre-commit validation
    └── post-merge                      # Post-merge integration
```

## 🚀 **Quick Start**

### **1. Install Git Hooks (Recommended)**
```bash
cd /path/to/repository
./maintenance/install_git_hooks.sh
```

### **2. Add New Markdown File**
```bash
./maintenance/src/sh/add_new_markdown.sh ./path/to/new_file.md
```

### **3. Validate System Integrity**
```bash
./maintenance/src/sh/validate_links.sh --context both
```

### **4. Sync Dual-Context Files**
```bash
./maintenance/src/sh/sync_dual_context.sh --dry-run
```

## 🔧 **Maintenance Tools**

### **Core Tools**

#### **`add_new_markdown.sh`**
Integrates new markdown files into the dual-context architecture.

```bash
./maintenance/src/sh/add_new_markdown.sh <path_to_new_md_file>
```

**What it does:**
- Creates real file in pages structure
- Creates symlink in original location  
- Creates `.entry.md` file for original context
- Creates `.migration.backup` for safety
- Optimizes links for pages context

#### **`sync_dual_context.sh`**
Synchronizes content between `.md` (pages) and `.entry.md` (original) files.

```bash
./maintenance/src/sh/sync_dual_context.sh [--dry-run] [--file <specific_file>]
```

**Options:**
- `--dry-run`: Show what would be changed without making changes
- `--file <file>`: Sync specific file only

#### **`validate_links.sh`**
Validates link integrity across the dual-context architecture.

```bash
./maintenance/src/sh/validate_links.sh [--fix] [--context pages|original|both]
```

**Options:**
- `--fix`: Attempt automatic repairs
- `--context`: Validate specific context only

#### **`cleanup_maintenance.sh`**
Cleans up backup files and temporary artifacts.

```bash
./maintenance/src/sh/cleanup_maintenance.sh [--dry-run] [--aggressive]
```

**Options:**
- `--dry-run`: Show what would be deleted without deleting
- `--aggressive`: Remove more backup files (including `.migration.backup`)

### **Historical Tools (PDCA Archive)**

| Tool | Purpose | PDCA Cycle |
|------|---------|------------|
| `01_initial_link_mapper.sh` | Extract and map Atlassian URLs | Cycle 1 |
| `02_initial_update_links.sh` | Update links to point to symlinks | Cycle 2 |
| `03_architecture_migration.sh` | Invert symlink architecture | Cycle 4 |
| `04_fix_page_links.sh` | Fix link consistency in pages | Cycle 5 |
| `05_create_dual_entries.sh` | Create dual entry points | Cycle 6 |

## 🤖 **Git Automation**

### **Pre-commit Hook**
Automatically runs before each commit:
- Validates dual-context architecture integrity
- Checks for new markdown files needing integration
- Runs link validation
- Prevents committing backup files
- Prompts for integration of new files

### **Post-merge Hook**
Automatically runs after successful merges:
- Auto-integrates new markdown files
- Detects sync needs between contexts
- Validates link integrity after merge
- Provides guidance for manual actions

### **Installation**
```bash
./maintenance/install_git_hooks.sh        # Install hooks
./maintenance/install_git_hooks.sh --uninstall  # Remove hooks
```

## 🧪 **Testing**

### **Run All Tests**
```bash
./maintenance/test/sh/run_all_tests.sh [--verbose]
```

### **Individual Tests**
```bash
./maintenance/test/sh/test_add_new_markdown.sh   # Test integration tool
./maintenance/test/sh/test_validate_links.sh     # Test validation tool
./maintenance/test/sh/test_anti_hanging.sh       # Test anti-hanging patterns
```

## 🛡️ **Anti-Hanging Protection**

### **Safe Utilities**
```bash
# Source anti-hanging utilities in your scripts
source "$(dirname "${BASH_SOURCE[0]}")/anti_hang_utils.sh"

# Use safe alternatives
safe_commit "Single line commit message" "file.txt"
safe_execute 30 curl https://example.com
safe_network_op 3 30 wget https://example.com
```

### **Best Practices**
✅ **Use single-line strings** in shell commands  
✅ **Break complex chains** into simple commands  
✅ **Always use non-interactive flags** (-y, --yes)  
✅ **Add timeouts** for network operations  
✅ **Use 'set -e'** for proper error handling  
✅ **Test commands in isolation** first

### **Hanging Prevention**
The anti-hanging test suite validates all scripts for:
- Multi-line strings in commands (CRITICAL)
- Complex command chains (WARNING)
- Interactive commands without flags (WARNING)
- Network operations without timeouts (WARNING)

## 📋 **Common Workflows**

### **Adding New Content**
1. Create new markdown file in appropriate directory
2. Run integration: `./maintenance/src/sh/add_new_markdown.sh <file>`
3. Validate: `./maintenance/src/sh/validate_links.sh`
4. Commit changes

### **Content Updates**
1. Edit content in either `.md` (pages) or `.entry.md` (original) file
2. Sync contexts: `./maintenance/src/sh/sync_dual_context.sh --dry-run`
3. Apply sync if needed: `./maintenance/src/sh/sync_dual_context.sh`
4. Validate: `./maintenance/src/sh/validate_links.sh`

### **Regular Maintenance**
1. Weekly: `./maintenance/src/sh/validate_links.sh --context both`
2. Monthly: `./maintenance/src/sh/cleanup_maintenance.sh --dry-run`
3. After merges: Git hooks handle automatically

### **Troubleshooting Broken Links**
1. Identify issues: `./maintenance/src/sh/validate_links.sh --context both`
2. Attempt fixes: `./maintenance/src/sh/validate_links.sh --fix`
3. Manual review of complex cases
4. Re-validate: `./maintenance/src/sh/validate_links.sh`

## 🔍 **System Health Checks**

### **Architecture Integrity**
```bash
# Check file counts
find . -name "*.entry.md" | wc -l          # Entry files
find . -name "*.md" -type l | wc -l        # Symlinks
find ./2cu.atlassian.net -name "*.md" | wc -l  # Pages files

# Validate symlinks
find . -type l ! -exec test -e {} \; -print  # Broken symlinks
```

### **Link Health**
```bash
./maintenance/src/sh/validate_links.sh --context both
```

### **Sync Status**
```bash
./maintenance/src/sh/sync_dual_context.sh --dry-run
```

## ⚠️ **Important Notes**

### **File Handling Rules**
1. **Use git-based rollbacks** - no `.migration.backup` files needed
2. **Always use maintenance tools** for file operations to preserve architecture
3. **Test with `--dry-run`** before applying changes
4. **Commit frequently** - git hooks provide safety checks
5. **Git tags for rollback points** - each operation creates tagged rollback points

### **Link Format Guidelines**
- **Pages context**: Use relative paths within pages (`../[ID]/target.md`)
- **Original context**: Use original relative paths (`../../path/to/target.md`)
- **External links**: Leave unchanged (Jira, user profiles, images)

### **Git-Based Safety Strategy**
- **Rollback tags**: Each operation creates timestamped git tags
- **Commit checkpoints**: All changes committed with descriptive messages  
- **No backup files**: Use `git reset --hard [tag]` for rollbacks
- **Clean repository**: No `.migration.backup` clutter

### **Sync Considerations**
- **Newer file wins** - sync direction based on modification time
- **Manual review** may be needed for complex link transformations
- **Git checkpoints** created before sync operations
- **Test both contexts** after sync

## 📚 **Additional Resources**

- **PDCA Documentation**: `PDCA/` - Complete project history and methodology
- **Recovery Documentation**: `PDCA/recover.md` - AI agent recovery after VS Code restarts
- **Agent Role Definition**: `PDCA/ai.roles/OntologyAgent.md` - Complete agent context and capabilities
- **Original Issue Analysis**: `PDCA/2025-01-27-UTC-1045.md` - Initial problem description
- **Architecture Decision**: `PDCA/2025-01-27-UTC-1230.md` - Architectural inversion rationale
- **Sync Strategy**: `PDCA/2025-01-27-UTC-1430.md` - Synchronization planning

### **Recovery Instructions**
If VS Code/Cursor terminal hangs or crashes:
1. Restart VS Code
2. Tell the AI agent: "Please recover from readme"
3. Agent will read `PDCA/recover.md` and `PDCA/ai.roles/OntologyAgent.md` for complete context
4. Continue seamlessly from last checkpoint

## 🎯 **Success Metrics**

The dual-context architecture is working correctly when:
- ✅ Both `.md` (symlink) and `.entry.md` files provide seamless navigation
- ✅ Links work correctly in both contexts
- ✅ New files integrate automatically
- ✅ Sync operations maintain link integrity
- ✅ Git hooks prevent architecture violations

---

**Developed using PDCA methodology by OntologyAgent**  
**Project Status**: Production Ready ✅
