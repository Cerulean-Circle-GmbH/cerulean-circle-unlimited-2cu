#!/bin/bash
# simple_batch_migrate.sh - Simplified migration script

set -euo pipefail

LOG="/workspace/governance_migration_$(date +%Y%m%d_%H%M%S).log"
TOOL="/workspace/maintenance/v2.0/dual-context.sh"

# Colors
GREEN='\033[0;32m'
RED='\033[0;31m'
BLUE='\033[0;34m'
NC='\033[0m'

echo -e "${BLUE}Starting Governance Domain Migration${NC}" | tee "$LOG"
echo -e "${BLUE}===================================${NC}" | tee -a "$LOG"
echo -e "Date: $(date)\n" | tee -a "$LOG"

SUCCESS=0
FAILED=0
TOTAL=0

while IFS=: read -r PAGE_ID FILE_PATH; do
    ((TOTAL++))
    echo -e "\n${BLUE}[$TOTAL] Migrating: $FILE_PATH${NC}" | tee -a "$LOG"
    echo -e "    Page ID: $PAGE_ID" | tee -a "$LOG"
    
    if [ -f "/workspace/$FILE_PATH" ]; then
        if $TOOL migrate "$FILE_PATH" "$PAGE_ID" >> "$LOG" 2>&1; then
            echo -e "    ${GREEN}✓ Success${NC}" | tee -a "$LOG"
            ((SUCCESS++))
        else
            echo -e "    ${RED}✗ Failed${NC}" | tee -a "$LOG"
            ((FAILED++))
        fi
    else
        echo -e "    ${RED}✗ File not found${NC}" | tee -a "$LOG"
        ((FAILED++))
    fi
done < /workspace/governance_migration.txt

echo -e "\n${BLUE}===================================${NC}" | tee -a "$LOG"
echo -e "${BLUE}Migration Complete:${NC}" | tee -a "$LOG"
echo -e "Total: $TOTAL" | tee -a "$LOG"
echo -e "Success: ${GREEN}$SUCCESS${NC}" | tee -a "$LOG"
echo -e "Failed: ${RED}$FAILED${NC}" | tee -a "$LOG"
echo -e "\nLog saved to: $LOG" | tee -a "$LOG"

exit 0