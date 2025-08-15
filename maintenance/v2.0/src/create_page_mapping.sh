#!/bin/bash

# Create page ID mapping for mass migration to dual-context navigation
# Maps existing page IDs and generates new ones for unmapped files

set -euo pipefail

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Configuration
WORKSPACE_ROOT="/workspace"
MAPPING_FILE="$WORKSPACE_ROOT/page_id_mapping.txt"
ATLASSIAN_BASE="2cu.atlassian.net/wiki/spaces/CCU/pages"

echo -e "${BLUE}Creating Page ID Mapping for Mass Migration${NC}"
echo -e "${BLUE}===========================================${NC}\n"

# Initialize mapping file
{
    echo "# Page ID Mapping for Mass Migration"
    echo "# Generated: $(date)"
    echo "# Format: PAGE_ID:FILE_PATH"
    echo ""
} > "$MAPPING_FILE"

# Step 1: Map existing page IDs
echo -e "${YELLOW}Step 1: Mapping existing page IDs...${NC}"
EXISTING_COUNT=0

find "$WORKSPACE_ROOT/$ATLASSIAN_BASE" -type d -name "[0-9]*" | sort -n | while read -r dir; do
    PAGE_ID=$(basename "$dir")
    
    # Find .md files in this directory (excluding .entry.md)
    for file in "$dir"/*.md; do
        if [ -f "$file" ] && [[ ! "$file" =~ \.entry\.md$ ]]; then
            FILENAME=$(basename "$file")
            
            # Try to find corresponding hierarchical file
            HIER_FILE=$(find "$WORKSPACE_ROOT/cerulean-circle-unlimited-2cu" -name "$FILENAME" -type f 2>/dev/null | head -1)
            
            if [ -n "$HIER_FILE" ]; then
                REL_PATH="${HIER_FILE#$WORKSPACE_ROOT/}"
                echo "$PAGE_ID:$REL_PATH" >> "$MAPPING_FILE"
                ((EXISTING_COUNT++))
                echo -e "  ${GREEN}✓${NC} Mapped: $PAGE_ID -> $REL_PATH"
            fi
        fi
    done
done

echo -e "${GREEN}Found $EXISTING_COUNT existing mappings${NC}\n"

# Step 2: Extract all files from index.md
echo -e "${YELLOW}Step 2: Extracting files from index.md...${NC}"
INDEX_FILES=$(grep -oE '\./[^)]+\.md' "$WORKSPACE_ROOT/index.md" | sed 's|^\./||' | sort -u)
TOTAL_FILES=$(echo "$INDEX_FILES" | wc -l)
echo -e "Found $TOTAL_FILES unique files in index.md\n"

# Step 3: Generate new IDs for unmapped files
echo -e "${YELLOW}Step 3: Generating IDs for unmapped files...${NC}"
NEXT_ID=300000000
NEW_COUNT=0

echo "$INDEX_FILES" | while read -r FILE_PATH; do
    # Check if already mapped
    if ! grep -q ":$FILE_PATH$" "$MAPPING_FILE"; then
        # Check if file exists
        if [ -f "$WORKSPACE_ROOT/$FILE_PATH" ]; then
            echo "$NEXT_ID:$FILE_PATH" >> "$MAPPING_FILE"
            ((NEW_COUNT++))
            echo -e "  ${BLUE}+${NC} New ID: $NEXT_ID -> $FILE_PATH"
            ((NEXT_ID++))
        else
            echo -e "  ${YELLOW}!${NC} File not found: $FILE_PATH"
        fi
    fi
done

# Step 4: Summary
echo -e "\n${BLUE}===========================================${NC}"
echo -e "${GREEN}Mapping Complete!${NC}\n"

# Count final mappings
FINAL_COUNT=$(grep -c "^[0-9]" "$MAPPING_FILE")
echo -e "Total mappings created: $FINAL_COUNT"
echo -e "  - Existing mappings: $EXISTING_COUNT"
echo -e "  - New mappings: $((FINAL_COUNT - EXISTING_COUNT))"
echo -e "\nMapping saved to: $MAPPING_FILE"

# Create summary by domain
echo -e "\n${YELLOW}Files by domain:${NC}"
for domain in corporate-strategy customer governance marketing people product; do
    COUNT=$(grep -c "cerulean-circle-unlimited-2cu/$domain/" "$MAPPING_FILE" || true)
    if [ $COUNT -gt 0 ]; then
        echo -e "  $domain: $COUNT files"
    fi
done