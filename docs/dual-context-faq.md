# ❓ Dual-Context Navigation - FAQ

**Frequently Asked Questions** about the dual-context navigation system

## General Questions

### What is dual-context navigation?

Dual-context navigation provides two ways to access every file:
- **Hierarchical**: Traditional folder structure (`governance/policies/security.md`)
- **Page-Based**: Confluence-style IDs (`pages/300000123/security.md`)

Both contexts show the same content, just organized differently.

### Why do we need two navigation systems?

1. **Flexibility**: Different users prefer different navigation styles
2. **Stability**: Page IDs don't change when files move
3. **Integration**: Works with both GitHub and Confluence
4. **Migration**: Easier transition from Confluence to GitHub

### How do I know which context I'm in?

Look at the URL path:
- **Hierarchical**: `cerulean-circle-unlimited-2cu/domain/topic.md`
- **Page-Based**: `2cu.atlassian.net/wiki/spaces/CCU/pages/ID/topic.md`

The navigation header also shows both paths clearly.

## Navigation Questions

### How do I switch between contexts?

Click on either part of the navigation header:
- Click 📁 path → Stay in hierarchical
- Click 🌐 path → Switch to page-based

Or use the symlinks:
- `.entry.md` → Enter page context
- `.page.md` → Return to hierarchical

### What are these .entry.md and .page.md files?

These are symlinks (shortcuts) that connect the two contexts:
- **`.entry.md`**: Found in page directories, points to hierarchical file
- **`.page.md`**: Found in hierarchical directories, points to page file

They're navigation aids - click them to jump contexts!

### Can I bookmark pages?

Yes! Both contexts support bookmarking:
- **Hierarchical**: Bookmark the GitHub URL
- **Page-Based**: Bookmark using the page ID (more stable)

Page IDs are especially good for bookmarks since they won't break if files move.

### How do I find a specific page ID?

Several ways:
1. Check the navigation header in the file
2. Browse `2cu.atlassian.net/wiki/spaces/CCU/pages/`
3. Search for the page ID directly
4. Check the PDCA migration logs

## File Management Questions

### How do I create a new file?

Just create it normally in the hierarchical structure:

```bash
# Create file
echo "# My Content" > governance/my-new-file.md

# Add, commit, push
git add governance/my-new-file.md
git commit -m "Add new file"
git push
```

The dual-context navigation is added automatically!

### What happens when I move or rename a file?

1. Move/rename the file in hierarchical structure
2. Commit and push
3. Auto-sync updates the navigation
4. Old page ID is preserved (unless you want a new one)

### Can I edit files in the page structure?

**No!** Always edit files in their hierarchical location. The page structure files are automatically maintained copies.

### How do I delete a file?

Delete from hierarchical structure:

```bash
rm governance/old-file.md
git add -A
git commit -m "Remove old file"
git push
```

The page structure and symlinks are cleaned up automatically.

## Technical Questions

### What are page IDs?

Page IDs are 9-digit numbers that uniquely identify each page:
- Based on Confluence page IDs
- Domain-specific ranges (governance: 3XXXXXXXX, product: 4XXXXXXXX)
- Remain constant even if files move

### How are page IDs generated?

For new files:
1. Domain prefix (3, 4, 5, 6, or 7)
2. Timestamp suffix (6 digits)
3. Result: Unique 9-digit ID

Example: Governance file created at timestamp 123456 = 300123456

### Can I use custom page IDs?

Yes, when manually migrating:

```bash
./maintenance/v2.0/dual-context.sh migrate "file.md" "999999999"
```

But let auto-sync handle it for normal use.

### What if there's a page ID conflict?

The system checks for duplicates before assigning IDs. If a conflict occurs:
1. System generates a new timestamp
2. Manually specify a different ID
3. Check logs for conflict details

## Troubleshooting Questions

### My file doesn't have navigation - what do I do?

Run manual sync:

```bash
./maintenance/v2.0/src/auto-sync.sh file path/to/your/file.md
```

Or wait for next push - GitHub Actions will add it.

### The navigation header looks broken

This might happen if:
1. File was edited outside the system
2. Manual edits to navigation header
3. Sync was interrupted

Fix: Re-run migration for that file.

### Symlinks appear broken in my editor

Some editors show symlinks differently. They're working if:
- `ls -la` shows them pointing correctly
- You can click them in GitHub web interface
- No errors in migration logs

### GitHub Actions isn't adding navigation

Check:
1. Workflow is enabled in Actions tab
2. You're pushing to main branch
3. File is a `.md` file
4. No workflow errors in Actions log

## Best Practices Questions

### Should I use hierarchical or page-based browsing?

- **Hierarchical**: Better for exploring and understanding structure
- **Page-Based**: Better for direct access and stable links

Use whatever feels natural - you can always switch!

### How should I share links?

- **Internal team**: Either context works
- **External/long-term**: Use page IDs (won't break)
- **Documentation**: Include both for flexibility

### What's the best way to organize files?

Follow the domain structure:
- `governance/` - Policies, procedures
- `product/` - Product docs
- `customer/` - Customer content
- `corporate-strategy/` - Strategic docs

Keep related content together in hierarchical structure.

## Advanced Questions

### Can I migrate other repositories?

Yes! The tools are portable:
1. Copy `/maintenance/v2.0/` directory
2. Adjust domain mappings in scripts
3. Run migration
4. Set up GitHub Actions

### How do I validate the entire system?

```bash
# Check all navigation headers
find . -name "*.md" -type f -exec grep -L "📁.*🌐" {} \;

# Verify all symlinks
find . -name "*.entry.md" -o -name "*.page.md" | xargs ls -la

# Count files in each context
echo "Hierarchical: $(find cerulean-circle-unlimited-2cu -name "*.md" -type f | wc -l)"
echo "Page-based: $(find 2cu.atlassian.net -name "*.md" -type f | wc -l)"
```

### Can I disable dual-context for specific files?

Not recommended, but possible:
1. Add file to `.gitignore` for GitHub Actions
2. Don't run sync on that file
3. Document why it's excluded

### How do I contribute to the dual-context system?

1. Check out the PDCA documents
2. Review the maintenance scripts
3. Test changes thoroughly
4. Submit PRs with clear descriptions

---

**Still have questions?** Check the [complete guide](./dual-context-navigation-guide.md) or review the PDCA documentation! 🚀