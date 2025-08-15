#!/bin/bash

# Test cases for migrate.sh
# Tests the migration of existing files to dual-context structure

set -euo pipefail

# Source test framework
source "$(dirname "$0")/test_framework.sh"

# Test: Basic migration
test_basic_migration() {
    # Create a test file
    create_test_file "cerulean-circle-unlimited-2cu/test/sample/TestDoc.md" \
"# Test Document

This is a test document for migration testing.

## Section 1
Content here."

    # Run migration
    cd "$TEST_WORKSPACE"
    export WORKSPACE_ROOT="$TEST_WORKSPACE"
    
    assert_command_succeeds "Migration should succeed" \
        "$TOOL_DIR/src/migrate.sh" "cerulean-circle-unlimited-2cu/test/sample/TestDoc.md" "123456"
    
    # Check hierarchical file has navigation
    assert_file_contains \
        "$TEST_WORKSPACE/cerulean-circle-unlimited-2cu/test/sample/TestDoc.md" \
        "📁.*Page Structure GitHub" \
        "Hierarchical file should have navigation header"
    
    # Check page structure file exists
    assert_file_exists \
        "$TEST_WORKSPACE/$ATLASSIAN_BASE/123456/TestDoc.md" \
        "Page structure file should exist"
    
    # Check page file has navigation
    assert_file_contains \
        "$TEST_WORKSPACE/$ATLASSIAN_BASE/123456/TestDoc.md" \
        "📁.*Index Structure GitHub" \
        "Page file should have navigation header"
    
    # Check symlink exists
    assert_symlink_valid \
        "$TEST_WORKSPACE/$ATLASSIAN_BASE/123456/TestDoc.entry.md" \
        "Entry symlink should be valid"
}

# Test: Migration with existing navigation
test_migration_with_existing_nav() {
    # Create a file that already has navigation
    create_test_file "cerulean-circle-unlimited-2cu/test/existing/NavDoc.md" \
"[📁 Parent](../parent.md) | [🌐 Page Structure GitHub](/pages/999/NavDoc.md)

# Document with Navigation

This document already has a navigation header."

    cd "$TEST_WORKSPACE"
    export WORKSPACE_ROOT="$TEST_WORKSPACE"
    
    assert_command_succeeds "Migration should handle existing navigation" \
        "$TOOL_DIR/src/migrate.sh" "cerulean-circle-unlimited-2cu/test/existing/NavDoc.md" "234567"
    
    # Check content is preserved
    assert_file_contains \
        "$TEST_WORKSPACE/$ATLASSIAN_BASE/234567/NavDoc.md" \
        "This document already has a navigation header" \
        "Content should be preserved"
}

# Test: Invalid file path
test_invalid_file_path() {
    cd "$TEST_WORKSPACE"
    export WORKSPACE_ROOT="$TEST_WORKSPACE"
    
    assert_command_fails "Migration should fail for non-existent file" \
        "$TOOL_DIR/src/migrate.sh" "non/existent/file.md" "345678"
}

# Test: Migration creates parent symlink
test_migration_creates_page_symlink() {
    create_test_file "cerulean-circle-unlimited-2cu/test/symlink/SymDoc.md" \
"# Symlink Test Document

Testing symlink creation."

    cd "$TEST_WORKSPACE"
    export WORKSPACE_ROOT="$TEST_WORKSPACE"
    
    assert_command_succeeds "Migration should succeed" \
        "$TOOL_DIR/src/migrate.sh" "cerulean-circle-unlimited-2cu/test/symlink/SymDoc.md" "456789"
    
    # Check page symlink in hierarchical location
    assert_file_exists \
        "$TEST_WORKSPACE/cerulean-circle-unlimited-2cu/test/symlink/SymDoc.page.md" \
        "Page symlink should exist in hierarchical location"
}

# Test: Complex path migration
test_complex_path_migration() {
    # Create a deeply nested file
    create_test_file "cerulean-circle-unlimited-2cu/product/development/coast/deep/nested/DeepDoc.md" \
"# Deep Document

This tests deep path migration."

    cd "$TEST_WORKSPACE"
    export WORKSPACE_ROOT="$TEST_WORKSPACE"
    
    assert_command_succeeds "Deep path migration should succeed" \
        "$TOOL_DIR/src/migrate.sh" "cerulean-circle-unlimited-2cu/product/development/coast/deep/nested/DeepDoc.md" "567890"
    
    # Verify symlink depth is correct
    assert_symlink_valid \
        "$TEST_WORKSPACE/$ATLASSIAN_BASE/567890/DeepDoc.entry.md" \
        "Deep path symlink should be valid"
}

# Run all tests
main() {
    init_test_env
    
    run_test_suite "migrate.sh Tests" \
        test_basic_migration \
        test_migration_with_existing_nav \
        test_invalid_file_path \
        test_migration_creates_page_symlink \
        test_complex_path_migration
    
    cleanup_test_env
    print_test_summary
}

# Run tests if executed directly
if [ "${BASH_SOURCE[0]}" = "${0}" ]; then
    main
fi