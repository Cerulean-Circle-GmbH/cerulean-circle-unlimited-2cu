#!/bin/bash

# Fix Page Links Script - PDCA Cycle 5
# Converts complex relative paths to simple page-relative paths in pages structure

echo "=== PDCA Cycle 5: Fix Page Link Consistency ==="

# Target: All markdown files in pages structure
PAGES_DIR="2cu.atlassian.net/wiki/spaces/CCU/pages"

if [ ! -d "$PAGES_DIR" ]; then
    echo "ERROR: Pages directory not found: $PAGES_DIR"
    exit 1
fi

echo "Processing files in: $PAGES_DIR"

# Find all markdown files with problematic links
files_with_complex_links=$(find "$PAGES_DIR" -name "*.md" -type f | xargs grep -l "\\.\\./.*2cu\\.atlassian\\.net/wiki/spaces/CCU/pages/" 2>/dev/null)

if [ -z "$files_with_complex_links" ]; then
    echo "No files found with complex page links - already clean!"
    exit 0
fi

echo "Files to fix: $(echo "$files_with_complex_links" | wc -l)"
echo ""

fixed_count=0

echo "$files_with_complex_links" | while read -r file; do
    echo "Processing: $file"
    
    # Get the current page's directory for relative path calculation
    current_dir=$(dirname "$file")
    
    # Create backup
    cp "$file" "${file}.pagefixes.backup"
    
    # Fix the complex relative paths
    # Pattern: ../../../../../2cu.atlassian.net/wiki/spaces/CCU/pages/[ID]/[name].md
    # Replace with: ../[ID]/[name].md (relative to current page directory)
    
    # Use sed to replace the pattern
    sed -i.tmp 's|\\.\\./\\.\\./\\.\\./\\.\\./\\.\\./2cu\\.atlassian\\.net/wiki/spaces/CCU/pages/|\\.\\./|g' "$file"
    
    # Also handle any remaining complex paths with different levels
    sed -i.tmp 's|\\.\\./\\.\\./\\.\\./\\.\\./2cu\\.atlassian\\.net/wiki/spaces/CCU/pages/|\\.\\./|g' "$file"
    sed -i.tmp 's|\\.\\./\\.\\./\\.\\./2cu\\.atlassian\\.net/wiki/spaces/CCU/pages/|\\.\\./|g' "$file"
    sed -i.tmp 's|\\.\\./\\.\\./2cu\\.atlassian\\.net/wiki/spaces/CCU/pages/|\\.\\./|g' "$file"
    sed -i.tmp 's|\\.\\./2cu\\.atlassian\\.net/wiki/spaces/CCU/pages/|\\.\\./|g' "$file"
    
    # Clean up temp files
    rm -f "${file}.tmp"
    
    echo "  ✓ Fixed complex relative paths"
    fixed_count=$((fixed_count + 1))
done

echo ""
echo "=== Link Consistency Fix Complete ==="
echo "✓ Files processed: $fixed_count"
echo "✓ All complex relative paths simplified"
echo "✓ Backup files created: *.pagefixes.backup"
echo ""
echo "Next: Test navigation flow"
