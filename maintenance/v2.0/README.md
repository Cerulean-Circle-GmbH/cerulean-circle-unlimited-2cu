# Maintenance Tools v2.0 (Modern Git-Native)

**Status**: Clean implementation using pure git operations  
**Philosophy**: No backup files, all safety through git history  
**Automation**: GitHub Actions for CI/CD

## 🎯 Design Principles

1. **Git-Native**: All operations use git for safety and rollback
2. **No Backup Files**: Zero `.backup` or `migration_backup` directories
3. **Atomic Operations**: Each change is a complete, revertible git commit
4. **CI/CD Ready**: GitHub Actions for automated maintenance
5. **Simple & Clear**: Each script does one thing well

## 📁 Directory Structure

```
v2.0/
├── scripts/                     # Maintenance scripts
│   ├── add-file.sh             # Add new markdown file to dual-context
│   ├── sync-contexts.sh        # Sync changes between contexts
│   ├── validate-links.sh       # Validate all links in both contexts
│   ├── convert-to-dual.sh      # Convert single file to dual-context
│   └── deploy-to-main.sh       # Deploy architecture to main branch
├── workflows/                   # GitHub Actions
│   ├── validate-links.yml      # Automated link validation
│   ├── sync-on-change.yml      # Auto-sync on file changes
│   └── deploy-dual-context.yml # Deployment workflow
├── docs/                       # Documentation
│   ├── architecture.md         # Dual-context architecture explanation
│   ├── deployment-guide.md     # Step-by-step deployment
│   └── troubleshooting.md      # Common issues and solutions
└── tests/                      # Test suite
    ├── test-add-file.sh
    ├── test-sync.sh
    └── test-validate.sh
```

## 🚀 Key Features

### 1. **Git-Based Safety**
```bash
# Every operation creates a tagged checkpoint
git tag -a "checkpoint-$(date +%Y%m%d-%H%M%S)" -m "Safety checkpoint"
```

### 2. **Atomic File Conversion**
```bash
# Convert file to dual-context in one atomic operation
./scripts/convert-to-dual.sh path/to/file.md
```

### 3. **GitHub Actions Integration**
- Automatic link validation on PR
- Sync verification before merge
- Deployment automation to main

### 4. **Smart Conflict Resolution**
- Handles file vs symlink conflicts gracefully
- No temporary directories needed
- Clean rollback on any failure

## 📝 Usage Examples

### Add New Markdown File
```bash
./scripts/add-file.sh ./docs/new-feature.md
```

### Sync Changes Between Contexts
```bash
./scripts/sync-contexts.sh [--check-only]
```

### Deploy to Main Branch
```bash
./scripts/deploy-to-main.sh [--dry-run]
```

## 🔄 Migration from v1.0

### Option 1: Fresh Deployment
1. Start from clean main branch
2. Run `deploy-to-main.sh`
3. All files converted automatically

### Option 2: Incremental Migration
1. Convert files one by one
2. Maintain working state throughout
3. No downtime or broken links

## 🎭 GitHub Actions Workflows

### PR Validation
- Runs on every pull request
- Validates link integrity
- Checks dual-context consistency

### Auto-Sync
- Monitors file changes
- Syncs contexts automatically
- Creates sync commits

### Deployment
- One-click deployment to main
- Full validation suite
- Automatic rollback on failure

## 🛡️ Safety Features

1. **Pre-Operation Validation**
   - Check git status is clean
   - Verify no conflicts exist
   - Validate target paths

2. **Atomic Commits**
   - Each operation = one commit
   - Clear commit messages
   - Tagged checkpoints

3. **Rollback Capability**
   ```bash
   git reset --hard checkpoint-<timestamp>
   ```

## 📊 Advantages Over v1.0

| Feature | v1.0 | v2.0 |
|---------|------|------|
| Backup Files | ✗ Creates .backup files | ✓ Pure git operations |
| Automation | ✗ Manual scripts only | ✓ GitHub Actions |
| Deployment | ✗ Complex merge conflicts | ✓ Clean deployment |
| Safety | ✗ File-based backups | ✓ Git-based checkpoints |
| Maintenance | ✗ Multiple steps | ✓ Single commands |

## 🚦 Getting Started

1. **Check Prerequisites**
   ```bash
   git --version  # 2.28+ recommended
   gh --version   # GitHub CLI for Actions
   ```

2. **Run Initial Setup**
   ```bash
   ./scripts/setup.sh
   ```

3. **Deploy Architecture**
   ```bash
   ./scripts/deploy-to-main.sh --dry-run
   ./scripts/deploy-to-main.sh
   ```

## 📚 Documentation

- [Architecture Guide](docs/architecture.md)
- [Deployment Guide](docs/deployment-guide.md)
- [Troubleshooting](docs/troubleshooting.md)

---

**Note**: This is a complete rewrite focusing on simplicity, safety, and automation.