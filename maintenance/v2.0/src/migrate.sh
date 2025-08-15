#!/bin/bash

# 🔄 Migrate existing content to dual-context navigation structure
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
    echo -e "${BLUE}Usage: $0 <hierarchical-path> <page-id>${NC}"
    echo -e "  hierarchical-path: Path to the markdown file in hierarchical structure"
    echo -e "  page-id: Atlassian page ID for the page structure"
    echo -e "\nExample:"
    echo -e "  $0 cerulean-circle-unlimited-2cu/product/development/coast/eamducp-repository/UCP.md 288981051"
    exit 1
}

# Validate arguments
if [ $# -ne 2 ]; then
    usage
fi

HIERARCHICAL_PATH="$1"
PAGE_ID="$2"

# Validate hierarchical path exists
if [ ! -f "$WORKSPACE_ROOT/$HIERARCHICAL_PATH" ]; then
    echo -e "${RED}Error: File not found: $WORKSPACE_ROOT/$HIERARCHICAL_PATH${NC}"
    exit 1
fi

# Extract components from path
TOPIC_NAME=$(basename "$HIERARCHICAL_PATH" .md)
PARENT_DIR=$(dirname "$HIERARCHICAL_PATH")
PARENT_NAME=$(basename "$PARENT_DIR")

# Calculate page structure path
PAGE_DIR="$WORKSPACE_ROOT/$ATLASSIAN_BASE/$PAGE_ID"
PAGE_FILE="$PAGE_DIR/$TOPIC_NAME.md"
ENTRY_FILE="$PAGE_DIR/$TOPIC_NAME.entry.md"

echo -e "${BLUE}🔄 Migrating to dual-context structure...${NC}"
echo -e "  Topic: $TOPIC_NAME"
echo -e "  Hierarchical: $HIERARCHICAL_PATH"
echo -e "  Page Structure: $ATLASSIAN_BASE/$PAGE_ID/"

# Step 1: Create page structure directory if needed
echo -e "\n${YELLOW}Step 1: Creating page structure directory...${NC}"
mkdir -p "$PAGE_DIR"

# Step 2: Read existing content
echo -e "\n${YELLOW}Step 2: Reading existing content...${NC}"
CONTENT=$(cat "$WORKSPACE_ROOT/$HIERARCHICAL_PATH")

# Step 3: Check if already has navigation header
if echo "$CONTENT" | head -n 1 | grep -q "📁.*🌐"; then
    echo -e "${GREEN}✓ File already has navigation header${NC}"
    HAS_NAV_HEADER=true
    # Extract content without header
    CONTENT_BODY=$(echo "$CONTENT" | tail -n +3)
else
    echo -e "${YELLOW}! File needs navigation header${NC}"
    HAS_NAV_HEADER=false
    CONTENT_BODY="$CONTENT"
fi

# Step 4: Create hierarchical navigation header
echo -e "\n${YELLOW}Step 4: Creating navigation headers...${NC}"

# Find parent file
PARENT_FILE=""
if [ -f "$WORKSPACE_ROOT/$PARENT_DIR.md" ]; then
    PARENT_FILE="../$(basename "$PARENT_DIR").md"
elif [ -f "$WORKSPACE_ROOT/$PARENT_DIR/$PARENT_NAME.md" ]; then
    PARENT_FILE="../$PARENT_NAME.md"
fi

if [ -n "$PARENT_FILE" ]; then
    PARENT_LINK="[📁 $(echo $PARENT_NAME | sed 's/-/ /g' | sed 's/\b\(.\)/\u\1/g')]($PARENT_FILE)"
else
    PARENT_LINK="[📁 Parent](../index.md)"
fi

HIERARCHICAL_NAV="$PARENT_LINK | [🌐 Page Structure GitHub](/$ATLASSIAN_BASE/$PAGE_ID/$TOPIC_NAME.md) | [🌐 Page Structure local SymLink](./$TOPIC_NAME.page.md)"

# Step 5: Create page structure navigation header
# Calculate relative path depth from page to hierarchical
DEPTH=$(echo "$ATLASSIAN_BASE/$PAGE_ID" | tr -cd '/' | wc -c)
RELATIVE_PATH=""
for ((i=0; i<$DEPTH+1; i++)); do
    RELATIVE_PATH="../$RELATIVE_PATH"
done

PAGE_NAV="[📁 $(echo $PARENT_NAME | sed 's/-/ /g' | sed 's/\b\(.\)/\u\1/g') GitHub](/$PARENT_DIR.md) | [🌐 Index Structure GitHub](/$HIERARCHICAL_PATH) | [🌐 Index Structure local SymLink](./$TOPIC_NAME.entry.md)"

# Step 6: Update hierarchical file with navigation
echo -e "\n${YELLOW}Step 6: Updating hierarchical file...${NC}"
{
    echo "$HIERARCHICAL_NAV"
    echo ""
    echo "$CONTENT_BODY"
} > "$WORKSPACE_ROOT/$HIERARCHICAL_PATH"

# Step 7: Create page structure file
echo -e "\n${YELLOW}Step 7: Creating page structure file...${NC}"
{
    echo "$PAGE_NAV"
    echo ""
    echo "$CONTENT_BODY"
} > "$PAGE_FILE"

# Step 8: Create symlink
echo -e "\n${YELLOW}Step 8: Creating symlink...${NC}"
cd "$PAGE_DIR"
ln -sf "${RELATIVE_PATH}$HIERARCHICAL_PATH" "$TOPIC_NAME.entry.md"

# Step 9: Create optional page symlink in hierarchical location
echo -e "\n${YELLOW}Step 9: Creating optional page symlink...${NC}"
cd "$WORKSPACE_ROOT/$(dirname $HIERARCHICAL_PATH)"
# Calculate path to page file
PAGE_RELATIVE=$(python3 -c "import os.path; print(os.path.relpath('$PAGE_FILE', '$(pwd)'))")
ln -sf "$PAGE_RELATIVE" "$TOPIC_NAME.page.md" 2>/dev/null || echo -e "${YELLOW}! Could not create page symlink (may already exist)${NC}"

# Step 10: Validation
echo -e "\n${YELLOW}Step 10: Validating migration...${NC}"
ERRORS=0

# Check files exist
for FILE in "$WORKSPACE_ROOT/$HIERARCHICAL_PATH" "$PAGE_FILE" "$ENTRY_FILE"; do
    if [ -e "$FILE" ]; then
        echo -e "${GREEN}✓ $(basename $FILE) exists${NC}"
    else
        echo -e "${RED}✗ $(basename $FILE) missing${NC}"
        ((ERRORS++))
    fi
done

# Check symlink validity
if [ -L "$ENTRY_FILE" ] && [ -e "$ENTRY_FILE" ]; then
    echo -e "${GREEN}✓ Symlink $TOPIC_NAME.entry.md is valid${NC}"
else
    echo -e "${RED}✗ Symlink $TOPIC_NAME.entry.md is broken${NC}"
    ((ERRORS++))
fi

# Summary
echo -e "\n${BLUE}═══════════════════════════════════════${NC}"
if [ $ERRORS -eq 0 ]; then
    echo -e "${GREEN}✅ Migration completed successfully!${NC}"
    echo -e "\n${YELLOW}Next steps:${NC}"
    echo -e "1. Update parent topic to reference this page"
    echo -e "2. Update repository index.md if needed"
    echo -e "3. Test navigation links in GitHub"
else
    echo -e "${RED}❌ Migration completed with $ERRORS errors${NC}"
    exit 1
fi