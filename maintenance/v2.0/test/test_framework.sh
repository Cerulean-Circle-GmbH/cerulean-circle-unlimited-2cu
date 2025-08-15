#!/bin/bash

# Test Framework for Dual-Context Navigation System v2.0
# Provides common functions and utilities for testing

set -euo pipefail

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# Test configuration
export TEST_WORKSPACE="/tmp/dual-context-test-$$"
export WORKSPACE_ROOT="/workspace"
export TOOL_DIR="$WORKSPACE_ROOT/maintenance/v2.0"
export ATLASSIAN_BASE="2cu.atlassian.net/wiki/spaces/CCU/pages"

# Test counters
TESTS_RUN=0
TESTS_PASSED=0
TESTS_FAILED=0

# Initialize test environment
init_test_env() {
    echo -e "${BLUE}Initializing test environment...${NC}"
    mkdir -p "$TEST_WORKSPACE"
    mkdir -p "$TEST_WORKSPACE/cerulean-circle-unlimited-2cu/test/sample"
    mkdir -p "$TEST_WORKSPACE/$ATLASSIAN_BASE"
}

# Cleanup test environment
cleanup_test_env() {
    echo -e "${BLUE}Cleaning up test environment...${NC}"
    rm -rf "$TEST_WORKSPACE"
}

# Create a test file
create_test_file() {
    local path="$1"
    local content="${2:-# Test Document\n\nThis is a test document.}"
    
    mkdir -p "$(dirname "$TEST_WORKSPACE/$path")"
    echo -e "$content" > "$TEST_WORKSPACE/$path"
}

# Assert file exists
assert_file_exists() {
    local file="$1"
    local desc="${2:-File should exist}"
    
    ((TESTS_RUN++))
    if [ -e "$file" ]; then
        echo -e "${GREEN}✓ PASS:${NC} $desc"
        ((TESTS_PASSED++))
        return 0
    else
        echo -e "${RED}✗ FAIL:${NC} $desc"
        echo -e "  Expected file: $file"
        ((TESTS_FAILED++))
        return 1
    fi
}

# Assert file contains
assert_file_contains() {
    local file="$1"
    local pattern="$2"
    local desc="${3:-File should contain pattern}"
    
    ((TESTS_RUN++))
    if [ -f "$file" ] && grep -q "$pattern" "$file"; then
        echo -e "${GREEN}✓ PASS:${NC} $desc"
        ((TESTS_PASSED++))
        return 0
    else
        echo -e "${RED}✗ FAIL:${NC} $desc"
        echo -e "  File: $file"
        echo -e "  Pattern: $pattern"
        ((TESTS_FAILED++))
        return 1
    fi
}

# Assert symlink valid
assert_symlink_valid() {
    local link="$1"
    local desc="${2:-Symlink should be valid}"
    
    ((TESTS_RUN++))
    if [ -L "$link" ] && [ -e "$link" ]; then
        echo -e "${GREEN}✓ PASS:${NC} $desc"
        ((TESTS_PASSED++))
        return 0
    else
        echo -e "${RED}✗ FAIL:${NC} $desc"
        echo -e "  Symlink: $link"
        ((TESTS_FAILED++))
        return 1
    fi
}

# Assert command succeeds
assert_command_succeeds() {
    local desc="$1"
    shift
    local cmd="$@"
    
    ((TESTS_RUN++))
    if $cmd > /dev/null 2>&1; then
        echo -e "${GREEN}✓ PASS:${NC} $desc"
        ((TESTS_PASSED++))
        return 0
    else
        echo -e "${RED}✗ FAIL:${NC} $desc"
        echo -e "  Command: $cmd"
        ((TESTS_FAILED++))
        return 1
    fi
}

# Assert command fails
assert_command_fails() {
    local desc="$1"
    shift
    local cmd="$@"
    
    ((TESTS_RUN++))
    if ! $cmd > /dev/null 2>&1; then
        echo -e "${GREEN}✓ PASS:${NC} $desc"
        ((TESTS_PASSED++))
        return 0
    else
        echo -e "${RED}✗ FAIL:${NC} $desc"
        echo -e "  Command: $cmd"
        ((TESTS_FAILED++))
        return 1
    fi
}

# Run test suite
run_test_suite() {
    local suite_name="$1"
    shift
    local test_functions=("$@")
    
    echo -e "\n${CYAN}═══════════════════════════════════════${NC}"
    echo -e "${CYAN}Running Test Suite: $suite_name${NC}"
    echo -e "${CYAN}═══════════════════════════════════════${NC}\n"
    
    for test_func in "${test_functions[@]}"; do
        echo -e "\n${YELLOW}Test: $test_func${NC}"
        $test_func || true
    done
}

# Print test summary
print_test_summary() {
    echo -e "\n${CYAN}═══════════════════════════════════════${NC}"
    echo -e "${CYAN}Test Summary${NC}"
    echo -e "${CYAN}═══════════════════════════════════════${NC}"
    echo -e "Tests Run: $TESTS_RUN"
    echo -e "Tests Passed: ${GREEN}$TESTS_PASSED${NC}"
    echo -e "Tests Failed: ${RED}$TESTS_FAILED${NC}"
    
    if [ $TESTS_FAILED -eq 0 ]; then
        echo -e "\n${GREEN}✅ All tests passed!${NC}"
        return 0
    else
        echo -e "\n${RED}❌ Some tests failed!${NC}"
        return 1
    fi
}

# Export functions
export -f init_test_env
export -f cleanup_test_env
export -f create_test_file
export -f assert_file_exists
export -f assert_file_contains
export -f assert_symlink_valid
export -f assert_command_succeeds
export -f assert_command_fails
export -f run_test_suite
export -f print_test_summary