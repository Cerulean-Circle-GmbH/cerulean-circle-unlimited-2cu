#!/bin/bash

# 🆕 Create new content with dual-context navigation structure
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
    echo -e "${BLUE}Usage: $0 <hierarchical-path> <page-id> <topic-name>${NC}"
    echo -e "  hierarchical-path: Directory path in hierarchical structure (without filename)"
    echo -e "  page-id: Atlassian page ID for the page structure"
    echo -e "  topic-name: Name of the topic (will create TOPIC.md)"
    echo -e "\nExample:"
    echo -e "  $0 cerulean-circle-unlimited-2cu/product/newfeature 123456789 FeatureDoc"
    exit 1
}

# Validate arguments
if [ $# -ne 3 ]; then
    usage
fi

HIERARCHICAL_DIR="$1"
PAGE_ID="$2"
TOPIC_NAME="$3"

# Ensure topic name doesn't include .md extension
TOPIC_NAME="${TOPIC_NAME%.md}"

# Calculate full paths
HIERARCHICAL_PATH="$HIERARCHICAL_DIR/$TOPIC_NAME.md"
HIERARCHICAL_FULL="$WORKSPACE_ROOT/$HIERARCHICAL_PATH"
PAGE_DIR="$WORKSPACE_ROOT/$ATLASSIAN_BASE/$PAGE_ID"
PAGE_FILE="$PAGE_DIR/$TOPIC_NAME.md"
ENTRY_FILE="$PAGE_DIR/$TOPIC_NAME.entry.md"

# Check if files already exist
if [ -f "$HIERARCHICAL_FULL" ]; then
    echo -e "${RED}Error: Hierarchical file already exists: $HIERARCHICAL_PATH${NC}"
    echo -e "${YELLOW}Use migrate.sh to convert existing files to dual-context${NC}"
    exit 1
fi

if [ -f "$PAGE_FILE" ]; then
    echo -e "${RED}Error: Page structure file already exists: $PAGE_FILE${NC}"
    exit 1
fi

echo -e "${BLUE}🆕 Creating new dual-context content...${NC}"
echo -e "  Topic: $TOPIC_NAME"
echo -e "  Hierarchical: $HIERARCHICAL_PATH"
echo -e "  Page Structure: $ATLASSIAN_BASE/$PAGE_ID/"

# Step 1: Create directories
echo -e "\n${YELLOW}Step 1: Creating directories...${NC}"
mkdir -p "$WORKSPACE_ROOT/$HIERARCHICAL_DIR"
mkdir -p "$PAGE_DIR"

# Step 2: Determine parent information
echo -e "\n${YELLOW}Step 2: Determining parent information...${NC}"
PARENT_DIR=$(dirname "$HIERARCHICAL_PATH")
PARENT_NAME=$(basename "$PARENT_DIR")

# Find parent file
PARENT_FILE=""
PARENT_DISPLAY=""
if [ -f "$WORKSPACE_ROOT/$PARENT_DIR.md" ]; then
    PARENT_FILE="../$(basename "$PARENT_DIR").md"
    PARENT_DISPLAY=$(echo $PARENT_NAME | sed 's/-/ /g' | sed 's/\b\(.\)/\u\1/g')
elif [ -f "$WORKSPACE_ROOT/$PARENT_DIR/$PARENT_NAME.md" ]; then
    PARENT_FILE="../$PARENT_NAME.md"
    PARENT_DISPLAY=$(echo $PARENT_NAME | sed 's/-/ /g' | sed 's/\b\(.\)/\u\1/g')
else
    PARENT_FILE="../index.md"
    PARENT_DISPLAY="Parent"
fi

# Step 3: Create navigation headers
echo -e "\n${YELLOW}Step 3: Creating navigation headers...${NC}"

# Hierarchical navigation header
HIERARCHICAL_NAV="[📁 $PARENT_DISPLAY]($PARENT_FILE) | [🌐 Page Structure GitHub](/$ATLASSIAN_BASE/$PAGE_ID/$TOPIC_NAME.md) | [🌐 Page Structure local SymLink](./$TOPIC_NAME.page.md)"

# Calculate relative path depth from page to hierarchical
DEPTH=$(echo "$ATLASSIAN_BASE/$PAGE_ID" | tr -cd '/' | wc -c)
RELATIVE_PATH=""
for ((i=0; i<$DEPTH+1; i++)); do
    RELATIVE_PATH="../$RELATIVE_PATH"
done

# Page structure navigation header
PAGE_NAV="[📁 $PARENT_DISPLAY GitHub](/$PARENT_DIR.md) | [🌐 Index Structure GitHub](/$HIERARCHICAL_PATH) | [🌐 Index Structure local SymLink](./$TOPIC_NAME.entry.md)"

# Step 4: Create template content
echo -e "\n${YELLOW}Step 4: Creating template content...${NC}"

# Format topic name for display
TOPIC_DISPLAY=$(echo $TOPIC_NAME | sed 's/-/ /g' | sed 's/_/ /g')

TEMPLATE_CONTENT="# $TOPIC_DISPLAY

## Overview

[TODO: Add overview description of $TOPIC_DISPLAY]

## Key Concepts

[TODO: List and explain key concepts]

## Details

[TODO: Add detailed information]

## Related Topics

[TODO: Add links to related topics]

---

**Created:** $(date +%Y-%m-%d)  
**Status:** Draft"

# Step 5: Create hierarchical file
echo -e "\n${YELLOW}Step 5: Creating hierarchical file...${NC}"
{
    echo "$HIERARCHICAL_NAV"
    echo ""
    echo "$TEMPLATE_CONTENT"
} > "$HIERARCHICAL_FULL"

# Step 6: Create page structure file
echo -e "\n${YELLOW}Step 6: Creating page structure file...${NC}"
{
    echo "$PAGE_NAV"
    echo ""
    echo "$TEMPLATE_CONTENT"
} > "$PAGE_FILE"

# Step 7: Create symlink
echo -e "\n${YELLOW}Step 7: Creating entry symlink...${NC}"
cd "$PAGE_DIR"
ln -sf "${RELATIVE_PATH}$HIERARCHICAL_PATH" "$TOPIC_NAME.entry.md"

# Step 8: Create optional page symlink in hierarchical location
echo -e "\n${YELLOW}Step 8: Creating page symlink...${NC}"
cd "$WORKSPACE_ROOT/$HIERARCHICAL_DIR"
# Calculate path to page file
PAGE_RELATIVE=$(python3 -c "import os.path; print(os.path.relpath('$PAGE_FILE', '$(pwd)'))")
ln -sf "$PAGE_RELATIVE" "$TOPIC_NAME.page.md"

# Step 9: Validation
echo -e "\n${YELLOW}Step 9: Validating creation...${NC}"
ERRORS=0

# Check files exist
for FILE in "$HIERARCHICAL_FULL" "$PAGE_FILE" "$ENTRY_FILE"; do
    if [ -e "$FILE" ]; then
        echo -e "${GREEN}✓ $(basename $FILE) created${NC}"
    else
        echo -e "${RED}✗ $(basename $FILE) missing${NC}"
        ((ERRORS++))
    fi
done

# Check symlinks
if [ -L "$ENTRY_FILE" ] && [ -e "$ENTRY_FILE" ]; then
    echo -e "${GREEN}✓ Symlink $TOPIC_NAME.entry.md is valid${NC}"
else
    echo -e "${RED}✗ Symlink $TOPIC_NAME.entry.md is broken${NC}"
    ((ERRORS++))
fi

if [ -L "$WORKSPACE_ROOT/$HIERARCHICAL_DIR/$TOPIC_NAME.page.md" ]; then
    echo -e "${GREEN}✓ Symlink $TOPIC_NAME.page.md created${NC}"
else
    echo -e "${YELLOW}! Symlink $TOPIC_NAME.page.md not created${NC}"
fi

# Summary
echo -e "\n${BLUE}═══════════════════════════════════════${NC}"
if [ $ERRORS -eq 0 ]; then
    echo -e "${GREEN}✅ Dual-context content created successfully!${NC}"
    echo -e "\n${YELLOW}Next steps:${NC}"
    echo -e "1. Edit content in: $HIERARCHICAL_PATH"
    echo -e "2. Update parent topic to reference this page"
    echo -e "3. Add entry to repository index.md:"
    echo -e "   - [$TOPIC_DISPLAY](./$HIERARCHICAL_PATH)"
    echo -e "4. Commit changes and test navigation in GitHub"
else
    echo -e "${RED}❌ Creation completed with $ERRORS errors${NC}"
    exit 1
fi