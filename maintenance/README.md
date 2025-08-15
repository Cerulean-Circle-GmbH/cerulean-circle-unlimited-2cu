[../README.md](../README.md) ⬅️ **Main Project Documentation**

# Maintenance System - Version Overview

**Current Version**: v2.0 (Git-Native, No Backup Files)  
**Legacy Version**: v1.0 (Original Implementation)

## 🎯 Version Selection Guide

### Use v2.0 (Recommended) If:
- Starting fresh deployment to main branch
- Want GitHub Actions automation
- Prefer clean git history without backup files
- Need simple, atomic operations

### Use v1.0 If:
- Already have it deployed and working
- Need to reference original implementation
- Debugging historical issues

## 📁 Directory Structure

```
maintenance/
├── v1.0/                        # Original implementation
│   ├── src/sh/                 # Shell scripts with backup file approach
│   ├── test/sh/                # Original test suite
│   ├── git-hooks/              # Git hooks for v1.0
│   └── README.md               # v1.0 specific documentation
│
├── v2.0/                        # Modern implementation (RECOMMENDED)
│   ├── scripts/                # Clean, git-native scripts
│   │   ├── add-file.sh        # Add new markdown to dual-context
│   │   ├── sync-contexts.sh   # Sync between contexts
│   │   ├── validate-links.sh  # Validate all links
│   │   ├── convert-to-dual.sh # Convert single file
│   │   └── deploy-to-main.sh  # Deploy to production
│   ├── workflows/              # GitHub Actions
│   │   ├── validate-links.yml # PR validation
│   │   ├── sync-on-change.yml # Auto-sync
│   │   └── deploy-dual-context.yml # One-click deploy
│   ├── docs/                   # Architecture docs
│   └── README.md               # v2.0 documentation
│
├── README.md                    # This file
└── specification.md             # Original architecture specification
```

## 🚀 Quick Start with v2.0

### Basic Operations

```bash
# Add a new markdown file to dual-context
./v2.0/scripts/add-file.sh docs/new-feature.md

# Check if contexts are in sync
./v2.0/scripts/sync-contexts.sh --check-only

# Sync contexts if needed
./v2.0/scripts/sync-contexts.sh

# Validate all links
./v2.0/scripts/validate-links.sh
```

### Deployment to Main

```bash
# First, do a dry run
./v2.0/scripts/deploy-to-main.sh --dry-run

# If everything looks good, deploy
./v2.0/scripts/deploy-to-main.sh
```

## 🔄 Key Differences Between Versions

### v1.0 (Legacy)
- Creates `.migration.backup` files
- Uses `migration_backup/` directories
- Complex multi-step process
- Merge conflicts with main branch
- Requires manual cleanup

### v2.0 (Current)
- Pure git operations
- No backup files created
- Atomic single commits
- Clean deployment to main
- GitHub Actions ready

## 🎭 GitHub Actions (v2.0 only)

### Available Workflows

1. **Link Validation** (`validate-links.yml`)
   - Runs on every PR
   - Validates dual-context integrity
   - Posts results as PR comment

2. **Deploy Dual-Context** (`deploy-dual-context.yml`)
   - Manual trigger workflow
   - Dry-run by default
   - One-click production deployment

### Triggering Deployment via GitHub

1. Go to Actions tab
2. Select "Deploy Dual-Context Architecture"
3. Click "Run workflow"
4. Choose options:
   - `dry-run`: true (safe preview)
   - `target-branch`: main
5. Review results
6. Run again with `dry-run: false` to deploy

## 🔧 Migration Path

### From v1.0 to v2.0

If you have v1.0 deployed and want to switch to v2.0:

```bash
# 1. Clean up any backup files
find . -name "*.migration.backup" -delete
rm -rf migration_backup/

# 2. Ensure git is clean
git add . && git commit -m "Clean up before v2.0 migration"

# 3. Use v2.0 tools going forward
./v2.0/scripts/sync-contexts.sh
```

### Fresh Deployment with v2.0

For new deployments, use v2.0 directly:

```bash
# On main branch
git checkout main
./v2.0/scripts/deploy-to-main.sh
```

## 📊 Architecture Details

### Dual-Context Structure

Both versions maintain the same dual-context architecture:

```
file.md                 → Symlink to pages/[ID]/file.md
file.md.entry.md        → Original context navigation
pages/[ID]/file.md      → Real content (pages context)
```

### Navigation Contexts

1. **Pages Context**: Navigate within pages structure
2. **Original Context**: Navigate using original paths

## 🛟 Troubleshooting

### Common Issues

1. **"Git working directory not clean"**
   ```bash
   git status
   git add . && git commit -m "Save work"
   # or
   git stash
   ```

2. **"Contexts out of sync"**
   ```bash
   ./v2.0/scripts/sync-contexts.sh
   ```

3. **Rollback Needed**
   ```bash
   # v2.0 uses git tags
   git tag -l "checkpoint-*"
   git reset --hard checkpoint-[timestamp]
   ```

## 📚 Additional Resources

- [v1.0 Documentation](v1.0/README.md) - Original implementation details
- [v2.0 Documentation](v2.0/README.md) - Modern implementation guide
- [Main Project README](../README.md) - Overall project documentation
- [PDCA History](../PDCA/) - Development methodology and decisions

## 🤝 Contributing

When adding new maintenance features:
1. Add to v2.0 (not v1.0)
2. Follow git-native principles
3. No backup files
4. Include tests
5. Update documentation

---

**Remember**: v2.0 is the recommended version for all new work and deployments.
