#!/bin/bash

# Fix Relative Paths Script for Atlassian Links
# Corrects overly complex relative paths to simple repo-root relative paths

echo "=== Atlassian Link Path Fixer ==="

# Repository root (where we want paths to be relative to)
REPO_ROOT="/Users/Shared/Workspaces/2cuGitHub/Web4Articles/workspacesMountPoint/2cuGitHub/cerulean-circle-unlimited-2cu"

# Counter for fixes
fixed_files_count=0

# Find all files with the problematic long relative paths
echo "Finding files with incorrect relative paths..."

# Search for files containing the long relative paths to 2cu.atlassian.net
files_with_long_paths=$(grep -r -l "\.\./.*2cu\.atlassian\.net" ./cerulean-circle-unlimited-2cu --include="*.md" 2>/dev/null || true)

if [ -z "$files_with_long_paths" ]; then
    echo "No files found with long relative paths."
    exit 0
fi

echo "Files to fix:"
echo "$files_with_long_paths"
echo ""

# Process each file
echo "$files_with_long_paths" | while read -r file; do
    echo "Processing: $file"
    
    # Create backup if not already exists
    if [ ! -f "${file}.pathfix.backup" ]; then
        cp "$file" "${file}.pathfix.backup"
        echo "  Created backup: ${file}.pathfix.backup"
    fi
    
    # Get the directory of the current file
    file_dir=$(dirname "$file")
    
    # Calculate how many levels deep this file is from repo root
    # Remove the repo root path and count directory separators
    relative_from_root=$(echo "$file_dir" | sed "s|$REPO_ROOT/||" | sed "s|$REPO_ROOT||")
    
    if [ -z "$relative_from_root" ] || [ "$relative_from_root" = "." ]; then
        # File is in repo root
        correct_path="./2cu.atlassian.net"
    else
        # Count directory levels to determine how many ../ we need
        level_count=$(echo "$relative_from_root" | tr -cd '/' | wc -c)
        
        # Build the correct relative path
        if [ "$level_count" -eq 0 ]; then
            correct_path="./2cu.atlassian.net"
        else
            # Create the appropriate number of ../
            up_path=""
            for i in $(seq 1 $level_count); do
                up_path="../$up_path"
            done
            correct_path="${up_path}2cu.atlassian.net"
        fi
    fi
    
    echo "  File location: $relative_from_root"
    echo "  Correct path should be: $correct_path"
    
    # Fix all instances of long relative paths in this file
    # Match patterns like ../../../2cu.atlassian.net or ../../../../2cu.atlassian.net etc.
    sed -i.tmp "s|\.\./[../]*2cu\.atlassian\.net|$correct_path|g" "$file"
    rm -f "${file}.tmp"
    
    echo "  Updated paths in: $file"
    fixed_files_count=$((fixed_files_count + 1))
    echo ""
done

echo "=== Summary ==="
echo "Files processed: $(echo "$files_with_long_paths" | wc -l)"
echo "Path corrections applied"
echo ""
echo "Backup files created with .pathfix.backup extension"
echo "To restore: for f in \$(find . -name '*.pathfix.backup'); do mv \"\$f\" \"\${f%.pathfix.backup}\"; done"
