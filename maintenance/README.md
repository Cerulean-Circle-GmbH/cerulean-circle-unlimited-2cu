# 🔧 Maintenance System Overview

This directory contains two versions of the maintenance system for the Cerulean Circle Unlimited 2CU repository.

## 📁 Directory Structure

```
maintenance/
├── README.md            # This file
├── specification.md     # Dual-Context Navigation Specification
├── v1.0/               # Original maintenance system
│   ├── README.md       # v1.0 documentation
│   ├── src/           # v1.0 maintenance scripts
│   ├── test/          # v1.0 test suite
│   └── git-hooks/     # v1.0 git automation
└── v2.0/               # New dual-context system
    ├── README.md       # v2.0 documentation
    ├── dual-context.sh # Main interface
    ├── src/           # v2.0 tools
    │   ├── migrate.sh  # Migrate existing files
    │   ├── create.sh   # Create new dual-context files
    │   ├── add.sh      # Add existing files
    │   └── update.sh   # Update/modify files
    └── examples/       # Usage examples
```

## 🔄 Version Comparison

### v1.0 - Original Maintenance System
- **Purpose**: Initial link mapping and architecture migration
- **Focus**: Converting Atlassian export structure
- **Key Features**:
  - Link mapping between original and new structure
  - Architecture inversion tools
  - Dual entry creation
  - Git hooks for automation

### v2.0 - Dual-Context Navigation System
- **Purpose**: Implement standardized dual-context navigation
- **Focus**: Bidirectional navigation between hierarchical and page structures
- **Key Features**:
  - Migrate existing content to dual-context
  - Create new content with dual-context from start
  - Add existing files to the system
  - Update/sync content between contexts
  - Based on UCP navigation pattern success

## 🚀 Quick Start

### Using v2.0 (Recommended)

```bash
# Check status of files
./v2.0/dual-context.sh status

# Migrate an existing file
./v2.0/dual-context.sh migrate path/to/file.md PAGE_ID

# Create new dual-context content
./v2.0/dual-context.sh create path/to/directory PAGE_ID TopicName

# See all commands
./v2.0/dual-context.sh help
```

### Migration Path

1. **Identify unmigrated files**: Use `status` command
2. **Determine page IDs**: Check Atlassian export structure
3. **Migrate files**: Use appropriate v2.0 tool
4. **Update references**: Update parent pages and index.md
5. **Test navigation**: Verify links work in GitHub

## 📋 Key Concepts

- **Hierarchical Structure**: Original repository organization (source of truth)
- **Page Structure**: Mirrored Atlassian wiki structure
- **Dual-Context**: Content accessible from both structures
- **Navigation Headers**: Standardized links between contexts
- **Symlinks**: Connect page structure to hierarchical files

## 📚 Documentation

- [Dual-Context Navigation Specification](./specification.md)
- [v1.0 Documentation](./v1.0/README.md)
- [v2.0 Documentation](./v2.0/README.md)
- [UCP Reference Implementation](/cerulean-circle-unlimited-2cu/product/development/coast/eamducp-repository/UCP.md)

## ⚠️ Important Notes

1. Always use hierarchical structure as source of truth
2. Page IDs must match Atlassian export structure
3. Test all navigation links after migration
4. Update repository index.md when adding new topics
5. Maintain case-sensitive file naming

---

**Version:** 2.0  
**Updated:** 2025-01-27  
**Status:** Active Development