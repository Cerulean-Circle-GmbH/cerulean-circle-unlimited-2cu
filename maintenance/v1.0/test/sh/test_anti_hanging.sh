#!/bin/bash

# test_anti_hanging.sh - Test suite to prevent hanging scripts
# This test validates that maintenance scripts don't contain patterns that cause hanging

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/../../../" && pwd)"
MAINTENANCE_DIR="$REPO_ROOT/maintenance/src/sh"

echo "🛡️  Anti-Hanging Script Test Suite"
echo "=================================="
echo ""

# Test counters
TOTAL_CHECKS=0
PASSED_CHECKS=0
FAILED_CHECKS=0
WARNINGS=0
FAILED_PATTERNS=""

# Function to run a pattern check
check_pattern() {
    local file="$1"
    local pattern="$2"
    local description="$3"
    local severity="$4"  # "error" or "warning"
    
    TOTAL_CHECKS=$((TOTAL_CHECKS + 1))
    
    if grep -n "$pattern" "$file" >/dev/null 2>&1; then
        local matches=$(grep -n "$pattern" "$file")
        if [ "$severity" = "error" ]; then
            echo "❌ FAIL: $description"
            echo "   📁 File: $(basename "$file")"
            echo "   🔍 Matches:"
            echo "$matches" | sed 's/^/      /'
            FAILED_CHECKS=$((FAILED_CHECKS + 1))
            FAILED_PATTERNS="$FAILED_PATTERNS\n❌ $description in $(basename "$file")"
        else
            echo "⚠️  WARN: $description"
            echo "   📁 File: $(basename "$file")"
            echo "   🔍 Matches:"
            echo "$matches" | sed 's/^/      /'
            WARNINGS=$((WARNINGS + 1))
            PASSED_CHECKS=$((PASSED_CHECKS + 1))  # Count warnings as passes for overall test
        fi
    else
        echo "✅ PASS: $description"
        PASSED_CHECKS=$((PASSED_CHECKS + 1))
    fi
}

# Function to test a specific script file
test_script_file() {
    local file="$1"
    local filename=$(basename "$file")
    
    echo "🔬 Testing: $filename"
    echo "------------------------"
    
    # ERROR PATTERNS - These will cause hanging
    
    # Multi-line strings with newlines
    check_pattern "$file" 'commit -m ".*\n' "Multi-line commit messages (will hang)" "error"
    check_pattern "$file" 'echo ".*\n.*"' "Multi-line echo statements (will hang)" "error"
    
    # Unclosed quotes patterns
    check_pattern "$file" '[^\\]"[^"]*$' "Potentially unclosed quotes" "warning"
    check_pattern "$file" "[^\\]'[^']*$" "Potentially unclosed single quotes" "warning"
    
    # Complex chained commands (prone to hanging)
    check_pattern "$file" '&&.*&&.*&&' "Triple chained commands (complex, prone to hanging)" "warning"
    check_pattern "$file" '|.*|.*|' "Triple piped commands (complex, prone to hanging)" "warning"
    
    # Interactive commands without non-interactive flags
    check_pattern "$file" '\bnpm install[^-]' "npm install without --yes flag (may hang)" "warning"
    check_pattern "$file" '\bapt-get install[^-]' "apt-get without -y flag (may hang)" "warning"
    check_pattern "$file" '\byum install[^-]' "yum without -y flag (may hang)" "warning"
    
    # Commands that wait for input
    check_pattern "$file" '\bread\b' "read command without timeout (will wait for input)" "warning"
    check_pattern "$file" '\bselect\b' "select command (may wait for input)" "warning"
    
    # Problematic redirections
    check_pattern "$file" '< /dev/stdin' "Reading from stdin (may hang)" "warning"
    check_pattern "$file" 'cat$' "cat without arguments (will wait for stdin)" "error"
    
    # Process that may not terminate
    check_pattern "$file" '\btail -f\b' "tail -f (runs indefinitely)" "warning"
    check_pattern "$file" '\bwatch\b' "watch command (runs indefinitely)" "warning"
    
    # Missing error handling for external commands
    check_pattern "$file" 'curl[^|]*$' "curl without error handling (may hang on network issues)" "warning"
    check_pattern "$file" 'wget[^|]*$' "wget without error handling (may hang on network issues)" "warning"
    
    echo ""
}

