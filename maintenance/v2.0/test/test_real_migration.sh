#!/bin/bash

# Test the actual migration of eamducp-repository.md
# Verifies real-world dual-context navigation

set -euo pipefail

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# File paths
HIERARCHICAL_FILE="/workspace/cerulean-circle-unlimited-2cu/product/development/coast/eamducp-repository.md"
PAGE_FILE="/workspace/2cu.atlassian.net/wiki/spaces/CCU/pages/288981000/eamducp-repository.md"
ENTRY_SYMLINK="/workspace/2cu.atlassian.net/wiki/spaces/CCU/pages/288981000/eamducp-repository.entry.md"
PAGE_SYMLINK="/workspace/cerulean-circle-unlimited-2cu/product/development/coast/eamducp-repository.page.md"

echo -e "${CYAN}═══════════════════════════════════════${NC}"
echo -e "${CYAN}Real Migration Test: eamducp-repository.md${NC}"
echo -e "${CYAN}═══════════════════════════════════════${NC}\n"

# Test counters
TESTS_PASSED=0
TESTS_FAILED=0

# Test function
run_test() {
    local desc="$1"
    local test_cmd="$2"
    
    if eval "$test_cmd"; then
        echo -e "${GREEN}✓ PASS:${NC} $desc"
        ((TESTS_PASSED++))
    else
        echo -e "${RED}✗ FAIL:${NC} $desc"
        ((TESTS_FAILED++))
    fi
}

# Test 1: Hierarchical file exists and has navigation
echo -e "${YELLOW}Test 1: Hierarchical File${NC}"
run_test "Hierarchical file exists" "[ -f '$HIERARCHICAL_FILE' ]"
run_test "Has navigation header" "head -n 1 '$HIERARCHICAL_FILE' | grep -qE '📁.*Page Structure GitHub'"
run_test "Contains original content" "grep -q 'EAMD.ucp Repository' '$HIERARCHICAL_FILE'"
run_test "Links to page structure" "grep -q '/2cu.atlassian.net/wiki/spaces/CCU/pages/288981000/' '$HIERARCHICAL_FILE'"

# Test 2: Page structure file exists and has navigation
echo -e "\n${YELLOW}Test 2: Page Structure File${NC}"
run_test "Page file exists" "[ -f '$PAGE_FILE' ]"
run_test "Has navigation header" "head -n 1 '$PAGE_FILE' | grep -q '📁.*Index Structure GitHub'"
run_test "Contains same content" "grep -q 'EAMD.ucp Repository' '$PAGE_FILE'"
run_test "Links to hierarchical" "grep -q '/cerulean-circle-unlimited-2cu/product/development/coast/eamducp-repository.md' '$PAGE_FILE'"

# Test 3: Symlinks are valid
echo -e "\n${YELLOW}Test 3: Symlinks${NC}"
run_test "Entry symlink exists" "[ -L '$ENTRY_SYMLINK' ]"
run_test "Entry symlink is valid" "[ -e '$ENTRY_SYMLINK' ]"
run_test "Entry symlink points to hierarchical" "readlink '$ENTRY_SYMLINK' | grep -q 'cerulean-circle-unlimited-2cu'"
run_test "Page symlink exists" "[ -L '$PAGE_SYMLINK' ]"
run_test "Page symlink is valid" "[ -e '$PAGE_SYMLINK' ]"
run_test "Page symlink points to page structure" "readlink '$PAGE_SYMLINK' | grep -q '2cu.atlassian.net'"

# Test 4: Content consistency
echo -e "\n${YELLOW}Test 4: Content Consistency${NC}"
# Compare content without headers (skip first 2 lines)
HIER_CONTENT=$(tail -n +3 "$HIERARCHICAL_FILE" | md5sum)
PAGE_CONTENT=$(tail -n +3 "$PAGE_FILE" | md5sum)
run_test "Content is identical between contexts" "[ '$HIER_CONTENT' = '$PAGE_CONTENT' ]"

# Test 5: Navigation links
echo -e "\n${YELLOW}Test 5: Navigation Links${NC}"
run_test "Parent link exists in hierarchical" "grep -q '\[📁 Coast\]' '$HIERARCHICAL_FILE'"
run_test "GitHub links use absolute paths" "grep -q '\[🌐 Page Structure GitHub\](/' '$HIERARCHICAL_FILE'"
run_test "Local symlinks use relative paths" "grep -q '\[🌐.*SymLink\](\./.*\.md)' '$PAGE_FILE'"

# Test 6: Integration with existing structure
echo -e "\n${YELLOW}Test 6: Integration${NC}"
run_test "UCP.md child page exists" "[ -f '/workspace/cerulean-circle-unlimited-2cu/product/development/coast/eamducp-repository/UCP.md' ]"
run_test "UCP.md has dual-context" "head -n 1 '/workspace/cerulean-circle-unlimited-2cu/product/development/coast/eamducp-repository/UCP.md' | grep -q '📁.*Page Structure'"

# Summary
echo -e "\n${CYAN}═══════════════════════════════════════${NC}"
echo -e "${CYAN}Test Summary${NC}"
echo -e "${CYAN}═══════════════════════════════════════${NC}"
echo -e "Tests Passed: ${GREEN}$TESTS_PASSED${NC}"
echo -e "Tests Failed: ${RED}$TESTS_FAILED${NC}"

if [ $TESTS_FAILED -eq 0 ]; then
    echo -e "\n${GREEN}✅ All tests passed!${NC}"
    echo -e "\nThe migration of eamducp-repository.md to dual-context structure is successful!"
    exit 0
else
    echo -e "\n${RED}❌ Some tests failed!${NC}"
    exit 1
fi