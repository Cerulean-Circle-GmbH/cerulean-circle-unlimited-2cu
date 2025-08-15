#!/bin/bash

# Link Update Script for Atlassian Export
# Replaces Atlassian URLs with relative local paths

echo "=== Atlassian Link Updater ==="

# Backup counter
backup_counter=0
updated_files_count=0

# Process each successful mapping
while IFS='|' read -r url page_id page_title target_file; do
    echo "Processing URL: $url"
    echo "  Target: $target_file"
    
    # Create clean link name from page title
    link_name=$(echo "$page_title" | sed 's/[^a-zA-Z0-9._-]/_/g')
    if [ -z "$link_name" ]; then
        link_name="page_$page_id"
    fi
    
    # Construct the local path to the symbolic link
    local_symlink_path="./2cu.atlassian.net/wiki/spaces/CCU/pages/$page_id/$link_name.md"
    
    # Find all files that contain this URL
    files_with_url=$(grep -r -l -F "$url" . --include="*.md" 2>/dev/null || true)
    
    if [ ! -z "$files_with_url" ]; then
        echo "  Found in files:"
        echo "$files_with_url" | while read -r file; do
            echo "    - $file"
            
            # Create backup if this is the first change to this file
            if [ ! -f "${file}.backup" ]; then
                cp "$file" "${file}.backup"
                echo "      Created backup: ${file}.backup"
            fi
            
            # Calculate relative path from the file to the symlink
            file_dir=$(dirname "$file")
            rel_path=$(python3 -c "
import os
file_dir = '$file_dir'
symlink_path = '$local_symlink_path'
print(os.path.relpath(symlink_path, file_dir))
" 2>/dev/null || echo "$local_symlink_path")
            
            # Escape special characters for sed
            escaped_url=$(echo "$url" | sed 's/[[\.*^$()+?{|]/\\&/g')
            
            # Replace the URL with the relative path
            # Handle both markdown link formats: [text](url) and just url
            sed -i.tmp "s|$escaped_url|$rel_path|g" "$file"
            rm -f "${file}.tmp"
            
            echo "      Updated: $url -> $rel_path"
            updated_files_count=$((updated_files_count + 1))
        done
    else
        echo "  No files found containing this URL"
    fi
    
    echo ""
done < url_to_file_mapping.txt

echo "=== Summary ==="
echo "URLs processed: $(wc -l < url_to_file_mapping.txt)"
echo "Files updated: $updated_files_count"
echo ""
echo "Note: Backup files (.backup) created for all modified files"
echo "To restore: for f in \$(find . -name '*.backup'); do mv \"\$f\" \"\${f%.backup}\"; done"