# Function to test for good practices (should be present)
test_good_practices() {
    local file="$1"
    local filename=$(basename "$file")
    
    echo "✨ Checking good practices in: $filename"
    echo "----------------------------------------"
    
    # Check for error handling
    if grep -q "set -e" "$file"; then
        echo "✅ GOOD: Uses 'set -e' for error handling"
    else
        echo "⚠️  WARN: Missing 'set -e' for error handling"
        WARNINGS=$((WARNINGS + 1))
    fi
    
    # Check for timeout on potentially long operations
    if grep -q "timeout " "$file"; then
        echo "✅ GOOD: Uses timeout for long operations"
    fi
    
    # Check for non-interactive flags on package managers
    if grep -q "npm.*--yes\|npm.*-y" "$file"; then
        echo "✅ GOOD: npm commands use non-interactive flags"
    fi
    
    # Check for proper quote escaping
    if grep -q '\\"' "$file"; then
        echo "✅ GOOD: Uses proper quote escaping"
    fi
    
    echo ""
}

# Function to test for specific hang-prone patterns
test_hang_patterns() {
    echo "🎯 Testing for specific hanging patterns"
    echo "========================================"
    
    # Test for the exact pattern that caused our previous hang
    local test_file="/tmp/hang_test_$$.sh"
    cat > "$test_file" << 'EOF'
#!/bin/bash
# This is a test file to detect hanging patterns

# BAD EXAMPLE 1: Multi-line commit message
git commit -m "feat: Multi-line message
with newlines
will hang"

# BAD EXAMPLE 2: Complex chained command
echo "start" && complex_command | grep pattern && echo "end" || echo "failed"

# BAD EXAMPLE 3: Unclosed quote
echo "This quote is not closed properly

# GOOD EXAMPLE 1: Single line commit
git commit -m "feat: Single line message works fine"

# GOOD EXAMPLE 2: Simple commands
echo "Simple command"
git add file.txt
git commit -m "Another simple message"
EOF

    echo "🔬 Testing synthetic hang patterns..."
    test_script_file "$test_file"
    
    # Cleanup
    rm -f "$test_file"
    echo ""
}

# Main test execution
echo "📁 Scanning maintenance scripts in: $MAINTENANCE_DIR"
echo ""

# Test all maintenance scripts
if [ -d "$MAINTENANCE_DIR" ]; then
    find "$MAINTENANCE_DIR" -name "*.sh" -type f | while read -r script; do
        test_script_file "$script"
        test_good_practices "$script"
    done
else
    echo "❌ Maintenance directory not found: $MAINTENANCE_DIR"
    exit 1
fi

# Test synthetic patterns
test_hang_patterns

# Test our own test scripts for hanging patterns
echo "🔄 Self-testing: Checking test scripts"
echo "====================================="
find "$SCRIPT_DIR" -name "*.sh" -type f | while read -r script; do
    echo "🔬 Self-test: $(basename "$script")"
    test_script_file "$script"
done

echo ""
echo "📊 ANTI-HANGING TEST SUMMARY"
echo "============================"
echo "🎯 Total checks run: $TOTAL_CHECKS"
echo "✅ Passed: $PASSED_CHECKS"
echo "❌ Failed: $FAILED_CHECKS"
echo "⚠️  Warnings: $WARNINGS"

if [ "$FAILED_CHECKS" -gt 0 ]; then
    echo ""
    echo "❌ CRITICAL ISSUES FOUND:"
    echo -e "$FAILED_PATTERNS"
    echo ""
    echo "🚨 These patterns WILL cause script hanging and must be fixed!"
    echo ""
    echo "💡 ANTI-HANGING BEST PRACTICES:"
    echo "   1. Use single-line strings in shell commands"
    echo "   2. Avoid multi-line commit messages in shell"
    echo "   3. Break complex chains into simple commands"
    echo "   4. Always use non-interactive flags (-y, --yes)"
    echo "   5. Add timeouts for network operations"
    echo "   6. Use 'set -e' for error handling"
    echo "   7. Test with minimal commands first"
    echo ""
    exit 1
fi

if [ "$WARNINGS" -gt 0 ]; then
    echo ""
    echo "⚠️  WARNINGS FOUND:"
    echo "   Review the warnings above to improve script robustness"
    echo "   These may not cause immediate hanging but could cause issues"
fi

echo ""
echo "🛡️  ANTI-HANGING VALIDATION COMPLETE"
echo "✅ No critical hanging patterns detected"
echo "✅ Scripts appear safe from hanging issues"

echo ""
echo "📚 ANTI-HANGING GUIDELINES:"
echo "   1. ✅ Keep shell command strings on single lines"
echo "   2. ✅ Use simple commands instead of complex chains"
echo "   3. ✅ Always close quotes properly"
echo "   4. ✅ Use non-interactive flags for package managers"
echo "   5. ✅ Add timeouts for network operations"
echo "   6. ✅ Use 'set -e' for proper error handling"
echo "   7. ✅ Test commands in isolation first"

exit 0
