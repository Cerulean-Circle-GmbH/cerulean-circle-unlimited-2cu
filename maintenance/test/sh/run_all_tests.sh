#!/bin/bash

# run_all_tests.sh - Run all maintenance tool tests
# Usage: ./run_all_tests.sh [--verbose]

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/../../../" && pwd)"

VERBOSE=false

# Parse command line arguments
if [[ "$1" == "--verbose" ]]; then
    VERBOSE=true
fi

echo "🧪 Dual-Context Architecture - Maintenance Tools Test Suite"
echo "==========================================================="
echo ""

cd "$REPO_ROOT"

# Test configuration
TESTS=(
    "test_add_new_markdown.sh:Add New Markdown Integration"
    "test_validate_links.sh:Link Validation"
)

# Results tracking
TOTAL_TESTS=0
PASSED_TESTS=0
FAILED_TESTS=0
FAILED_TEST_LIST=""

# Function to run a single test
run_test() {
    local test_script="$1"
    local test_name="$2"
    local test_path="$SCRIPT_DIR/$test_script"
    
    TOTAL_TESTS=$((TOTAL_TESTS + 1))
    
    echo "🔬 Running: $test_name"
    echo "=================================="
    
    if [ ! -f "$test_path" ]; then
        echo "❌ Test script not found: $test_path"
        FAILED_TESTS=$((FAILED_TESTS + 1))
        FAILED_TEST_LIST="$FAILED_TEST_LIST\n❌ $test_name (script not found)"
        return 1
    fi
    
    if [ ! -x "$test_path" ]; then
        chmod +x "$test_path"
        echo "🔧 Made executable: $test_script"
    fi
    
    # Run the test
    local test_log="/tmp/test_$(basename "$test_script" .sh).log"
    
    if [ "$VERBOSE" = true ]; then
        # Run with full output
        if "$test_path" 2>&1 | tee "$test_log"; then
            echo "✅ PASSED: $test_name"
            PASSED_TESTS=$((PASSED_TESTS + 1))
        else
            echo "❌ FAILED: $test_name"
            FAILED_TESTS=$((FAILED_TESTS + 1))
            FAILED_TEST_LIST="$FAILED_TEST_LIST\n❌ $test_name"
        fi
    else
        # Run with minimal output
        if "$test_path" > "$test_log" 2>&1; then
            echo "✅ PASSED: $test_name"
            PASSED_TESTS=$((PASSED_TESTS + 1))
        else
            echo "❌ FAILED: $test_name"
            echo "   📁 Log: $test_log"
            FAILED_TESTS=$((FAILED_TESTS + 1))
            FAILED_TEST_LIST="$FAILED_TEST_LIST\n❌ $test_name (log: $test_log)"
            
            # Show last few lines of failure
            echo "   🔍 Last 5 lines of output:"
            tail -5 "$test_log" | sed 's/^/      /'
        fi
    fi
    
    echo ""
}

# Pre-test system check
echo "🔍 PRE-TEST SYSTEM CHECK"
echo "========================"

# Check that maintenance scripts exist
MAINTENANCE_DIR="$REPO_ROOT/maintenance/src/sh"
REQUIRED_SCRIPTS=(
    "add_new_markdown.sh"
    "validate_links.sh"
    "sync_dual_context.sh"
    "cleanup_maintenance.sh"
)

MISSING_SCRIPTS=0

for script in "${REQUIRED_SCRIPTS[@]}"; do
    script_path="$MAINTENANCE_DIR/$script"
    if [ -f "$script_path" ]; then
        if [ -x "$script_path" ]; then
            echo "✅ $script (executable)"
        else
            echo "🔧 $script (making executable)"
            chmod +x "$script_path"
        fi
    else
        echo "❌ $script (missing)"
        MISSING_SCRIPTS=$((MISSING_SCRIPTS + 1))
    fi
done

if [ "$MISSING_SCRIPTS" -gt 0 ]; then
    echo ""
    echo "❌ Cannot run tests - $MISSING_SCRIPTS required scripts missing"
    exit 1
fi

# Check dual-context architecture integrity
echo ""
echo "🏗️  Checking dual-context architecture..."

ENTRY_FILES=$(find "$REPO_ROOT" -name "*.entry.md" | wc -l | tr -d ' ')
SYMLINK_FILES=$(find "$REPO_ROOT" -name "*.md" -type l | wc -l | tr -d ' ')
PAGES_FILES=$(find "$REPO_ROOT/2cu.atlassian.net/wiki/spaces/CCU/pages" -name "*.md" -type f 2>/dev/null | wc -l | tr -d ' ' || echo "0")

echo "📊 Current architecture state:"
echo "   📄 .entry.md files: $ENTRY_FILES"
echo "   🔗 .md symlinks: $SYMLINK_FILES"
echo "   📁 Pages files: $PAGES_FILES"

if [ "$ENTRY_FILES" -gt 0 ] && [ "$SYMLINK_FILES" -gt 0 ] && [ "$PAGES_FILES" -gt 0 ]; then
    echo "✅ Dual-context architecture appears healthy"
else
    echo "⚠️  Dual-context architecture may be incomplete"
    echo "   Tests may fail due to architecture issues"
fi

echo ""
echo "🧪 RUNNING TESTS"
echo "================"

# Run all tests
for test_config in "${TESTS[@]}"; do
    IFS=':' read -r test_script test_name <<< "$test_config"
    run_test "$test_script" "$test_name"
done

# Final summary
echo "📊 TEST SUITE SUMMARY"
echo "====================="
echo "🎯 Total tests run: $TOTAL_TESTS"
echo "✅ Passed: $PASSED_TESTS"
echo "❌ Failed: $FAILED_TESTS"

if [ "$FAILED_TESTS" -gt 0 ]; then
    echo ""
    echo "❌ FAILED TESTS:"
    echo -e "$FAILED_TEST_LIST"
    echo ""
    echo "💡 Tips for debugging:"
    echo "   1. Run with --verbose for full output"
    echo "   2. Check individual test logs in /tmp/"
    echo "   3. Verify dual-context architecture integrity"
    echo "   4. Ensure all maintenance scripts are present"
fi

echo ""

if [ "$FAILED_TESTS" -eq 0 ]; then
    echo "🎉 ALL TESTS PASSED!"
    echo "✅ Maintenance tools are ready for production use"
    
    echo ""
    echo "🔧 NEXT STEPS:"
    echo "   1. Install git hooks: ./maintenance/install_git_hooks.sh"
    echo "   2. Integrate new files: ./maintenance/src/sh/add_new_markdown.sh <file>"
    echo "   3. Regular validation: ./maintenance/src/sh/validate_links.sh"
    
    exit 0
else
    echo "❌ SOME TESTS FAILED"
    echo "🔧 Please fix the issues before using maintenance tools in production"
    exit 1
fi
