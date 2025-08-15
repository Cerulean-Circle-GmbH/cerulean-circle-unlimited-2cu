#!/bin/bash

# 🔄 Update/modify existing dual-context content
# Based on Dual-Context Navigation Specification v1.0
# Reference: UCP navigation pattern

set -euo pipefail

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Script configuration
WORKSPACE_ROOT="/workspace"
ATLASSIAN_BASE="2cu.atlassian.net/wiki/spaces/CCU/pages"

# Usage function
usage() {
    echo -e "${BLUE}Usage: $0 <topic-path> [options]${NC}"
    echo -e "  topic-path: Path to the markdown file (hierarchical or page structure)"
    echo -e "\nOptions:"
    echo -e "  --refresh-nav    Only refresh navigation headers"
    echo -e "  --fix-links      Fix broken symlinks"
    echo -e "  --sync-content   Sync content between contexts"
    echo -e "  --check-only     Check status without making changes"
    echo -e "\nExamples:"
    echo -e "  $0 cerulean-circle-unlimited-2cu/product/development/coast/eamducp-repository/UCP.md"
    echo -e "  $0 2cu.atlassian.net/wiki/spaces/CCU/pages/288981051/UCP.md --refresh-nav"
    exit 1
}

# Parse arguments
if [ $# -lt 1 ]; then
    usage
fi

TOPIC_PATH="$1"
MODE="full"

# Parse options
shift
while [[ $# -gt 0 ]]; do
    case $1 in
        --refresh-nav)
            MODE="refresh-nav"
            shift
            ;;
        --fix-links)
            MODE="fix-links"
            shift
            ;;
        --sync-content)
            MODE="sync-content"
            shift
            ;;
        --check-only)
            MODE="check-only"
            shift
            ;;
        *)
            echo -e "${RED}Unknown option: $1${NC}"
            usage
            ;;
    esac
done

# Remove leading slash if present
TOPIC_PATH="${TOPIC_PATH#/}"

# Determine if it's hierarchical or page structure
IS_PAGE_STRUCTURE=false
if [[ "$TOPIC_PATH" == *"$ATLASSIAN_BASE"* ]]; then
    IS_PAGE_STRUCTURE=true
fi

echo -e "${BLUE}🔄 Updating dual-context content...${NC}"
echo -e "  Mode: $MODE"
echo -e "  Path: $TOPIC_PATH"
echo -e "  Type: $([ "$IS_PAGE_STRUCTURE" = true ] && echo "Page Structure" || echo "Hierarchical")"

# Extract topic name
TOPIC_NAME=$(basename "$TOPIC_PATH" .md)

# Find both context files
if [ "$IS_PAGE_STRUCTURE" = true ]; then
    # Starting from page structure
    PAGE_FILE="$WORKSPACE_ROOT/$TOPIC_PATH"
    PAGE_DIR=$(dirname "$PAGE_FILE")
    PAGE_ID=$(basename "$PAGE_DIR")
    ENTRY_FILE="$PAGE_DIR/$TOPIC_NAME.entry.md"
    
    # Find hierarchical file through symlink
    if [ -L "$ENTRY_FILE" ]; then
        HIERARCHICAL_REL=$(readlink "$ENTRY_FILE")
        cd "$PAGE_DIR"
        HIERARCHICAL_FILE=$(realpath "$HIERARCHICAL_REL" 2>/dev/null || echo "")
        cd - > /dev/null
    else
        echo -e "${RED}Error: Entry symlink not found or broken${NC}"
        exit 1
    fi
else
    # Starting from hierarchical structure
    HIERARCHICAL_FILE="$WORKSPACE_ROOT/$TOPIC_PATH"
    HIERARCHICAL_DIR=$(dirname "$HIERARCHICAL_FILE")
    
    # Find page structure through navigation header or search
    if [ -f "$HIERARCHICAL_FILE" ]; then
        # Try to extract page ID from navigation header
        PAGE_LINK=$(grep -oP '(?<=Page Structure GitHub\]\()[^)]+' "$HIERARCHICAL_FILE" 2>/dev/null || echo "")
        if [ -n "$PAGE_LINK" ]; then
            PAGE_ID=$(echo "$PAGE_LINK" | grep -oP '(?<=pages/)\d+' || echo "")
        fi
    fi
    
    if [ -z "$PAGE_ID" ]; then
        echo -e "${YELLOW}Cannot determine page ID from file${NC}"
        echo -e "Please provide the page structure path instead"
        exit 1
    fi
    
    PAGE_DIR="$WORKSPACE_ROOT/$ATLASSIAN_BASE/$PAGE_ID"
    PAGE_FILE="$PAGE_DIR/$TOPIC_NAME.md"
    ENTRY_FILE="$PAGE_DIR/$TOPIC_NAME.entry.md"
fi

# Validate files exist
echo -e "\n${YELLOW}Checking file status...${NC}"
ERRORS=0

for FILE in "$HIERARCHICAL_FILE" "$PAGE_FILE"; do
    if [ -e "$FILE" ]; then
        echo -e "${GREEN}✓ $(basename $FILE) exists${NC}"
    else
        echo -e "${RED}✗ $(basename $FILE) missing${NC}"
        ((ERRORS++))
    fi
done

# Check symlinks
if [ -L "$ENTRY_FILE" ] && [ -e "$ENTRY_FILE" ]; then
    echo -e "${GREEN}✓ Entry symlink is valid${NC}"
else
    echo -e "${RED}✗ Entry symlink is broken or missing${NC}"
    ((ERRORS++))
fi

PAGE_SYMLINK="$HIERARCHICAL_DIR/$TOPIC_NAME.page.md"
if [ -L "$PAGE_SYMLINK" ]; then
    if [ -e "$PAGE_SYMLINK" ]; then
        echo -e "${GREEN}✓ Page symlink is valid${NC}"
    else
        echo -e "${YELLOW}! Page symlink is broken${NC}"
    fi
