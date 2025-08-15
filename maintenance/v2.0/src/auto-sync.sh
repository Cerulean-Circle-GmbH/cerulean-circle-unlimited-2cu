#!/bin/bash
# auto-sync.sh - Intelligent dual-context synchronization

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/common.sh"

# Function to extract page ID from existing navigation
extract_page_id() {
    local file="$1"
    grep -oP '(?<=pages/)\d+(?=/)' "$file" | head -1 || echo ""
}

# Function to generate new page ID based on domain
generate_page_id() {
    local file="$1"
    local timestamp=$(date +%s%N | cut -b1-6)
    
    # Domain-based ID ranges (matching our migration)
    if [[ "$file" =~ governance/ ]]; then
        echo "3${timestamp}"
    elif [[ "$file" =~ product/ ]]; then
        echo "4${timestamp}"
    elif [[ "$file" =~ customer/ ]]; then
        echo "5${timestamp}"
    elif [[ "$file" =~ corporate-strategy/ ]]; then
        echo "6${timestamp}"
    else
        echo "7${timestamp}"  # Root/other
    fi
}

# Function to check if navigation needs update
needs_navigation_update() {
    local file="$1"
    
    # Check if file has navigation header
    if ! grep -q "📁" "$file" 2>/dev/null; then
        return 0  # Needs navigation
    fi
    
    # Check if symlinks exist
    local topic=$(get_topic_name "$file")
    local page_id=$(extract_page_id "$file")
    
    if [[ -z "$page_id" ]]; then
        return 0  # Missing page ID
    fi
    
    local page_dir="2cu.atlassian.net/wiki/spaces/CCU/pages/$page_id"
    if [[ ! -L "$page_dir/$topic.entry.md" ]]; then
        return 0  # Missing symlinks
    fi
    
    return 1  # Everything looks good
}

# Main sync function
sync_file() {
    local file="$1"
    local action="${2:-check}"  # check, add, update, remove
    
    case "$action" in
        "add"|"check")
            if needs_navigation_update "$file"; then
                local page_id=$(extract_page_id "$file")
                if [[ -z "$page_id" ]]; then
                    page_id=$(generate_page_id "$file")
                fi
                
                echo "🔄 Syncing: $file (ID: $page_id)"
                "$SCRIPT_DIR/../dual-context.sh" migrate "$file" "$page_id"
            else
                echo "✓ Already synced: $file"
            fi
            ;;
            
        "remove")
            # Handle file deletion - remove page structure
            local page_id=$(extract_page_id "$file")
            if [[ -n "$page_id" ]]; then
                local page_dir="2cu.atlassian.net/wiki/spaces/CCU/pages/$page_id"
                if [[ -d "$page_dir" ]]; then
                    echo "🗑️ Removing page structure: $page_dir"
                    rm -rf "$page_dir"
                fi
            fi
            ;;
            
        "update")
            # Handle navigation header updates
            echo "📝 Updating navigation for: $file"
            # Re-run migration to ensure consistency
            local page_id=$(extract_page_id "$file")
            if [[ -n "$page_id" ]]; then
                "$SCRIPT_DIR/../dual-context.sh" migrate "$file" "$page_id"
            fi
            ;;
    esac
}

# Batch sync function
batch_sync() {
    local files=("$@")
    local count=0
    local total=${#files[@]}
    
    echo "🚀 Starting batch sync for $total files..."
    
    for file in "${files[@]}"; do
        ((count++))
        echo "[$count/$total] Processing: $file"
        sync_file "$file" "check"
    done
    
    echo "✅ Batch sync complete!"
}

# Main execution
main() {
    local mode="${1:-help}"
    shift || true
    
    case "$mode" in
        "file")
            # Sync single file
            sync_file "$@"
            ;;
            
        "batch")
            # Sync multiple files
            batch_sync "$@"
            ;;
            
        "changed")
            # Sync git changed files
            local changed_files=$(git diff --name-only HEAD^ HEAD | grep '\.md$' | grep -v '📁' || true)
            if [[ -n "$changed_files" ]]; then
                batch_sync $changed_files
            else
                echo "No markdown files changed"
            fi
            ;;
            
        "all")
            # Re-sync entire repository
            echo "🔍 Finding files needing sync..."
            local files=$(find . -name "*.md" -type f | while read f; do
                if needs_navigation_update "$f"; then
                    echo "$f"
                fi
            done)
            
            if [[ -n "$files" ]]; then
                batch_sync $files
            else
                echo "✅ All files already synced!"
            fi
            ;;
            
        *)
            echo "Usage: $0 {file|batch|changed|all} [args...]"
            echo ""
            echo "Modes:"
            echo "  file <path> [action]  - Sync single file"
            echo "  batch <files...>      - Sync multiple files"
            echo "  changed              - Sync git changed files"
            echo "  all                  - Re-sync all files needing update"
            echo ""
            echo "Actions for file mode:"
            echo "  check   - Check and sync if needed (default)"
            echo "  add     - Force add navigation"
            echo "  update  - Update existing navigation"
            echo "  remove  - Remove page structure (for deletions)"
            exit 1
            ;;
    esac
}

main "$@"