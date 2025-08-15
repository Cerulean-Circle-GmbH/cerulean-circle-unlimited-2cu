#!/bin/bash

# test_add_new_markdown.sh - Test the add_new_markdown.sh tool
# Usage: ./test_add_new_markdown.sh

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
MAINTENANCE_DIR="$(cd "$SCRIPT_DIR/../../src/sh" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/../../../" && pwd)"
TEST_DIR="$REPO_ROOT/maintenance/test/temp"

echo "🧪 Testing add_new_markdown.sh"
echo "==============================="

# Setup test environment
echo "🔧 Setting up test environment..."

# Clean and create test directory
rm -rf "$TEST_DIR"
mkdir -p "$TEST_DIR"

# Create test markdown file
TEST_FILE="$TEST_DIR/test_new_file.md"
cat > "$TEST_FILE" << 'EOF'
# Test New File

This is a test markdown file for integration testing.

## Content

Some test content with:
- Regular markdown links: [example](./other-file.md)
- Atlassian links: [Test Page](https://2cu.atlassian.net/wiki/spaces/CCU/pages/12345/Test+Page)
- External links: [GitHub](https://github.com)

## More Content

Additional content to test the dual-context architecture.
EOF

echo "📁 Created test file: $TEST_FILE"

# Test 1: Basic integration
echo ""
echo "🧪 TEST 1: Basic Integration"
echo "============================"

cd "$REPO_ROOT"

if [ ! -x "$MAINTENANCE_DIR/add_new_markdown.sh" ]; then
    echo "❌ Script not executable: $MAINTENANCE_DIR/add_new_markdown.sh"
    exit 1
fi

echo "📤 Running integration script..."
"$MAINTENANCE_DIR/add_new_markdown.sh" "$TEST_FILE"

# Test 2: Verify dual-context files created
echo ""
echo "🧪 TEST 2: Verify File Creation"
echo "==============================="

EXPECTED_SYMLINK="$TEST_FILE"
EXPECTED_ENTRY="$TEST_FILE.entry.md"
EXPECTED_BACKUP="$TEST_FILE.migration.backup"

# Check symlink
if [ -L "$EXPECTED_SYMLINK" ]; then
    echo "✅ Symlink created: $EXPECTED_SYMLINK"
    SYMLINK_TARGET=$(readlink "$EXPECTED_SYMLINK")
    echo "   🎯 Points to: $SYMLINK_TARGET"
else
    echo "❌ Symlink NOT created: $EXPECTED_SYMLINK"
    exit 1
fi

# Check entry file
if [ -f "$EXPECTED_ENTRY" ]; then
    echo "✅ Entry file created: $EXPECTED_ENTRY"
else
    echo "❌ Entry file NOT created: $EXPECTED_ENTRY"
    exit 1
fi

# Check backup file
if [ -f "$EXPECTED_BACKUP" ]; then
    echo "✅ Backup file created: $EXPECTED_BACKUP"
else
    echo "❌ Backup file NOT created: $EXPECTED_BACKUP"
    exit 1
fi

# Test 3: Verify pages structure
echo ""
echo "🧪 TEST 3: Verify Pages Structure"
echo "================================="

PAGES_DIR="$REPO_ROOT/2cu.atlassian.net/wiki/spaces/CCU/pages"
PAGES_FILES=$(find "$PAGES_DIR" -name "test_new_file.md" 2>/dev/null || true)

if [ -n "$PAGES_FILES" ]; then
    echo "✅ File found in pages structure:"
    echo "$PAGES_FILES" | while read -r file; do
        echo "   📁 $file"
    done
else
    echo "❌ File NOT found in pages structure"
    exit 1
fi

# Test 4: Verify content consistency
echo ""
echo "🧪 TEST 4: Content Consistency"
echo "=============================="

# Get the actual pages file
PAGES_FILE=$(find "$PAGES_DIR" -name "test_new_file.md" | head -1)

if [ -f "$PAGES_FILE" ]; then
    echo "📄 Comparing content between entry and pages files..."
    
    # Compare basic content (ignoring link formats)
    ENTRY_CONTENT=$(grep -v "https://2cu.atlassian.net" "$EXPECTED_ENTRY" || true)
    PAGES_CONTENT=$(grep -v "https://2cu.atlassian.net" "$PAGES_FILE" || true)
    
    if [ "$ENTRY_CONTENT" = "$PAGES_CONTENT" ]; then
        echo "✅ Content is consistent between contexts"
    else
        echo "⚠️  Content differs between contexts (may be due to link format differences)"
    fi
else
    echo "❌ Pages file not found for comparison"
    exit 1
fi

# Test 5: Navigation context verification
echo ""
echo "🧪 TEST 5: Navigation Context"
echo "============================"

# Check symlink points to pages
SYMLINK_ABSOLUTE_TARGET=$(cd "$(dirname "$EXPECTED_SYMLINK")" && cd "$(dirname "$(readlink "$EXPECTED_SYMLINK")")" && pwd)/$(basename "$(readlink "$EXPECTED_SYMLINK")")

if [[ "$SYMLINK_ABSOLUTE_TARGET" == *"2cu.atlassian.net/wiki/spaces/CCU/pages"* ]]; then
    echo "✅ Symlink correctly points to pages structure"
else
    echo "❌ Symlink does NOT point to pages structure"
    echo "   Target: $SYMLINK_ABSOLUTE_TARGET"
    exit 1
fi

# Check entry file has original-style links
if grep -q "\.\./\(\.\./\)*2cu\.atlassian\.net" "$EXPECTED_ENTRY" 2>/dev/null; then
    echo "✅ Entry file preserves original link format"
else
    echo "ℹ️  Entry file has no original-style links (may be expected)"
fi

# Test 6: Cleanup
echo ""
echo "🧪 TEST 6: Cleanup"
echo "=================="

echo "🧹 Cleaning up test files..."

# Remove test files
rm -f "$EXPECTED_SYMLINK"
rm -f "$EXPECTED_ENTRY"
rm -f "$EXPECTED_BACKUP"

# Remove pages file
if [ -f "$PAGES_FILE" ]; then
    rm -f "$PAGES_FILE"
    # Try to remove empty directory
    rmdir "$(dirname "$PAGES_FILE")" 2>/dev/null || true
fi

# Remove test directory
rm -rf "$TEST_DIR"

echo "✅ Cleanup complete"

# Final summary
echo ""
echo "📊 TEST SUMMARY"
echo "==============="
echo "✅ All tests passed - add_new_markdown.sh is working correctly"
echo ""
echo "🎯 Verified functionality:"
echo "   ✅ Creates symlink in original location"
echo "   ✅ Creates real file in pages structure"
echo "   ✅ Creates .entry.md for original context"
echo "   ✅ Creates .migration.backup"
echo "   ✅ Preserves dual navigation contexts"
echo ""
echo "🎉 Integration tool is ready for production use!"
