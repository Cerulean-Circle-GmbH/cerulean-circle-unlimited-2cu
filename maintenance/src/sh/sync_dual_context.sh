#!/bin/bash

# sync_dual_context.sh - Synchronize content between .md (pages) and .entry.md (original) files
# Usage: ./sync_dual_context.sh [--dry-run] [--file <specific_file>]

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/../../../" && pwd)"
PAGES_DIR="$REPO_ROOT/2cu.atlassian.net/wiki/spaces/CCU/pages"

DRY_RUN=false
SPECIFIC_FILE=""

# Parse command line arguments
while [[ $# -gt 0 ]]; do
    case $1 in
        --dry-run)
            DRY_RUN=true
            shift
            ;;
        --file)
            SPECIFIC_FILE="$2"
            shift 2
            ;;
        *)
            echo "❌ Unknown option: $1"
            echo "Usage: $0 [--dry-run] [--file <specific_file>]"
            exit 1
            ;;
    esac
done

echo "🔄 Dual-Context Synchronization Tool"
echo "=================================="

if [ "$DRY_RUN" = true ]; then
    echo "🔍 DRY RUN MODE - No changes will be made"
fi

if [ -n "$SPECIFIC_FILE" ]; then
    echo "🎯 Targeting specific file: $SPECIFIC_FILE"
fi

echo ""

cd "$REPO_ROOT"

# Function to sync a specific entry file
sync_entry_file() {
    local entry_file="$1"
    local original_file="${entry_file%.entry.md}"
    
    # Skip if not a symlink (not part of dual-context architecture)
    if [ ! -L "$original_file" ]; then
        echo "⚠️  Skipping $original_file (not a symlink)"
        return
    fi
    
    # Get the target of the symlink (pages structure file)
    local pages_file=$(readlink "$original_file")
    if [[ ! "$pages_file" = /* ]]; then
        # Convert relative path to absolute
        pages_file="$(dirname "$original_file")/$pages_file"
    fi
    
    echo "📁 Processing: $(basename "$original_file")"
    echo "   📄 Entry file: $entry_file"
    echo "   🔗 Pages file: $pages_file"
    
    # Check if pages file exists
    if [ ! -f "$pages_file" ]; then
        echo "   ❌ ERROR: Pages file not found: $pages_file"
        return
    fi
    
    # Compare content (excluding links)
    local entry_content=$(sed 's|\.\./\(\.\./\)*2cu\.atlassian\.net/wiki/spaces/CCU/pages/[0-9]*/[^)]*\.md|LINK_PLACEHOLDER|g' "$entry_file")
    local pages_content=$(sed 's|\.\./[0-9]*/[^)]*\.md|LINK_PLACEHOLDER|g' "$pages_file")
    
    if [ "$entry_content" = "$pages_content" ]; then
        echo "   ✅ Content in sync"
        return
    fi
    
    echo "   ⚠️  Content differs between contexts"
    
    # Show file modification times
    local entry_mtime=$(stat -f "%m" "$entry_file" 2>/dev/null || echo "0")
    local pages_mtime=$(stat -f "%m" "$pages_file" 2>/dev/null || echo "0")
    
    echo "   📅 Entry file modified: $(date -r "$entry_mtime" 2>/dev/null || echo "unknown")"
    echo "   📅 Pages file modified: $(date -r "$pages_mtime" 2>/dev/null || echo "unknown")"
    
    # Determine sync direction based on modification time
    if [ "$pages_mtime" -gt "$entry_mtime" ]; then
        echo "   🔄 Pages file is newer → Sync to entry file"
        sync_direction="pages_to_entry"
    elif [ "$entry_mtime" -gt "$pages_mtime" ]; then
        echo "   🔄 Entry file is newer → Sync to pages file"
        sync_direction="entry_to_pages"
    else
        echo "   ❓ Same modification time → Manual review required"
        return
    fi
    
    if [ "$DRY_RUN" = true ]; then
        echo "   🔍 DRY RUN: Would sync $sync_direction"
        return
    fi
    
    # Perform sync
    if [ "$sync_direction" = "pages_to_entry" ]; then
        # Copy content from pages to entry, preserving entry's link format
        echo "   📤 Syncing pages → entry..."
        
        # Extract content without links from pages file
        local content_without_links=$(sed 's|\[.*\](\.\.\/[0-9]*\/[^)]*\.md)||g' "$pages_file")
        
        # Get link format from entry file
        local entry_links=$(grep -o '\[.*\](\.\.\/\(\.\./\)*2cu\.atlassian\.net/wiki/spaces/CCU/pages/[0-9]*/[^)]*\.md)' "$entry_file" || true)
        
        # This is complex - for now, just backup and manual review
        cp "$entry_file" "${entry_file}.sync.backup"
        echo "   💾 Created backup: ${entry_file}.sync.backup"
        echo "   ⚠️  Manual review required for link preservation"
        
    else
        # Sync entry to pages (simpler - just update content, fix links)
        echo "   📤 Syncing entry → pages..."
        
        # Copy content and fix link format
        cp "$entry_file" "${pages_file}.sync.backup"
        cp "$entry_file" "$pages_file"
        
        # Fix links in pages file to use pages format
        sed -i '' -E "s|\\.\\./(\\.\\./)*2cu\\.atlassian\\.net/wiki/spaces/CCU/pages/([0-9]+)/([^)]+\\.md)|../\\2/\\3|g" "$pages_file"
        
        echo "   ✅ Content synced and links optimized"
        echo "   💾 Created backup: ${pages_file}.sync.backup"
    fi
}

# Find all .entry.md files
echo "🔍 Scanning for .entry.md files..."

if [ -n "$SPECIFIC_FILE" ]; then
    if [[ "$SPECIFIC_FILE" = *.entry.md ]]; then
        ENTRY_FILES="$SPECIFIC_FILE"
    else
        ENTRY_FILES="${SPECIFIC_FILE}.entry.md"
    fi
else
    ENTRY_FILES=$(find . -name "*.entry.md" -type f 2>/dev/null)
fi

ENTRY_COUNT=$(echo "$ENTRY_FILES" | wc -l | tr -d ' ')
echo "📊 Found $ENTRY_COUNT .entry.md files"
echo ""

# Process each entry file
echo "$ENTRY_FILES" | while read -r entry_file; do
    if [ -n "$entry_file" ]; then
        sync_entry_file "$entry_file"
        echo ""
    fi
done

echo "🎯 Synchronization complete!"

if [ "$DRY_RUN" = true ]; then
    echo ""
    echo "💡 Tip: Run without --dry-run to apply changes"
fi
