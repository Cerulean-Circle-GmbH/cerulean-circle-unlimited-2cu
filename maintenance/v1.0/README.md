# Maintenance Tools v1.0 (Legacy)

**Status**: Production-tested, contains migration_backup approach  
**Created**: PDCA Cycles 1-8  
**Purpose**: Original implementation of dual-context architecture maintenance

## ⚠️ Important Notes

This is the original implementation that:
- Uses `.migration.backup` files for safety
- Creates `migration_backup/` directories during certain operations
- Has been tested and proven to work but violates the "no backup files" requirement

## 📁 Directory Structure

```
v1.0/
├── src/sh/                      # Maintenance scripts
│   ├── 01_initial_link_mapper.sh        # PDCA Cycle 1: URL extraction
│   ├── 02_initial_update_links.sh       # PDCA Cycle 2: Link updates
│   ├── 03_architecture_migration.sh     # PDCA Cycle 4: Architecture inversion
│   ├── 04_fix_page_links.sh            # PDCA Cycle 5: Link consistency
│   ├── 05_create_dual_entries.sh       # PDCA Cycle 6: Dual entries
│   ├── add_new_markdown.sh             # Add new files (git-based safety)
│   ├── sync_dual_context.sh            # Sync between contexts
│   ├── validate_links.sh               # Link validation
│   └── cleanup_maintenance.sh          # Cleanup backup files
├── test/sh/                     # Test suite
│   ├── run_all_tests.sh
│   ├── test_add_new_markdown.sh
│   └── test_validate_links.sh
├── git-hooks/                   # Git automation
│   ├── pre-commit
│   └── post-merge
└── install_git_hooks.sh         # Hook installer
```

## 🔧 Key Scripts

### Scripts with Git-Based Safety (Updated)
- `add_new_markdown.sh` - Already uses git tags for rollback

### Scripts Still Using Backup Files
- `03_architecture_migration.sh` - Creates migration_backup directory
- `05_create_dual_entries.sh` - Depends on .migration.backup files
- `cleanup_maintenance.sh` - Manages .migration.backup cleanup

## 📝 Usage

These scripts were designed to be run in sequence during initial migration:
1. Run scripts 01-02 for initial link mapping
2. Run script 03 for architecture inversion
3. Run scripts 04-05 for dual-context completion
4. Use ongoing maintenance scripts as needed

## 🚫 Known Issues

1. **Backup File Creation**: Several scripts create backup files/directories
2. **Merge Conflicts**: Cannot merge directly to main due to file/symlink conflicts
3. **Complex Dependencies**: Scripts depend on specific file states

## ➡️ Migration to v2.0

See `../v2.0/` for the new implementation that:
- Uses pure git operations (no backup files)
- Provides GitHub Actions automation
- Simplifies the maintenance process
- Maintains compatibility with the dual-context architecture