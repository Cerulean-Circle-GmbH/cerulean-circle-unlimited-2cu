#!/bin/bash

# ➕ Add existing content to dual-context navigation structure
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
    echo -e "${BLUE}Usage: $0 <existing-file-path> <page-id>${NC}"
    echo -e "  existing-file-path: Path to existing markdown file"
    echo -e "  page-id: Atlassian page ID for the page structure"
    echo -e "\nExample:"
    echo -e "  $0 cerulean-circle-unlimited-2cu/existing/doc.md 987654321"
    echo -e "\nNote: This tool is for files that exist but aren't in the dual-context system yet."
    exit 1
}

# Validate arguments
if [ $# -ne 2 ]; then
    usage
fi

EXISTING_PATH="$1"
PAGE_ID="$2"

# Remove leading slash if present
EXISTING_PATH="${EXISTING_PATH#/}"

# Ensure it's a relative path
if [[ "$EXISTING_PATH" == /* ]]; then
    echo -e "${RED}Error: Please provide a relative path within the workspace${NC}"
    exit 1
fi

# Full path to existing file
EXISTING_FULL="$WORKSPACE_ROOT/$EXISTING_PATH"

# Validate existing file
if [ ! -f "$EXISTING_FULL" ]; then
    echo -e "${RED}Error: File not found: $EXISTING_FULL${NC}"
    exit 1
fi

# Check if it's already in page structure
if [[ "$EXISTING_PATH" == *"$ATLASSIAN_BASE"* ]]; then
    echo -e "${RED}Error: File appears to be in page structure already${NC}"
    echo -e "${YELLOW}This tool is for hierarchical files only${NC}"
    exit 1
fi

# Extract components from path
TOPIC_NAME=$(basename "$EXISTING_PATH" .md)
PARENT_DIR=$(dirname "$EXISTING_PATH")
PARENT_NAME=$(basename "$PARENT_DIR")

# Calculate page structure paths
PAGE_DIR="$WORKSPACE_ROOT/$ATLASSIAN_BASE/$PAGE_ID"
PAGE_FILE="$PAGE_DIR/$TOPIC_NAME.md"
ENTRY_FILE="$PAGE_DIR/$TOPIC_NAME.entry.md"

# Check if page structure already exists
if [ -f "$PAGE_FILE" ]; then
    echo -e "${YELLOW}Warning: Page structure file already exists${NC}"
    echo -e "  $PAGE_FILE"
    read -p "Overwrite? (y/N): " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        echo -e "${RED}Aborted${NC}"
        exit 1
    fi
fi

echo -e "${BLUE}➕ Adding to dual-context structure...${NC}"
echo -e "  Topic: $TOPIC_NAME"
echo -e "  Existing: $EXISTING_PATH"
echo -e "  Page Structure: $ATLASSIAN_BASE/$PAGE_ID/"

# Step 1: Create page structure directory
echo -e "\n${YELLOW}Step 1: Creating page structure directory...${NC}"
mkdir -p "$PAGE_DIR"

# Step 2: Read existing content
echo -e "\n${YELLOW}Step 2: Analyzing existing content...${NC}"
CONTENT=$(cat "$EXISTING_FULL")

# Check if already has navigation header
if echo "$CONTENT" | head -n 1 | grep -q "📁.*🌐"; then
    echo -e "${YELLOW}! File already has navigation header${NC}"
    echo -e "${RED}This file may already be in dual-context system${NC}"
    read -p "Continue anyway? (y/N): " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        echo -e "${RED}Aborted${NC}"
        exit 1
    fi
    # Extract content without header
    CONTENT_BODY=$(echo "$CONTENT" | tail -n +3)
else
    echo -e "${GREEN}✓ File needs navigation header${NC}"
    CONTENT_BODY="$CONTENT"
fi

# Step 3: Determine parent information
echo -e "\n${YELLOW}Step 3: Determining parent information...${NC}"

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

echo -e "  Parent: $PARENT_DISPLAY ($PARENT_FILE)"

# Step 4: Create navigation headers
echo -e "\n${YELLOW}Step 4: Creating navigation headers...${NC}"

# Hierarchical navigation header
HIERARCHICAL_NAV="[📁 $PARENT_DISPLAY]($PARENT_FILE) | [🌐 Page Structure GitHub](/$ATLASSIAN_BASE/$PAGE_ID/$TOPIC_NAME.md) | [🌐 Page Structure local SymLink](./$TOPIC_NAME.page.md)"

# Calculate relative path depth from page to hierarchical
DEPTH=$(echo "$ATLASSIAN_BASE/$PAGE_ID" | tr -cd '/' | wc -c)
RELATIVE_PATH=""
for ((i=0; i<$DEPTH+1; i++)); do
    RELATIVE_PATH="../$RELATIVE_PATH"
done

# Page structure navigation header
PAGE_NAV="[📁 $PARENT_DISPLAY GitHub](/$PARENT_DIR.md) | [🌐 Index Structure GitHub](/$EXISTING_PATH) | [🌐 Index Structure local SymLink](./$TOPIC_NAME.entry.md)"

# Step 5: Backup original file
echo -e "\n${YELLOW}Step 5: Creating backup...${NC}"
cp "$EXISTING_FULL" "$EXISTING_FULL.backup.$(date +%Y%m%d_%H%M%S)"
echo -e "${GREEN}✓ Backup created${NC}"

# Step 6: Update hierarchical file with navigation
echo -e "\n${YELLOW}Step 6: Updating hierarchical file...${NC}"
{
    echo "$HIERARCHICAL_NAV"
    echo ""
    echo "$CONTENT_BODY"
} > "$EXISTING_FULL"

# Step 7: Create page structure file
echo -e "\n${YELLOW}Step 7: Creating page structure file...${NC}"
{
    echo "$PAGE_NAV"
    echo ""
    echo "$CONTENT_BODY"
} > "$PAGE_FILE"

# Step 8: Create symlink
echo -e "\n${YELLOW}Step 8: Creating entry symlink...${NC}"
cd "$PAGE_DIR"
ln -sf "${RELATIVE_PATH}$EXISTING_PATH" "$TOPIC_NAME.entry.md"

# Step 9: Create optional page symlink in hierarchical location
echo -e "\n${YELLOW}Step 9: Creating page symlink...${NC}"
cd "$WORKSPACE_ROOT/$PARENT_DIR"
# Calculate path to page file
PAGE_RELATIVE=$(python3 -c "import os.path; print(os.path.relpath('$PAGE_FILE', '$(pwd)'))")
ln -sf "$PAGE_RELATIVE" "$TOPIC_NAME.page.md" 2>/dev/null || echo -e "${YELLOW}! Could not create page symlink${NC}"

# Step 10: Validation
echo -e "\n${YELLOW}Step 10: Validating addition...${NC}"
ERRORS=0

# Check files exist
for FILE in "$EXISTING_FULL" "$PAGE_FILE" "$ENTRY_FILE"; do
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
    echo -e "${GREEN}✅ File added to dual-context system successfully!${NC}"
    echo -e "\n${YELLOW}Next steps:${NC}"
    echo -e "1. Review the updated navigation headers"
    echo -e "2. Update parent topic to reference this page"
    echo -e "3. Update repository index.md if not already listed"
    echo -e "4. Test navigation links in GitHub"
    echo -e "\n${BLUE}Backup saved to:${NC}"
    echo -e "  $EXISTING_FULL.backup.$(date +%Y%m%d_%H%M%S)"
else
    echo -e "${RED}❌ Addition completed with $ERRORS errors${NC}"
    exit 1
fi