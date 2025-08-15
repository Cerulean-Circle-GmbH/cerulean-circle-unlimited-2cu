# 🔗 **Dual-Context Navigation Specification**

**📋 Backlinks:** [Repository Root](../index.md) | [Maintenance](./README.md)

**Version:** 1.0  
**Date:** 2025-01-27  
**Derived From:** UCP Navigation Pattern Success  
**Status:** Draft for Review

---

## **🎯 Overview**

This specification defines the standardized navigation pattern for creating dual-context accessibility between:
- **Hierarchical Repository Structure** (original organization)
- **Atlassian Page Structure** (mirrored wiki structure)

**Success Example:** UCP page navigation demonstrates proven bidirectional navigation with both GitHub and local symlink access.

---

## **📐 Navigation Architecture**

### **Core Principle: Bidirectional Navigation**
Every content page exists in TWO contexts with seamless navigation between them:

```
🌐 Hierarchical Structure ←→ Page Structure 🌐
   (Repository organized)    (Atlassian mirrored)
                ↕
         📋 Repository Index 
         (index.md aggregation)
```

### **Repository Index Integration**
The **`index.md`** file serves as the central navigation hub that aggregates all content across both contexts:

**Location:** `/index.md` (repository root)  
**Purpose:** Single-source directory of all topics with links to hierarchical structure  
**Link Format:** Points to hierarchical structure files (not page structure)

**Example Index Entry:**
```markdown
- [UCP](./cerulean-circle-unlimited-2cu/product/development/coast/eamducp-repository/UCP.md)
```

**Index.md Interactions:**
- **Repository Navigation**: Provides comprehensive topic discovery
- **Hierarchical Links**: All index links point to hierarchical structure (source of truth)
- **Cross-Reference Updates**: Must be updated when topics are added/moved/renamed
- **Search and Discovery**: Enables full-text search across repository structure

### **File Naming Convention**

| Context | File Pattern | Example | Purpose |
|---------|-------------|---------|---------|
| **Hierarchical** | `TOPIC.md` | `UCP.md` | Source of truth in repository structure |
| **Page Structure** | `TOPIC.md` | `UCP.md` | Mirror in Atlassian page structure |
| **Additional Context** | `TOPIC.page.md` | `UCP.page.md` | Alternative hierarchical view if needed |

---

## **🔗 Navigation Header Specification**

### **Pattern 1: Page Structure Navigation**
**Location:** `2cu.atlassian.net/wiki/spaces/CCU/pages/{id}/{TOPIC}.md`

```markdown
[📁 Parent Topic GitHub](/{path-to-parent}) | [🌐 Index Structure GitHub](/{path-to-hierarchical}) | [🌐 Index Structure local SymLink](./{TOPIC}.entry.md)
```

**Example from UCP:**
```markdown
[📁 EAMD.ucp Repository GitHub](/cerulean-circle-unlimited-2cu/product/development/coast/eamducp-repository.md) | [🌐 Index Structure GitHub](/cerulean-circle-unlimited-2cu/product/development/coast/eamducp-repository/UCP.md) | [🌐 Index Structure local SymLink](./UCP.entry.md)
```

### **Pattern 2: Hierarchical Structure Navigation**
**Location:** `cerulean-circle-unlimited-2cu/{domain}/{topic-path}/{TOPIC}.md`

```markdown
[📁 Parent Topic](../parent-topic.md) | [🌐 Page Structure GitHub](/{path-to-page-structure})
```

**Example from UCP:**
```markdown
[📁 EAMD.ucp Repository](../eamducp-repository.md) | [🌐 Page Structure GitHub](/2cu.atlassian.net/wiki/spaces/CCU/pages/288981051/UCP.md)
```

---

## **🔄 Symlink Architecture**

### **Page Structure → Hierarchical**
```bash
# In: 2cu.atlassian.net/wiki/spaces/CCU/pages/{id}/
{TOPIC}.entry.md → ../../../../../../cerulean-circle-unlimited-2cu/{domain}/{path}/{TOPIC}.md
```

### **Critical Requirements**
1. **Case Sensitivity**: All file names must match exactly (Linux compatibility)
2. **Relative Paths**: Calculate directory depth precisely for symlinks
3. **Testing**: Validate symlinks work in both macOS and Linux environments

