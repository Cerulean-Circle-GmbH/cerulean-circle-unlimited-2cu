#!/bin/bash

# validate_links.sh - Validate link integrity across the dual-context architecture
# Usage: ./validate_links.sh [--fix] [--context pages|original|both]

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/../../../" && pwd)"
PAGES_DIR="$REPO_ROOT/2cu.atlassian.net/wiki/spaces/CCU/pages"

FIX_MODE=false
CONTEXT="both"

# Parse command line arguments
while [[ $# -gt 0 ]]; do
    case $1 in
        --fix)
            FIX_MODE=true
            shift
            ;;
        --context)
            CONTEXT="$2"
            if [[ ! "$CONTEXT" =~ ^(pages|original|both)$ ]]; then
                echo "❌ Invalid context. Use: pages, original, or both"
                exit 1
            fi
            shift 2
            ;;
        *)
            echo "❌ Unknown option: $1"
            echo "Usage: $0 [--fix] [--context pages|original|both]"
            exit 1
            ;;
    esac
done

echo "🔍 Link Integrity Validation Tool"
echo "================================="
echo "🎯 Context: $CONTEXT"

if [ "$FIX_MODE" = true ]; then
    echo "🔧 Fix mode: ENABLED"
else
    echo "🔍 Scan mode: Reporting issues only"
fi

echo ""

cd "$REPO_ROOT"

# Counters
TOTAL_LINKS=0
BROKEN_LINKS=0
FIXED_LINKS=0

# Function to validate a specific link
validate_link() {
    local file="$1"
    local link="$2"
    local line_num="$3"
    
    TOTAL_LINKS=$((TOTAL_LINKS + 1))
    
    # Extract link target (remove markdown syntax)
    local target=$(echo "$link" | sed 's/.*](\([^)]*\)).*/\1/')
    
    # Convert relative path to absolute
    local absolute_target
    if [[ "$target" = /* ]]; then
        absolute_target="$target"
    else
        absolute_target="$(dirname "$file")/$target"
    fi
    
    # Normalize path
    absolute_target=$(cd "$(dirname "$absolute_target")" 2>/dev/null && pwd)/$(basename "$absolute_target") 2>/dev/null || echo "$absolute_target"
    
    # Check if target exists
    if [ -f "$absolute_target" ] || [ -L "$absolute_target" ]; then
        echo "   ✅ Line $line_num: $target"
        return 0
    else
        echo "   ❌ Line $line_num: BROKEN → $target"
        BROKEN_LINKS=$((BROKEN_LINKS + 1))
        
        if [ "$FIX_MODE" = true ]; then
            # Try to find the file in the repository
            local basename_target=$(basename "$target" .md)
            local found_files=$(find . -name "*${basename_target}*" -type f 2>/dev/null | grep -v ".git" | head -5)
            
            if [ -n "$found_files" ]; then
                echo "     🔍 Possible matches found:"
                echo "$found_files" | while read -r match; do
                    echo "       📁 $match"
                done
                echo "     ⚠️  Manual review required for automatic fix"
            else
                echo "     ❓ No similar files found"
            fi
        fi
        
        return 1
    fi
}

# Function to validate links in a file
validate_file() {
    local file="$1"
    local context_name="$2"
    
    if [ ! -f "$file" ]; then
        return
    fi
    
    echo "📄 Validating: $file ($context_name)"
    
    # Find all markdown links
    local links_with_lines=$(grep -n '\[.*\](.*\.md)' "$file" 2>/dev/null || true)
    
    if [ -z "$links_with_lines" ]; then
        echo "   📝 No markdown links found"
        return
    fi
    
    # Process each link
    echo "$links_with_lines" | while IFS=: read -r line_num line_content; do
        # Extract all links from the line
        echo "$line_content" | grep -o '\[.*\]([^)]*\.md)' | while read -r link; do
            validate_link "$file" "$link" "$line_num"
        done
    done
}

# Function to validate pages context
validate_pages_context() {
    echo "🏗️  VALIDATING PAGES CONTEXT"
    echo "============================"
    
    if [ ! -d "$PAGES_DIR" ]; then
        echo "❌ Pages directory not found: $PAGES_DIR"
        return
    fi
    
    find "$PAGES_DIR" -name "*.md" -type f | while read -r pages_file; do
        validate_file "$pages_file" "pages"
    done
}

# Function to validate original context
validate_original_context() {
    echo "📚 VALIDATING ORIGINAL CONTEXT"
    echo "=============================="
    
    find . -name "*.entry.md" -type f | while read -r entry_file; do
        validate_file "$entry_file" "original"
    done
}

# Function to validate symlinks
validate_symlinks() {
    echo "🔗 VALIDATING SYMLINKS"
    echo "======================"
    
    find . -name "*.md" -type l | while read -r symlink; do
        local target=$(readlink "$symlink")
        local absolute_target
        
        if [[ "$target" = /* ]]; then
            absolute_target="$target"
        else
            absolute_target="$(dirname "$symlink")/$target"
        fi
        
        if [ -f "$absolute_target" ]; then
            echo "✅ $symlink → $target"
        else
            echo "❌ BROKEN SYMLINK: $symlink → $target"
            BROKEN_LINKS=$((BROKEN_LINKS + 1))
        fi
    done
}

# Run validation based on context
case "$CONTEXT" in
    "pages")
        validate_pages_context
        ;;
    "original")
        validate_original_context
        ;;
    "both")
        validate_pages_context
        echo ""
        validate_original_context
        ;;
esac

echo ""
validate_symlinks

echo ""
echo "📊 VALIDATION SUMMARY"
echo "===================="
echo "🔗 Total links checked: $TOTAL_LINKS"
echo "❌ Broken links found: $BROKEN_LINKS"

if [ "$BROKEN_LINKS" -eq 0 ]; then
    echo "🎉 All links are valid!"
    exit 0
else
    echo "⚠️  $BROKEN_LINKS broken links require attention"
    
    if [ "$FIX_MODE" = false ]; then
        echo ""
        echo "💡 Tip: Run with --fix to attempt automatic repairs"
    fi
    
    exit 1
fi
