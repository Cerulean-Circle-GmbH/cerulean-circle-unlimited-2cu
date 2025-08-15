#!/bin/bash

# Link Mapping Script for Atlassian Export
# Creates symbolic links and URL mapping for converted Confluence export

echo "=== Atlassian Link Mapper ==="

# Create URL to File mapping
echo "Creating URL to file mapping..."

# Initialize mapping files
> url_to_file_mapping.txt
> not_found_urls.txt

# Process each URL from atlassian_urls.txt
while IFS= read -r url; do
    echo "Processing: $url"
    
    # Extract page ID and title from URL
    page_id=$(echo "$url" | sed -n 's/.*\/pages\/\([0-9]*\)\/.*/\1/p')
    page_title=$(echo "$url" | sed -n 's/.*\/pages\/[0-9]*\/\([^#]*\).*/\1/p' | sed 's/+/ /g' | sed 's/%20/ /g')
    
    echo "  Page ID: $page_id"
    echo "  Page Title: $page_title"
    
    # Search for potential matching files (case insensitive, flexible matching)
    potential_files=$(find ./cerulean-circle-unlimited-2cu -name "*.md" -type f | xargs grep -l "$page_title" 2>/dev/null || true)
    
    if [ -z "$potential_files" ]; then
        # Try searching by simplified title (remove special chars)
        simple_title=$(echo "$page_title" | sed 's/[^a-zA-Z0-9]//g' | tr '[:upper:]' '[:lower:]')
        potential_files=$(find ./cerulean-circle-unlimited-2cu -name "*${simple_title}*" -type f 2>/dev/null || true)
    fi
    
    if [ -z "$potential_files" ]; then
        # Try searching in filenames with various patterns
        title_patterns=(
            "${page_title// /-}"
            "${page_title// /_}"
            "$(echo "$page_title" | tr '[:upper:]' '[:lower:]')"
            "${page_title// /}"
        )
        
        for pattern in "${title_patterns[@]}"; do
            potential_files=$(find ./cerulean-circle-unlimited-2cu -iname "*${pattern}*.md" -type f 2>/dev/null || true)
            if [ ! -z "$potential_files" ]; then
                break
            fi
        done
    fi
    
    if [ ! -z "$potential_files" ]; then
        # Take the first match
        target_file=$(echo "$potential_files" | head -1)
        echo "  Found match: $target_file"
        echo "$url|$page_id|$page_title|$target_file" >> url_to_file_mapping.txt
        
        # Create symbolic link directory structure
        link_dir="2cu.atlassian.net/wiki/spaces/CCU/pages/$page_id"
        mkdir -p "$link_dir"
        
        # Calculate relative path from link location to target file
        rel_path=$(realpath --relative-to="$link_dir" "$target_file" 2>/dev/null || python3 -c "
import os
print(os.path.relpath('$target_file', '$link_dir'))
" 2>/dev/null || echo "../../../../$target_file")
        
        # Create symbolic link (remove existing if present)
        link_name=$(echo "$page_title" | sed 's/[^a-zA-Z0-9._-]/_/g')
        if [ -z "$link_name" ]; then
            link_name="page_$page_id"
        fi
        
        ln -sf "$rel_path" "$link_dir/$link_name.md" 2>/dev/null || echo "  Warning: Could not create symlink"
        echo "  Created symlink: $link_dir/$link_name.md -> $rel_path"
    else
        echo "  No match found"
        echo "$url|$page_id|$page_title" >> not_found_urls.txt
    fi
    
    echo ""
done < atlassian_urls.txt

echo "=== Summary ==="
echo "Total URLs processed: $(wc -l < atlassian_urls.txt)"
echo "Mapped successfully: $(wc -l < url_to_file_mapping.txt)"
echo "Not found: $(wc -l < not_found_urls.txt)"
echo ""
echo "Files created:"
echo "- url_to_file_mapping.txt: Successful mappings"
echo "- not_found_urls.txt: URLs without matches"
echo "- 2cu.atlassian.net/: Symbolic link structure"