---

## **📋 Implementation Checklist**

### **For Each Topic Page:**

#### **✅ Hierarchical Structure Setup**
- [ ] Content file exists: `cerulean-circle-unlimited-2cu/{domain}/{path}/{TOPIC}.md`
- [ ] Navigation header includes parent and page structure links
- [ ] Content includes appropriate internal cross-references
- [ ] File naming follows case-sensitive convention

#### **✅ Page Structure Setup**  
- [ ] Content file exists: `2cu.atlassian.net/wiki/spaces/CCU/pages/{id}/{TOPIC}.md`
- [ ] Navigation header includes parent, hierarchical GitHub, and local symlink
- [ ] Symlink file created: `{TOPIC}.entry.md` pointing to hierarchical source
- [ ] Symlink path calculation verified (count directory levels)

#### **✅ Cross-Reference Updates**
- [ ] Parent topic links updated to point to new navigation structure
- [ ] Related topics updated to maintain consistency
- [ ] **Repository index.md updated with hierarchical link**
  - [ ] Add/update entry: `[TOPIC](./cerulean-circle-unlimited-2cu/{domain}/{path}/{TOPIC}.md)`
  - [ ] Verify link points to hierarchical structure (not page structure)
  - [ ] Maintain alphabetical/categorical organization
  - [ ] Test link functionality in GitHub interface

#### **✅ Testing & Validation**
- [ ] All links functional in GitHub web interface
- [ ] Local symlinks work in development environment
- [ ] Case sensitivity validated (uppercase/lowercase consistency)
- [ ] No broken links or 404 errors

---

## **🛠️ Link Format Reference**

### **GitHub Repository Absolute Paths**
```markdown
[Link Text](/cerulean-circle-unlimited-2cu/path/to/file.md)
[Link Text](/2cu.atlassian.net/wiki/spaces/CCU/pages/id/file.md)
```

### **Relative Paths (Local Navigation)**
```markdown
[Link Text](../relative/path/file.md)
[Link Text](./file.md)
```

### **Symlink Target Calculation**
```bash
# From: 2cu.atlassian.net/wiki/spaces/CCU/pages/{id}/
# To: cerulean-circle-unlimited-2cu/{domain}/{path}/
# Path: ../../../../../../cerulean-circle-unlimited-2cu/{domain}/{path}/file.md
```

---

## **🎯 Testing Strategy**

### **Phase 1: Single Page Validation**
1. Apply pattern to EAMD parent page
2. Validate all navigation links function
3. Test symlinks in both macOS and Linux
4. Verify GitHub web interface compatibility

### **Phase 2: Related Page Consistency**
1. Update child topic navigation consistency
2. Validate parent-child navigation flows
3. Test cross-references between related topics
4. Ensure repository index consistency

### **Phase 3: Systematic Scaling**
1. Identify all topics requiring dual-context navigation
2. Prioritize based on importance and interconnections
3. Apply pattern systematically with validation at each step
4. Document any pattern variations or edge cases

---

## **⚠️ Common Pitfalls & Solutions**

### **Case Sensitivity Issues**
- **Problem**: Links work on macOS but fail on Linux
- **Solution**: Use exact case matching, prefer uppercase for main topics (UCP.md, not ucp.md)

### **Symlink Path Calculation**
- **Problem**: Broken symlinks due to incorrect relative paths
- **Solution**: Count directory levels precisely, test in clean environment

### **Navigation Consistency**
- **Problem**: Inconsistent navigation patterns across related pages
- **Solution**: Apply specification systematically, validate cross-references

### **GitHub vs Local Context**
- **Problem**: Links optimized for one context don't work in another
- **Solution**: Use repository absolute paths for GitHub, relative paths for local

---

## **📊 Success Metrics**

- ✅ **100% Navigation Functionality**: All links work in both contexts
- ✅ **Cross-Platform Compatibility**: Functions on macOS and Linux
- ✅ **User Experience**: Seamless navigation between hierarchical and page structures
- ✅ **Maintainability**: Clear patterns enable consistent application
- ✅ **Scalability**: Pattern applies systematically across all repository content

---

**🔗 Reference Implementation:** [UCP Navigation Example](../2cu.atlassian.net/wiki/spaces/CCU/pages/288981051/UCP.md)
