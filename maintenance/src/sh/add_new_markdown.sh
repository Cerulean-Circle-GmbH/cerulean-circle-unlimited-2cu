#!/bin/bash

# add_new_markdown.sh - Add new markdown files to the dual-context architecture
# Usage: ./add_new_markdown.sh <path_to_new_md_file>
# Example: ./add_new_markdown.sh ./cerulean-circle-unlimited-2cu/new-folder/new-file.md

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/../../../" && pwd)"
PAGES_DIR="$REPO_ROOT/2cu.atlassian.net/wiki/spaces/CCU/pages"

if [ $# -eq 0 ]; then
    echo "❌ Usage: $0 <path_to_new_md_file>"
    echo "   Example: $0 ./cerulean-circle-unlimited-2cu/new-folder/new-file.md"
    exit 1
fi

NEW_FILE="$1"

# Convert to absolute path if relative
if [[ ! "$NEW_FILE" = /* ]]; then
    NEW_FILE="$REPO_ROOT/$NEW_FILE"
fi

echo "🔄 Adding new markdown file to dual-context architecture..."
echo "📁 File: $NEW_FILE"

# Check if file exists
if [ ! -f "$NEW_FILE" ]; then
    echo "❌ ERROR: File does not exist: $NEW_FILE"
    exit 1
fi

# Generate unique page ID (timestamp-based)
PAGE_ID=$(date +"%s%3N")
FILENAME=$(basename "$NEW_FILE")
FILENAME_NO_EXT="${FILENAME%.md}"

# Create pages directory entry
PAGES_TARGET_DIR="$PAGES_DIR/$PAGE_ID"
PAGES_TARGET_FILE="$PAGES_TARGET_DIR/${FILENAME_NO_EXT}.md"

echo "📋 Generated Page ID: $PAGE_ID"
echo "🎯 Pages target: $PAGES_TARGET_FILE"

# Create pages directory
mkdir -p "$PAGES_TARGET_DIR"

# PHASE 1: Copy original file to pages structure (real file location)
echo "📤 Phase 1: Copying file to pages structure..."
cp "$NEW_FILE" "$PAGES_TARGET_FILE"

# PHASE 2: Create git-based rollback point
echo "💾 Phase 2: Creating git rollback point..."
ROLLBACK_TAG="rollback-add-$(basename "$NEW_FILE" .md)-$(date +%Y%m%d-%H%M%S)"
git add .
git commit -m "ROLLBACK_POINT: Before adding $NEW_FILE to dual-context architecture" 2>/dev/null || true
git tag -a "$ROLLBACK_TAG" -m "Rollback point before integrating $(basename "$NEW_FILE")" 2>/dev/null || true
echo "🏷️  Rollback tag created: $ROLLBACK_TAG"

# PHASE 3: Create symlink from original location to pages
echo "🔗 Phase 3: Creating symlink in original location..."
# Create relative path (cross-platform compatible)
# Calculate how many directories up we need to go from the source file to repo root
SOURCE_DIR=$(dirname "$NEW_FILE")
DEPTH_COUNT=$(echo "$SOURCE_DIR" | sed "s|$REPO_ROOT||" | tr -cd '/' | wc -c | tr -d ' ')

# Build relative path
RELATIVE_PATH=""
for ((i=0; i<DEPTH_COUNT; i++)); do
    RELATIVE_PATH="../$RELATIVE_PATH"
done
RELATIVE_PATH="${RELATIVE_PATH}2cu.atlassian.net/wiki/spaces/CCU/pages/$PAGE_ID/${FILENAME_NO_EXT}.md"
ln -sf "$RELATIVE_PATH" "$NEW_FILE"

# PHASE 4: Create .entry.md file for original context  
echo "📝 Phase 4: Creating .entry.md for original context..."
ENTRY_FILE="${NEW_FILE}.entry.md"
# Copy original content to entry file (preserving original links)
cp "$PAGES_TARGET_FILE" "$ENTRY_FILE"

# PHASE 5: Scan for Atlassian links and add to mapping if found
echo "🔍 Phase 5: Scanning for Atlassian links..."
ATLASSIAN_LINKS=$(grep -o 'https://2cu\.atlassian\.net/wiki/spaces/CCU/pages/[0-9]*/[^)]*' "$ENTRY_FILE" 2>/dev/null || true)

if [ -n "$ATLASSIAN_LINKS" ]; then
    echo "⚠️  Found Atlassian links in new file. Consider running link conversion tools."
    echo "$ATLASSIAN_LINKS" | while read -r link; do
        echo "   📎 $link"
    done
fi

# PHASE 6: Update any internal links to use pages structure format
echo "🔧 Phase 6: Optimizing links in pages structure..."
# Fix any complex relative paths in the pages file
sed -i '' -E "s|\\.\\./(\\.\\./)*2cu\\.atlassian\\.net/wiki/spaces/CCU/pages/([0-9]+)/([^)]+\\.md)|../\\2/\\3|g" "$PAGES_TARGET_FILE"

echo ""
echo "✅ SUCCESS: New markdown file added to dual-context architecture!"
echo ""
echo "📊 Summary:"
echo "   📁 Original: $NEW_FILE (→ symlink to pages)"
echo "   📁 Pages: $PAGES_TARGET_FILE (→ real file)"
echo "   📁 Entry: $ENTRY_FILE (→ original context)"
echo "   🏷️  Rollback: $ROLLBACK_TAG (→ git tag for safety)"
echo ""
echo "🎯 Both navigation contexts are now available:"
echo "   - Access via symlink: Uses pages context navigation"
echo "   - Access via .entry.md: Uses original context navigation"
echo ""

if [ -n "$ATLASSIAN_LINKS" ]; then
    echo "⚠️  NEXT STEPS: Consider running Atlassian link conversion tools for optimal integration."
fi

echo "✅ File successfully integrated into dual-context architecture!"
