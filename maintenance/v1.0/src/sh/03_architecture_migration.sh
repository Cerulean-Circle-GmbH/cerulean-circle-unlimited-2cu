#!/bin/bash

# Architecture Migration Script
# Inverts symlink direction: pages become real files, original becomes symlinks

echo "=== Architecture Migration: Invert Symlink Direction ==="
echo "WARNING: This is a complex migration process!"
echo ""

# Safety check
read -p "This will fundamentally change the repository structure. Continue? (yes/no): " confirm
if [ "$confirm" != "yes" ]; then
    echo "Migration cancelled."
    exit 1
fi

echo ""
echo "=== PHASE 1: DUPLICATE FILES (copy original → pages) ==="

# Create backup of current state
echo "Creating migration backup..."
mkdir -p migration_backup
cp -r cerulean-circle-unlimited-2cu migration_backup/
cp -r 2cu.atlassian.net migration_backup/
echo "✓ Migration backup created"

# Read the URL to file mapping to get all the files we need to migrate
if [ ! -f "url_to_file_mapping.txt" ]; then
    echo "ERROR: url_to_file_mapping.txt not found!"
    exit 1
fi

duplicated_count=0

echo "Duplicating files from original structure to pages structure..."
while IFS='|' read -r url page_id page_title target_file; do
    echo "Processing: $page_title (ID: $page_id)"
    
    # Skip if target file doesn't exist
    if [ ! -f "$target_file" ]; then
        echo "  SKIP: Target file doesn't exist: $target_file"
        continue
    fi
    
    # Create clean link name from page title
    link_name=$(echo "$page_title" | sed 's/[^a-zA-Z0-9._-]/_/g')
    if [ -z "$link_name" ]; then
        link_name="page_$page_id"
    fi
    
    # Define the page file path
    page_file="2cu.atlassian.net/wiki/spaces/CCU/pages/$page_id/$link_name.md"
    
    # Check if symlink exists in pages structure
    if [ -L "$page_file" ]; then
        echo "  Copying: $target_file → $page_file"
        
        # Remove the symlink and copy the real file
        rm "$page_file"
        cp "$target_file" "$page_file"
        
        echo "  ✓ Duplicated to pages structure"
        duplicated_count=$((duplicated_count + 1))
    else
        echo "  SKIP: No symlink found at $page_file"
    fi
    
done < url_to_file_mapping.txt

echo ""
echo "=== PHASE 2: CREATE REVERSE SYMLINKS (original → pages) ==="

replaced_count=0

# Now replace original files with symlinks to pages
while IFS='|' read -r url page_id page_title target_file; do
    echo "Processing: $target_file"
    
    # Skip if target file doesn't exist
    if [ ! -f "$target_file" ]; then
        echo "  SKIP: Target file doesn't exist"
        continue
    fi
    
    # Create clean link name from page title
    link_name=$(echo "$page_title" | sed 's/[^a-zA-Z0-9._-]/_/g')
    if [ -z "$link_name" ]; then
        link_name="page_$page_id"
    fi
    
    # Define the page file path
    page_file="2cu.atlassian.net/wiki/spaces/CCU/pages/$page_id/$link_name.md"
    
    # Check if the page file exists (was duplicated)
    if [ -f "$page_file" ]; then
        echo "  Creating symlink: $target_file → $page_file"
        
        # Calculate relative path from target file to page file
        target_dir=$(dirname "$target_file")
        rel_path=$(python3 -c "
import os
target_dir = '$target_dir'
page_file = '$page_file'
print(os.path.relpath(page_file, target_dir))
" 2>/dev/null || echo "$page_file")
        
        # Create backup of original file
        cp "$target_file" "${target_file}.migration.backup"
        
        # Replace with symlink
        rm "$target_file"
        ln -s "$rel_path" "$target_file"
        
        echo "  ✓ Created reverse symlink"
        replaced_count=$((replaced_count + 1))
    else
        echo "  SKIP: Page file doesn't exist at $page_file"
    fi
    
done < url_to_file_mapping.txt

echo ""
echo "=== PHASE 3: UPDATE LINKS IN PAGES STRUCTURE ==="

echo "Updating all links in pages structure to be consistent..."

# Find all markdown files in the pages structure
page_files=$(find 2cu.atlassian.net -name "*.md" -type f)

if [ -z "$page_files" ]; then
    echo "No page files found to update"
else
    echo "$page_files" | while read -r page_file; do
        echo "Updating links in: $page_file"
        
        # Create backup
        cp "$page_file" "${page_file}.linkupdate.backup"
        
        # Update any remaining relative paths to be consistent with pages structure
        # Convert any links that might point to original structure to point to pages structure
        
        # This is a complex pattern - we need to update relative links that might have been broken
        # For now, ensure all Atlassian wiki links point to the pages structure consistently
        sed -i.tmp 's|(\.\./[^)]*cerulean-circle-unlimited-2cu/[^)]*)|(\./2cu.atlassian.net/wiki/spaces/CCU/pages/[NEEDS_MANUAL_FIX])|g' "$page_file"
        rm -f "${page_file}.tmp"
        
        echo "  ✓ Updated: $page_file"
    done
fi

echo ""
echo "=== MIGRATION SUMMARY ==="
echo "✓ Duplicated files: $duplicated_count"
echo "✓ Created reverse symlinks: $replaced_count"
echo "✓ Updated page files: $(echo "$page_files" | wc -l)"
echo ""
echo "Architecture is now INVERTED:"
echo "  - Pages structure contains REAL files"
echo "  - Original structure contains SYMLINKS to pages"
echo ""
echo "Backup locations:"
echo "  - migration_backup/ (complete backup)"
echo "  - *.migration.backup (original files)"
echo "  - *.linkupdate.backup (page files before link updates)"
echo ""
echo "NEXT STEPS:"
echo "1. Test navigation flow"
echo "2. Fix any remaining broken links manually"
echo "3. Run cleanup script when satisfied"
