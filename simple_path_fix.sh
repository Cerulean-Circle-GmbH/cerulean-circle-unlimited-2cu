#!/bin/bash

# Simple Path Fix Script for Atlassian Links
# Replace all complex relative paths with simple absolute paths from repo root

echo "=== Simple Atlassian Link Path Fixer ==="

# Find all files with any relative paths to 2cu.atlassian.net (including complex ones)
files_with_paths=$(grep -r -l "2cu\.atlassian\.net/wiki/spaces/CCU/pages/" . --include="*.md" | grep -v backup)

if [ -z "$files_with_paths" ]; then
    echo "No files found with Atlassian wiki links."
    exit 0
fi

echo "Files to fix:"
echo "$files_with_paths"
echo ""

fixed_count=0

# Process each file
echo "$files_with_paths" | while IFS= read -r file; do
    echo "Processing: $file"
    
    # Create backup if not already exists
    if [ ! -f "${file}.simplefix.backup" ]; then
        cp "$file" "${file}.simplefix.backup"
        echo "  Created backup: ${file}.simplefix.backup"
    fi
    
    # Replace ANY path pattern to 2cu.atlassian.net with simple ./2cu.atlassian.net
    # This handles:
    # - ../../../../../2cu.atlassian.net/...
    # - ../../../../2cu.atlassian.net/...
    # - ../../../2cu.atlassian.net/...
    # etc.
    
    sed -i.tmp 's|\.\./[../]*2cu\.atlassian\.net|./2cu.atlassian.net|g' "$file"
    rm -f "${file}.tmp"
    
    echo "  ✓ Fixed paths in: $file"
    fixed_count=$((fixed_count + 1))
done

echo ""
echo "=== Summary ==="
echo "Files processed: $(echo "$files_with_paths" | wc -l)"
echo "All complex relative paths converted to simple ./2cu.atlassian.net/ format"
echo ""
echo "Backup files created with .simplefix.backup extension"
