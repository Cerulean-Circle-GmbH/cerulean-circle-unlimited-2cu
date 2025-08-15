#!/bin/bash
# auto-recovery.sh - Automated repository recovery script

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/common.sh"

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

# Recovery modes
MODE="${1:-diagnose}"

# Function to diagnose issues
diagnose_issues() {
    echo -e "${BLUE}🔍 Diagnosing repository health...${NC}"
    
    local issues=0
    
    # Check for files without navigation
    echo -n "Checking navigation headers... "
    MISSING_NAV=$(find cerulean-circle-unlimited-2cu -name "*.md" -type f -exec grep -L "📁.*🌐" {} \; 2>/dev/null | wc -l)
    if [ "$MISSING_NAV" -gt 0 ]; then
        echo -e "${RED}$MISSING_NAV files missing navigation${NC}"
        ((issues++))
    else
        echo -e "${GREEN}OK${NC}"
    fi
    
    # Check for broken symlinks
    echo -n "Checking symlinks... "
    BROKEN_LINKS=$(find . -type l -xtype l 2>/dev/null | wc -l)
    if [ "$BROKEN_LINKS" -gt 0 ]; then
        echo -e "${RED}$BROKEN_LINKS broken symlinks${NC}"
        ((issues++))
    else
        echo -e "${GREEN}OK${NC}"
    fi
    
    # Check page structure
    echo -n "Checking page structure... "
    if [ ! -d "2cu.atlassian.net/wiki/spaces/CCU/pages" ]; then
        echo -e "${RED}Missing${NC}"
        ((issues++))
    else
        echo -e "${GREEN}OK${NC}"
    fi
    
    # Check file counts
    echo -n "Checking file consistency... "
    HIER_COUNT=$(find cerulean-circle-unlimited-2cu -name "*.md" -type f 2>/dev/null | wc -l)
    PAGE_COUNT=$(find 2cu.atlassian.net -name "*.entry.md" -type l 2>/dev/null | wc -l)
    if [ "$HIER_COUNT" -ne "$PAGE_COUNT" ]; then
        echo -e "${YELLOW}Mismatch (Hier: $HIER_COUNT, Page: $PAGE_COUNT)${NC}"
        ((issues++))
    else
        echo -e "${GREEN}OK ($HIER_COUNT files)${NC}"
    fi
    
    return $issues
}

# Function to fix navigation headers
fix_navigation() {
    echo -e "${BLUE}🔧 Fixing missing navigation...${NC}"
    
    find cerulean-circle-unlimited-2cu -name "*.md" -type f -exec grep -L "📁.*🌐" {} \; | while read file; do
        echo "Processing: $file"
        # Check if file has page ID in any form
        if grep -q "pages/[0-9]\{9\}" "$file" 2>/dev/null; then
            PAGE_ID=$(grep -oP '(?<=pages/)\d{9}' "$file" | head -1)
        else
            # Generate new page ID
            PAGE_ID=$("$SCRIPT_DIR/auto-sync.sh" generate_page_id "$file")
        fi
        
        "$SCRIPT_DIR/../dual-context.sh" migrate "$file" "$PAGE_ID"
    done
}

# Function to fix broken symlinks
fix_symlinks() {
    echo -e "${BLUE}🔗 Fixing broken symlinks...${NC}"
    
    # Remove broken symlinks
    find . -type l -xtype l -delete 2>/dev/null || true
    
    # Recreate symlinks for files with navigation
    find cerulean-circle-unlimited-2cu -name "*.md" -type f -exec grep -l "📁.*🌐" {} \; | while read file; do
        PAGE_ID=$(grep -oP '(?<=pages/)\d{9}' "$file" | head -1)
        if [ -n "$PAGE_ID" ]; then
            echo "Recreating symlinks for: $file (ID: $PAGE_ID)"
            "$SCRIPT_DIR/../dual-context.sh" migrate "$file" "$PAGE_ID"
        fi
    done
}

# Function to rebuild page structure
rebuild_structure() {
    echo -e "${BLUE}🏗️ Rebuilding page structure...${NC}"
    
    # Create base structure if missing
    mkdir -p "2cu.atlassian.net/wiki/spaces/CCU/pages"
    
    # Rebuild from files with navigation
    find cerulean-circle-unlimited-2cu -name "*.md" -type f -exec grep -l "📁.*🌐" {} \; | while read file; do
        PAGE_ID=$(grep -oP '(?<=pages/)\d{9}' "$file" | head -1)
        if [ -n "$PAGE_ID" ]; then
            "$SCRIPT_DIR/../dual-context.sh" migrate "$file" "$PAGE_ID"
        fi
    done
}

# Function to create recovery checkpoint
create_checkpoint() {
    local tag_name="recovery-checkpoint-$(date +%Y%m%d-%H%M%S)"
    echo -e "${BLUE}📍 Creating recovery checkpoint: $tag_name${NC}"
    
    git add -A
    git commit -m "Recovery checkpoint before auto-recovery" || true
    git tag "$tag_name"
    
    echo -e "${GREEN}Checkpoint created: $tag_name${NC}"
}

# Function to perform full recovery
full_recovery() {
    echo -e "${YELLOW}🚀 Starting full recovery...${NC}"
    
    # Create checkpoint
    create_checkpoint
    
    # Fix all issues
    fix_navigation
    fix_symlinks
    rebuild_structure
    
    # Validate
    echo -e "${BLUE}✅ Validating recovery...${NC}"
    if diagnose_issues; then
        echo -e "${GREEN}✅ Recovery successful!${NC}"
        return 0
    else
        echo -e "${RED}❌ Recovery incomplete - manual intervention may be required${NC}"
        return 1
    fi
}

# Function to rollback to last known good
rollback() {
    echo -e "${YELLOW}⏪ Rolling back to last known good state...${NC}"
    
    # Find last successful commit
    LAST_GOOD=$(git log --grep="Migration complete\|Recovery successful" --format="%H" -n 1)
    
    if [ -z "$LAST_GOOD" ]; then
        echo -e "${RED}No known good state found${NC}"
        return 1
    fi
    
    echo "Rolling back to: $LAST_GOOD"
    git reset --hard "$LAST_GOOD"
    
    echo -e "${GREEN}Rollback complete${NC}"
}

# Main execution
main() {
    case "$MODE" in
        "diagnose")
            diagnose_issues || echo -e "${YELLOW}Issues found: $?${NC}"
            ;;
        
        "fix-navigation")
            fix_navigation
            ;;
        
        "fix-symlinks")
            fix_symlinks
            ;;
        
        "rebuild")
            rebuild_structure
            ;;
        
        "recover")
            full_recovery
            ;;
        
        "rollback")
            rollback
            ;;
        
        "help"|*)
            echo "Usage: $0 {diagnose|fix-navigation|fix-symlinks|rebuild|recover|rollback}"
            echo ""
            echo "Modes:"
            echo "  diagnose        - Check repository health"
            echo "  fix-navigation  - Fix missing navigation headers"
            echo "  fix-symlinks    - Fix broken symlinks"
            echo "  rebuild         - Rebuild page structure"
            echo "  recover         - Full automatic recovery"
            echo "  rollback        - Rollback to last known good"
            echo ""
            echo "Example:"
            echo "  $0 diagnose     # Check for issues"
            echo "  $0 recover      # Fix all issues"
            exit 1
            ;;
    esac
}

# Run main
main