else
    echo -e "${YELLOW}! Page symlink doesn't exist${NC}"
fi

if [ "$MODE" = "check-only" ]; then
    if [ $ERRORS -eq 0 ]; then
        echo -e "\n${GREEN}✅ Dual-context structure is valid${NC}"
    else
        echo -e "\n${RED}❌ Found $ERRORS issues${NC}"
    fi
    exit $ERRORS
fi

# Perform requested operation
case $MODE in
    "refresh-nav")
        echo -e "\n${YELLOW}Refreshing navigation headers...${NC}"
        
        # Extract parent info
        PARENT_DIR=$(dirname "${TOPIC_PATH#$ATLASSIAN_BASE/*/}")
        PARENT_NAME=$(basename "$PARENT_DIR")
        
        # Create navigation headers
        HIERARCHICAL_NAV="[📁 $(echo $PARENT_NAME | sed 's/-/ /g' | sed 's/\b\(.\)/\u\1/g')](../$PARENT_NAME.md) | [🌐 Page Structure GitHub](/$ATLASSIAN_BASE/$PAGE_ID/$TOPIC_NAME.md) | [🌐 Page Structure local SymLink](./$TOPIC_NAME.page.md)"
        
        PAGE_NAV="[📁 $(echo $PARENT_NAME | sed 's/-/ /g' | sed 's/\b\(.\)/\u\1/g') GitHub](/${HIERARCHICAL_FILE#$WORKSPACE_ROOT/}) | [🌐 Index Structure GitHub](/${HIERARCHICAL_FILE#$WORKSPACE_ROOT/}) | [🌐 Index Structure local SymLink](./$TOPIC_NAME.entry.md)"
        
        # Update files
        for FILE in "$HIERARCHICAL_FILE" "$PAGE_FILE"; do
            if [ -f "$FILE" ]; then
                CONTENT=$(tail -n +3 "$FILE" 2>/dev/null || cat "$FILE")
                if [ "$FILE" = "$HIERARCHICAL_FILE" ]; then
                    echo -e "$HIERARCHICAL_NAV\n\n$CONTENT" > "$FILE"
                else
                    echo -e "$PAGE_NAV\n\n$CONTENT" > "$FILE"
                fi
                echo -e "${GREEN}✓ Updated $(basename $FILE)${NC}"
            fi
        done
        ;;
        
    "fix-links")
        echo -e "\n${YELLOW}Fixing symlinks...${NC}"
        
        # Fix entry symlink
        if [ ! -L "$ENTRY_FILE" ] || [ ! -e "$ENTRY_FILE" ]; then
            cd "$PAGE_DIR"
            DEPTH=$(echo "$ATLASSIAN_BASE/$PAGE_ID" | tr -cd '/' | wc -c)
            RELATIVE_PATH=""
            for ((i=0; i<$DEPTH+1; i++)); do
                RELATIVE_PATH="../$RELATIVE_PATH"
            done
            ln -sf "${RELATIVE_PATH}${HIERARCHICAL_FILE#$WORKSPACE_ROOT/}" "$TOPIC_NAME.entry.md"
            echo -e "${GREEN}✓ Fixed entry symlink${NC}"
        fi
        
        # Fix page symlink
        if [ ! -L "$PAGE_SYMLINK" ] || [ ! -e "$PAGE_SYMLINK" ]; then
            cd "$HIERARCHICAL_DIR"
            PAGE_RELATIVE=$(python3 -c "import os.path; print(os.path.relpath('$PAGE_FILE', '$(pwd)'))")
            ln -sf "$PAGE_RELATIVE" "$TOPIC_NAME.page.md"
            echo -e "${GREEN}✓ Fixed page symlink${NC}"
        fi
        ;;
        
    "sync-content")
        echo -e "\n${YELLOW}Syncing content between contexts...${NC}"
        
        # Determine which file is newer
        HIER_TIME=$(stat -c %Y "$HIERARCHICAL_FILE" 2>/dev/null || echo 0)
        PAGE_TIME=$(stat -c %Y "$PAGE_FILE" 2>/dev/null || echo 0)
        
        if [ $HIER_TIME -gt $PAGE_TIME ]; then
            echo -e "Hierarchical file is newer - syncing to page structure"
            # Get content without header
            CONTENT=$(tail -n +3 "$HIERARCHICAL_FILE")
            # Get page nav header
            NAV=$(head -n 1 "$PAGE_FILE")
            echo -e "$NAV\n\n$CONTENT" > "$PAGE_FILE"
            echo -e "${GREEN}✓ Synced to page structure${NC}"
        elif [ $PAGE_TIME -gt $HIER_TIME ]; then
            echo -e "Page structure file is newer - syncing to hierarchical"
            # Get content without header
            CONTENT=$(tail -n +3 "$PAGE_FILE")
            # Get hierarchical nav header
            NAV=$(head -n 1 "$HIERARCHICAL_FILE")
            echo -e "$NAV\n\n$CONTENT" > "$HIERARCHICAL_FILE"
            echo -e "${GREEN}✓ Synced to hierarchical${NC}"
        else
            echo -e "${GREEN}✓ Files are already in sync${NC}"
        fi
        ;;
        
    "full")
        echo -e "\n${YELLOW}Performing full update...${NC}"
        # This combines all operations
        $0 "$TOPIC_PATH" --refresh-nav
        $0 "$TOPIC_PATH" --fix-links
        $0 "$TOPIC_PATH" --sync-content
        ;;
esac

echo -e "\n${BLUE}═══════════════════════════════════════${NC}"
echo -e "${GREEN}✅ Update completed successfully!${NC}"