# 📖 Dual-Context Navigation - Complete Guide

**📚 Comprehensive documentation** for the dual-context navigation system

## Table of Contents

1. [Overview](#overview)
2. [System Architecture](#system-architecture)
3. [Navigation Methods](#navigation-methods)
4. [File Organization](#file-organization)
5. [Working with Files](#working-with-files)
6. [Best Practices](#best-practices)
7. [Advanced Features](#advanced-features)
8. [Troubleshooting](#troubleshooting)

## Overview

The dual-context navigation system provides two parallel ways to organize and access documentation:

- **Hierarchical Context**: Traditional folder-based organization
- **Page-Based Context**: Confluence-style page IDs for stable references

### Why Dual-Context?

1. **Flexibility**: Choose the navigation style that fits your workflow
2. **Stability**: Page IDs remain constant even if files move
3. **Integration**: Seamlessly works with both GitHub and Confluence
4. **Discovery**: Find content through multiple pathways

## System Architecture

### Directory Structure

```
repository-root/
├── cerulean-circle-unlimited-2cu/     # Hierarchical structure
│   ├── governance/
│   ├── product/
│   ├── customer/
│   └── corporate-strategy/
│
└── 2cu.atlassian.net/                 # Page-based structure
    └── wiki/spaces/CCU/pages/
        ├── 300000001/                 # Governance pages
        ├── 400000001/                 # Product pages
        ├── 500000001/                 # Customer pages
        └── 600000001/                 # Strategy pages
```

### Navigation Headers

Every markdown file contains a navigation header:

```markdown
📁 Hierarchical: path/to/file.md → 🌐 Page-Based: pages/ID/
```

This header:
- Appears at the top of every file
- Provides clickable links to switch contexts
- Maintains consistency across the repository

### Symlinks

Two types of symlinks connect the contexts:

1. **Entry Symlinks** (`*.entry.md`)
   - Located in page directories
   - Point to hierarchical files
   - Named: `topic.entry.md`

2. **Page Symlinks** (`*.page.md`)
   - Located in hierarchical directories
   - Point to page structure files
   - Named: `topic.page.md`

## Navigation Methods

### Method 1: Hierarchical Browsing

Traditional folder navigation:

```
1. Start at repository root
2. Navigate through domain folders
3. Drill down to specific topics
4. Use parent folders to go up
```

**Best for:**
- Exploring related content
- Understanding organizational structure
- Familiar GitHub browsing

### Method 2: Page ID Navigation

Direct access via page IDs:

```
1. Go to 2cu.atlassian.net/wiki/spaces/CCU/pages/
2. Enter page ID directory (e.g., 300000001)
3. Access file directly
```

**Best for:**
- Direct linking
- Stable references
- Integration with external systems

### Method 3: Symlink Jumping

Quick context switching:

```
1. In any file, look for .entry.md or .page.md
2. Click to jump between contexts
3. Maintains your location in the content
```

**Best for:**
- Quick context switches
- Exploring alternative organization
- Power users

### Method 4: Search

Both contexts are searchable:

```
1. Use GitHub search
2. Include "📁" or "🌐" to filter by context
3. Search by page ID for specific pages
```

## File Organization

### Domain Structure

Files are organized by business domain:

| Domain | ID Range | Purpose |
|--------|----------|---------|
| Governance | 300000000-399999999 | Policies, procedures, internals |
| Product | 400000000-499999999 | Product documentation |
| Customer | 500000000-599999999 | Customer-related content |
| Corporate Strategy | 600000000-699999999 | Strategic documents |
| Root/Other | 700000000-799999999 | Miscellaneous files |

### Naming Conventions

- **Hierarchical**: Descriptive names with hyphens (e.g., `governance-policy.md`)
- **Page-Based**: Retains original filename in page directory
- **Symlinks**: `topic.entry.md` and `topic.page.md`

## Working with Files

### Creating New Files

1. **Create markdown file** in appropriate hierarchical location
2. **Auto-sync triggers** on commit/push
3. **Navigation header** added automatically
4. **Page ID** generated based on domain
5. **Symlinks** created automatically

Example:
```bash
# Create new file
echo "# My New Page" > governance/new-policy.md

# Commit and push
git add governance/new-policy.md
git commit -m "Add new policy"
git push

# System automatically adds navigation and creates symlinks
```

### Editing Existing Files

- **Content changes**: Edit normally, changes reflect in both contexts
- **Moving files**: Update location, run sync to update navigation
- **Renaming**: Rename file, sync updates symlinks

### Deleting Files

1. Delete the hierarchical file
2. Run cleanup to remove:
   - Page directory
   - Symlinks
   - Navigation references

```bash
# Delete file
rm governance/old-policy.md

# Run cleanup
./maintenance/v2.0/src/auto-sync.sh file governance/old-policy.md remove
```

## Best Practices

### For Contributors

1. **Always commit to hierarchical** structure
2. **Let auto-sync handle** page structure
3. **Don't edit** files in page directories
4. **Use descriptive** file names
5. **Follow domain** organization

### For Navigators

1. **Start hierarchical** if browsing
2. **Use page IDs** for direct access
3. **Bookmark** frequently used pages
4. **Learn symlink** patterns
5. **Use search** effectively

### For Maintainers

1. **Monitor auto-sync** logs
2. **Validate symlinks** periodically
3. **Keep IDs** unique
4. **Document** special cases
5. **Update** navigation guides

## Advanced Features

### Manual Migration

For special cases, manually migrate files:

```bash
./maintenance/v2.0/dual-context.sh migrate "path/to/file.md" "PAGE_ID"
```

### Batch Operations

Process multiple files:

```bash
# Migrate all files in a directory
./maintenance/v2.0/src/auto-sync.sh all

# Check specific files
./maintenance/v2.0/src/auto-sync.sh batch file1.md file2.md file3.md
```

### Custom Page IDs

Override automatic ID generation:

```bash
# Specify custom ID during creation
./maintenance/v2.0/dual-context.sh migrate "file.md" "999999999"
```

### Navigation Validation

Check navigation integrity:

```bash
# Validate all files
./maintenance/v2.0/src/validate.sh all

# Check specific domain
./maintenance/v2.0/src/validate.sh domain governance
```

## Troubleshooting

### Common Issues

**Missing Navigation Header**
- Run: `./maintenance/v2.0/src/auto-sync.sh file path/to/file.md`
- Commit the changes

**Broken Symlinks**
- Check if source file exists
- Re-run migration for the file
- Validate with `ls -la` to see symlink targets

**Duplicate Page IDs**
- Check existing IDs: `find 2cu.atlassian.net -name "*.md" | grep -o '[0-9]\{9\}'`
- Use unique ID for new file
- Update navigation headers

**Navigation Not Updating**
- Ensure GitHub Actions is enabled
- Check workflow runs in Actions tab
- Run manual sync if needed

### Getting Help

1. Check the [FAQ](./dual-context-faq.md)
2. Review [maintenance guide](./dual-context-maintenance.md)
3. Check PDCA documentation in `/PDCA` directory
4. Open an issue with details

---

**💡 Pro Tip**: The dual-context system is designed to be invisible during normal use. Just create and edit files normally - the system handles the complexity! 🚀