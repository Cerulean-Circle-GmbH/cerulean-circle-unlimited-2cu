# 🔧 Maintenance v2.0 - Dual-Context Navigation System

**📋 Backlinks:** [Repository Root](/index.md) | [Maintenance Specification](../specification.md)

**Version:** 2.0  
**Date:** 2025-01-27  
**Based On:** Dual-Context Navigation Specification v1.0  
**Reference Implementation:** UCP Navigation Pattern

---

## 🎯 Overview

Maintenance v2.0 implements the standardized dual-context navigation pattern for managing content that exists in both:
- **Hierarchical Repository Structure** (original organization)
- **Atlassian Page Structure** (mirrored wiki structure)

This system provides tools for migrating, creating, adding, and updating content while maintaining bidirectional navigation between contexts.

---

## 🏗️ Architecture

### Core Components

1. **migrate** - Migrate existing content to dual-context structure
2. **create** - Create new dual-context content from scratch  
3. **add** - Add existing content to the dual-context system
4. **update** - Modify/update existing dual-context content

### File Structure Pattern

For each content page, the system maintains:

```
hierarchical-path/TOPIC.md          # Source of truth in repository
page-structure/[id]/TOPIC.md        # Mirror in Atlassian structure
page-structure/[id]/TOPIC.entry.md  # Symlink to hierarchical source
```

---

## 🛠️ Tools

### migrate.sh
Migrates existing single-context content to dual-context structure.

**Usage:**
```bash
./src/migrate.sh <topic-path> <page-id>
```

**Example:**
```bash
./src/migrate.sh cerulean-circle-unlimited-2cu/product/development/coast/eamducp-repository/UCP.md 288981051
```

### create.sh
Creates new content with dual-context structure from the start.

**Usage:**
```bash
./src/create.sh <hierarchical-path> <page-id> <topic-name>
```

**Example:**
```bash
./src/create.sh cerulean-circle-unlimited-2cu/product/newfeature 123456789 FeatureDoc
```

### add.sh
Adds existing content file to the dual-context system.

**Usage:**
```bash
./src/add.sh <existing-file-path> <page-id>
```

**Example:**
```bash
./src/add.sh cerulean-circle-unlimited-2cu/existing/doc.md 987654321
```

### update.sh
Updates navigation headers and links in existing dual-context content.

**Usage:**
```bash
./src/update.sh <topic-path>
```

**Example:**
```bash
./src/update.sh cerulean-circle-unlimited-2cu/product/development/coast/eamducp-repository/UCP.md
```

---

## 📐 Navigation Header Patterns

### Hierarchical Structure Header
```markdown
[📁 Parent Topic](../parent-topic.md) | [🌐 Page Structure GitHub](/2cu.atlassian.net/wiki/spaces/CCU/pages/{id}/TOPIC.md) | [🌐 Page Structure local SymLink](./TOPIC.page.md)
```

### Page Structure Header
```markdown
[📁 Parent Topic GitHub](/hierarchical/path/to/parent) | [🌐 Index Structure GitHub](/hierarchical/path/to/TOPIC.md) | [🌐 Index Structure local SymLink](./TOPIC.entry.md)
```

---

## 🔄 Workflow

### For New Content
1. Use `create.sh` to establish dual-context structure
2. Edit content in hierarchical location (source of truth)
3. Navigation links automatically maintained

### For Existing Content
1. Use `migrate.sh` to convert to dual-context
2. Verify navigation links function correctly
3. Update parent/child references as needed

### For Updates
1. Use `update.sh` to refresh navigation headers
2. Maintain consistency across related pages
3. Update repository index.md as needed

---

## ✅ Validation

Each tool performs validation to ensure:
- Case-sensitive file naming consistency
- Correct symlink path calculation
- Navigation header format compliance
- Link functionality in both contexts
- Repository index.md updates

---

## 🧪 Testing

Run the test suite:
```bash
./test/run_all_tests.sh
```

Individual tests:
```bash
./test/test_migrate.sh
./test/test_create.sh
./test/test_add.sh
./test/test_update.sh
```

---

## ⚠️ Important Notes

1. **Case Sensitivity**: All file operations respect Linux case sensitivity
2. **Source of Truth**: Hierarchical structure files are always the source of truth
3. **Symlink Direction**: Page structure entries always symlink to hierarchical files
4. **Index Updates**: Repository index.md must be manually updated after operations
5. **GitHub Compatibility**: All paths use GitHub repository absolute format

---

## 📊 Success Criteria

- ✅ All navigation links functional in both GitHub and local contexts
- ✅ Symlinks work across macOS and Linux environments
- ✅ Consistent navigation patterns across all content
- ✅ Repository index maintains accurate topic listing
- ✅ Tools handle edge cases gracefully

---

**🔗 Reference:** [UCP Implementation Example](/2cu.atlassian.net/wiki/spaces/CCU/pages/288981051/UCP.md)