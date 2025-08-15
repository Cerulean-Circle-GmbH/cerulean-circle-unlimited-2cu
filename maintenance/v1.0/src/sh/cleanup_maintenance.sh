#!/bin/bash

# cleanup_maintenance.sh - Clean up backup files and temporary artifacts
# Usage: ./cleanup_maintenance.sh [--dry-run] [--aggressive]

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/../../../" && pwd)"

DRY_RUN=false
AGGRESSIVE=false

# Parse command line arguments
while [[ $# -gt 0 ]]; do
    case $1 in
        --dry-run)
            DRY_RUN=true
            shift
            ;;
        --aggressive)
            AGGRESSIVE=true
            shift
            ;;
        *)
            echo "❌ Unknown option: $1"
            echo "Usage: $0 [--dry-run] [--aggressive]"
            exit 1
            ;;
    esac
done

echo "🧹 Maintenance Cleanup Tool"
echo "=========================="

if [ "$DRY_RUN" = true ]; then
    echo "🔍 DRY RUN MODE - No files will be deleted"
fi

if [ "$AGGRESSIVE" = true ]; then
    echo "⚠️  AGGRESSIVE MODE - Will remove more backup files"
fi

echo ""

cd "$REPO_ROOT"

# Function to clean specific pattern
clean_pattern() {
    local pattern="$1"
    local description="$2"
    
    echo "🔍 Scanning for: $description"
    
    local files=$(find . -name "$pattern" -type f 2>/dev/null | grep -v ".git" || true)
    
    if [ -z "$files" ]; then
        echo "   📝 No files found matching pattern: $pattern"
        return
    fi
    
    local count=$(echo "$files" | wc -l | tr -d ' ')
    echo "   📊 Found $count files:"
    
    echo "$files" | while read -r file; do
        if [ -n "$file" ]; then
            echo "     📁 $file"
            
            if [ "$DRY_RUN" = false ]; then
                rm "$file"
                echo "       🗑️  Deleted"
            else
                echo "       🔍 Would delete"
            fi
        fi
    done
}

# Standard cleanup patterns
echo "🧹 STANDARD CLEANUP"
echo "==================="

clean_pattern "*.backup" "General backup files (.backup)"
clean_pattern "*.sync.backup" "Sync backup files (.sync.backup)"

if [ "$AGGRESSIVE" = true ]; then
    echo ""
    echo "🧹 AGGRESSIVE CLEANUP"
    echo "===================="
    
    clean_pattern "*.migration.backup" "Migration backup files (.migration.backup)"
    
    echo "⚠️  Note: .migration.backup files contain original content before architecture inversion."
    echo "   These are used by sync tools and dual-context creation."
    echo "   Only delete if you're certain the dual-context architecture is stable."
fi

echo ""
echo "📊 CLEANUP SUMMARY"
echo "=================="

if [ "$DRY_RUN" = true ]; then
    echo "🔍 Dry run completed - no files were actually deleted"
    echo "💡 Run without --dry-run to perform cleanup"
else
    echo "✅ Cleanup completed"
fi

echo ""
echo "🎯 RECOMMENDATIONS"
echo "=================="
echo "✅ Regular cleanup: Run monthly to remove .backup and .sync.backup files"
echo "⚠️  Aggressive cleanup: Only use --aggressive when dual-context is stable"
echo "💾 Before cleanup: Ensure git status is clean and changes are committed"