#!/bin/bash

# Example: Migrating governance files to dual-context structure
# This demonstrates how to use the v2.0 maintenance tools

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${BLUE}Example: Migrating Governance Files${NC}"
echo -e "${YELLOW}======================================${NC}\n"

# Path to dual-context tool
TOOL="/workspace/maintenance/v2.0/dual-context.sh"

# Example 1: Migrate cc-internals.md
echo -e "${GREEN}1. Migrating cc-internals.md:${NC}"
echo -e "   This file is a parent page containing links to other governance topics.\n"

# You would need to determine the appropriate Atlassian page ID
# For this example, we'll use a placeholder ID
PAGE_ID="100000001"

echo "Command to run:"
echo "  $TOOL migrate cerulean-circle-unlimited-2cu/governance/cc-internals.md $PAGE_ID"
echo ""

# Example 2: Create a new governance document
echo -e "${GREEN}2. Creating a new governance document:${NC}"
echo -e "   Creating a new compliance policy document.\n"

PAGE_ID="100000002"

echo "Command to run:"
echo "  $TOOL create cerulean-circle-unlimited-2cu/governance/policies $PAGE_ID CompliancePolicy"
echo ""

# Example 3: Add an existing file to dual-context
echo -e "${GREEN}3. Adding existing file to dual-context:${NC}"
echo -e "   Adding the investors.md file to the system.\n"

PAGE_ID="100000003"

echo "Command to run:"
echo "  $TOOL add cerulean-circle-unlimited-2cu/governance/investors.md $PAGE_ID"
echo ""

# Example 4: Update navigation headers
echo -e "${GREEN}4. Updating navigation headers:${NC}"
echo -e "   Refresh navigation for a file that was manually edited.\n"

echo "Command to run:"
echo "  $TOOL update cerulean-circle-unlimited-2cu/governance/cc-internals.md --refresh-nav"
echo ""

# Example 5: Check status of governance files
echo -e "${GREEN}5. Checking status of all governance files:${NC}"
echo -e "   See which files need migration.\n"

echo "Command to run:"
echo "  $TOOL status 'cerulean-circle-unlimited-2cu/governance/**/*.md'"
echo ""

echo -e "${YELLOW}Notes:${NC}"
echo -e "- You need to determine the correct Atlassian page IDs from the export"
echo -e "- The hierarchical structure (source of truth) is always in cerulean-circle-unlimited-2cu/"
echo -e "- Page structure files will be created in 2cu.atlassian.net/wiki/spaces/CCU/pages/{ID}/"
echo -e "- Always test navigation links in GitHub after migration"
echo -e "- Update parent pages to reference migrated content"