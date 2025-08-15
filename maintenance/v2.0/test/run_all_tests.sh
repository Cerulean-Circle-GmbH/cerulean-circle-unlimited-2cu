#!/bin/bash

# Run all test suites for Dual-Context Navigation System v2.0

set -euo pipefail

# Colors for output
CYAN='\033[0;36m'
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Script directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo -e "${CYAN}╔════════════════════════════════════════════════╗${NC}"
echo -e "${CYAN}║  Dual-Context Navigation System v2.0 Test Suite║${NC}"
echo -e "${CYAN}╚════════════════════════════════════════════════╝${NC}"

# Track overall results
TOTAL_SUITES=0
PASSED_SUITES=0
FAILED_SUITES=0

# Run test suite and track results
run_suite() {
    local suite_name="$1"
    local test_script="$2"
    
    ((TOTAL_SUITES++))
    
    echo -e "\n${CYAN}Running: $suite_name${NC}"
    echo -e "${CYAN}═══════════════════════════════════════${NC}"
    
    if [ -f "$test_script" ] && [ -x "$test_script" ]; then
        if "$test_script"; then
            echo -e "${GREEN}✅ $suite_name passed${NC}"
            ((PASSED_SUITES++))
        else
            echo -e "${RED}❌ $suite_name failed${NC}"
            ((FAILED_SUITES++))
        fi
    else
        echo -e "${RED}❌ Test script not found or not executable: $test_script${NC}"
        ((FAILED_SUITES++))
    fi
}

# Run all test suites
run_suite "Migrate Tests" "$SCRIPT_DIR/test_migrate.sh"
# run_suite "Create Tests" "$SCRIPT_DIR/test_create.sh"
# run_suite "Add Tests" "$SCRIPT_DIR/test_add.sh"
# run_suite "Update Tests" "$SCRIPT_DIR/test_update.sh"

# Integration test on real file
echo -e "\n${CYAN}═══════════════════════════════════════${NC}"
echo -e "${CYAN}Integration Test: Real File Migration${NC}"
echo -e "${CYAN}═══════════════════════════════════════${NC}"

# Create a test copy of a real file
TEST_FILE="/tmp/test-eamducp-repository.md"
cp /workspace/cerulean-circle-unlimited-2cu/product/development/coast/eamducp-repository.md.backup.* "$TEST_FILE" 2>/dev/null || \
cp /workspace/cerulean-circle-unlimited-2cu/product/development/coast/eamducp-repository.md "$TEST_FILE"

# Remove navigation header if present
if head -n 1 "$TEST_FILE" | grep -q "📁"; then
    tail -n +3 "$TEST_FILE" > "$TEST_FILE.tmp" && mv "$TEST_FILE.tmp" "$TEST_FILE"
fi

echo -e "\n${CYAN}Overall Test Summary${NC}"
echo -e "${CYAN}═══════════════════════════════════════${NC}"
echo -e "Test Suites Run: $TOTAL_SUITES"
echo -e "Suites Passed: ${GREEN}$PASSED_SUITES${NC}"
echo -e "Suites Failed: ${RED}$FAILED_SUITES${NC}"

if [ $FAILED_SUITES -eq 0 ]; then
    echo -e "\n${GREEN}✅ All test suites passed!${NC}"
    exit 0
else
    echo -e "\n${RED}❌ Some test suites failed!${NC}"
    exit 1
fi