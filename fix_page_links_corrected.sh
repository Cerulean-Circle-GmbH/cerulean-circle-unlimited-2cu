#!/bin/bash

# Fix Page Links Script - CORRECTED VERSION
# Properly converts complex relative paths to simple page-relative paths

echo "=== CORRECTED: Fix Page Link Consistency ==="

PAGES_DIR="2cu.atlassian.net/wiki/spaces/CCU/pages"

# Find files with the problematic pattern (using a simpler search)
files_with_links=$(find "$PAGES_DIR" -name "*.md" -type f | xargs grep -l "2cu\.atlassian\.net/wiki/spaces/CCU/pages/" 2>/dev/null)

if [ -z "$files_with_links" ]; then
    echo "No files found with problematic links!"
    exit 0
fi

echo "Files to fix: $(echo "$files_with_links" | wc -l)"

fixed_count=0

echo "$files_with_links" | while read -r file; do
    echo "Processing: $file"
    
    # Create backup if not exists
    if [ ! -f "${file}.corrected.backup" ]; then
        cp "$file" "${file}.corrected.backup"
    fi
    
    # Use a more direct approach with perl for better regex handling
    # Replace pattern: ../../../../../2cu.atlassian.net/wiki/spaces/CCU/pages/
    # With: ../
    
    perl -pi -e 's|\.\.\/\.\.\/\.\.\/\.\.\/\.\.\/2cu\.atlassian\.net\/wiki\/spaces\/CCU\/pages\/|../|g' "$file"
    
    # Also handle other variations
    perl -pi -e 's|\.\.\/\.\.\/\.\.\/\.\.\/2cu\.atlassian\.net\/wiki\/spaces\/CCU\/pages\/|../|g' "$file"
    perl -pi -e 's|\.\.\/\.\.\/\.\.\/2cu\.atlassian\.net\/wiki\/spaces\/CCU\/pages\/|../|g' "$file"
    perl -pi -e 's|\.\.\/\.\.\/2cu\.atlassian\.net\/wiki\/spaces\/CCU\/pages\/|../|g' "$file"
    perl -pi -e 's|\.\.\/2cu\.atlassian\.net\/wiki\/spaces\/CCU\/pages\/|../|g' "$file"
    
    echo "  ✓ Applied corrected regex patterns"
    fixed_count=$((fixed_count + 1))
done

echo ""
echo "=== Corrected Link Fix Complete ==="
echo "✓ Files processed with corrected patterns"
echo ""
echo "Verification test:"
echo "Files still with complex paths: $(find "$PAGES_DIR" -name "*.md" -type f | xargs grep -l "2cu\.atlassian\.net/wiki/spaces/CCU/pages/" 2>/dev/null | wc -l)"
