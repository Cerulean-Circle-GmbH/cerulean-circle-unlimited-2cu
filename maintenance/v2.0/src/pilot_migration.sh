#!/bin/bash

# Pilot migration script - Test with 10 governance files
# This will help validate the mass migration approach

set -euo pipefail

# Colors
GREEN='\033[0;32m'
RED='\033[0;31m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m'

# Configuration
TOOL="/workspace/maintenance/v2.0/dual-context.sh"
LOG_FILE="/workspace/pilot_migration_$(date +%Y%m%d_%H%M%S).log"

echo -e "${BLUE}=== PILOT MIGRATION TEST ===${NC}" | tee "$LOG_FILE"
echo -e "Date: $(date)" | tee -a "$LOG_FILE"
echo -e "Testing with governance domain files\n" | tee -a "$LOG_FILE"

# Create git checkpoint
echo -e "${YELLOW}Creating git checkpoint...${NC}" | tee -a "$LOG_FILE"
git add -A
git commit -m "Checkpoint: Before pilot migration test" || echo "No changes to commit"
git tag -a "pilot-migration-start" -m "Before pilot migration" -f

# Define pilot files with page IDs
declare -A PILOT_FILES=(
    ["cerulean-circle-unlimited-2cu/governance.md"]="300000001"
    ["cerulean-circle-unlimited-2cu/governance/cc-internals.md"]="300000002"
    ["cerulean-circle-unlimited-2cu/governance/file-lists.md"]="300000003"
    ["cerulean-circle-unlimited-2cu/governance/product-requirements.md"]="300000004"
    ["cerulean-circle-unlimited-2cu/governance/investors.md"]="300000005"
    ["cerulean-circle-unlimited-2cu/governance/resolving-problems-with-pages.md"]="300000006"
    ["cerulean-circle-unlimited-2cu/governance/cc-internals/matrix-of-ccg-products.md"]="300000007"
    ["cerulean-circle-unlimited-2cu/governance/cc-internals/contracts-overview.md"]="300000008"
    ["cerulean-circle-unlimited-2cu/governance/cc-internals/cc-core-document-locations-links.md"]="300000009"
    ["cerulean-circle-unlimited-2cu/governance/cc-internals/eld-enterprise-lean-development.md"]="300000010"
)

# Statistics
TOTAL=${#PILOT_FILES[@]}
SUCCESS=0
FAILED=0

echo -e "\n${YELLOW}Starting migration of $TOTAL files...${NC}\n" | tee -a "$LOG_FILE"

# Migrate each file
for FILE_PATH in "${!PILOT_FILES[@]}"; do
    PAGE_ID=${PILOT_FILES[$FILE_PATH]}
    
    echo -e "${BLUE}Migrating: $FILE_PATH${NC}" | tee -a "$LOG_FILE"
    echo -e "  Page ID: $PAGE_ID" | tee -a "$LOG_FILE"
    
    if [ -f "/workspace/$FILE_PATH" ]; then
        # Check if already migrated
        if head -1 "/workspace/$FILE_PATH" 2>/dev/null | grep -q "📁.*🌐"; then
            echo -e "  ${YELLOW}⚠ Already migrated, skipping${NC}" | tee -a "$LOG_FILE"
            ((SUCCESS++))
        else
            # Run migration
            if $TOOL migrate "$FILE_PATH" "$PAGE_ID" >> "$LOG_FILE" 2>&1; then
                echo -e "  ${GREEN}✓ Success${NC}" | tee -a "$LOG_FILE"
                ((SUCCESS++))
            else
                echo -e "  ${RED}✗ Failed${NC}" | tee -a "$LOG_FILE"
                ((FAILED++))
            fi
        fi
    else
        echo -e "  ${RED}✗ File not found${NC}" | tee -a "$LOG_FILE"
        ((FAILED++))
    fi
    
    echo "" | tee -a "$LOG_FILE"
done

# Validation
echo -e "${YELLOW}Running validation...${NC}" | tee -a "$LOG_FILE"
VALID=0
for FILE_PATH in "${!PILOT_FILES[@]}"; do
    if $TOOL update "$FILE_PATH" --check-only > /dev/null 2>&1; then
        ((VALID++))
    fi
done

# Summary
echo -e "\n${BLUE}=== PILOT MIGRATION SUMMARY ===${NC}" | tee -a "$LOG_FILE"
echo -e "Total files: $TOTAL" | tee -a "$LOG_FILE"
echo -e "Successful: ${GREEN}$SUCCESS${NC}" | tee -a "$LOG_FILE"
echo -e "Failed: ${RED}$FAILED${NC}" | tee -a "$LOG_FILE"
echo -e "Valid structures: ${GREEN}$VALID${NC}" | tee -a "$LOG_FILE"
echo -e "\nLog file: $LOG_FILE" | tee -a "$LOG_FILE"

# Git commit results
if [ $SUCCESS -gt 0 ]; then
    echo -e "\n${YELLOW}Committing results...${NC}" | tee -a "$LOG_FILE"
    git add -A
    git commit -m "Pilot migration: $SUCCESS governance files migrated to dual-context"
    git tag -a "pilot-migration-complete" -m "After pilot migration: $SUCCESS files" -f
fi

# Next steps
echo -e "\n${YELLOW}Next Steps:${NC}" | tee -a "$LOG_FILE"
echo -e "1. Review migrated files in governance domain" | tee -a "$LOG_FILE"
echo -e "2. Test navigation in GitHub web interface" | tee -a "$LOG_FILE"
echo -e "3. If successful, proceed with full migration" | tee -a "$LOG_FILE"

exit 0