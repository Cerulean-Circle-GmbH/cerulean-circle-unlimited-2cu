#!/bin/bash

# anti_hang_utils.sh - Utility functions to prevent script hanging
# Source this file in other scripts: source "$(dirname "${BASH_SOURCE[0]}")/anti_hang_utils.sh"

# Strict error handling to prevent hanging
set -e
set -u
set -o pipefail

# Function: Safe commit with single-line message
safe_commit() {
    local message="$1"
    local files="${2:-}"
    
    # Ensure message is on single line (replace newlines with spaces)
    local clean_message=$(echo "$message" | tr '\n' ' ' | tr -s ' ')
    
    if [ -n "$files" ]; then
        git add "$files"
    fi
    
    # Use single line commit to prevent hanging
    git commit -m "$clean_message"
}

# Function: Safe command execution with timeout
safe_execute() {
    local timeout_seconds="${1:-30}"
    shift
    local command=("$@")
    
    echo "🔧 Executing with ${timeout_seconds}s timeout: ${command[*]}"
    
    if command -v timeout >/dev/null 2>&1; then
        timeout "$timeout_seconds" "${command[@]}"
    else
        # Fallback for systems without timeout command
        "${command[@]}"
    fi
}

# Function: Safe network operation with retry and timeout
safe_network_op() {
    local max_retries="${1:-3}"
    local timeout_seconds="${2:-30}"
    shift 2
    local command=("$@")
    
    local retry=0
    while [ $retry -lt $max_retries ]; do
        echo "🌐 Network operation (attempt $((retry + 1))/$max_retries): ${command[*]}"
        
        if safe_execute "$timeout_seconds" "${command[@]}"; then
            echo "✅ Network operation succeeded"
            return 0
        else
            retry=$((retry + 1))
            if [ $retry -lt $max_retries ]; then
                echo "⚠️  Retry in 2 seconds..."
                sleep 2
            fi
        fi
    done
    
    echo "❌ Network operation failed after $max_retries attempts"
    return 1
}

# Function: Safe user input with timeout
safe_input() {
    local prompt="$1"
    local timeout_seconds="${2:-10}"
    local default_value="${3:-}"
    
    echo -n "$prompt"
    if [ -n "$default_value" ]; then
        echo -n " (default: $default_value, timeout: ${timeout_seconds}s): "
    else
        echo -n " (timeout: ${timeout_seconds}s): "
    fi
    
    local user_input=""
    if command -v timeout >/dev/null 2>&1; then
        if ! user_input=$(timeout "$timeout_seconds" bash -c 'read input; echo "$input"' 2>/dev/null); then
            echo ""
            echo "⏰ Timeout reached, using default: $default_value"
            user_input="$default_value"
        fi
    else
        # Fallback - just read normally (may hang, but better than nothing)
        read user_input
    fi
    
    echo "${user_input:-$default_value}"
}

# Function: Safe package installation
safe_package_install() {
    local package_manager="$1"
    shift
    local packages=("$@")
    
    case "$package_manager" in
        "npm")
            safe_execute 300 npm install --yes "${packages[@]}"
            ;;
        "apt-get")
            safe_execute 300 sudo apt-get install -y "${packages[@]}"
            ;;
        "yum")
            safe_execute 300 sudo yum install -y "${packages[@]}"
            ;;
        "brew")
            safe_execute 300 brew install "${packages[@]}"
            ;;
        *)
            echo "❌ Unsupported package manager: $package_manager"
            return 1
            ;;
    esac
}

# Function: Check for hanging patterns in a file
check_hang_patterns() {
    local file="$1"
    local issues_found=0
    
    echo "🔍 Checking $file for hanging patterns..."
    
    # Check for multi-line strings
    if grep -n 'commit -m ".*$' "$file" | grep -v '.*"$' >/dev/null 2>&1; then
        echo "⚠️  Warning: Potential multi-line commit message found"
        issues_found=$((issues_found + 1))
    fi
    
    # Check for complex chains
    if grep -n '&&.*&&.*&&' "$file" >/dev/null 2>&1; then
        echo "⚠️  Warning: Complex command chain found (may hang)"
        issues_found=$((issues_found + 1))
    fi
    
    # Check for interactive commands
    if grep -n '\bnpm install[^-]' "$file" >/dev/null 2>&1; then
        echo "⚠️  Warning: npm install without --yes flag found"
        issues_found=$((issues_found + 1))
    fi
    
    if [ $issues_found -eq 0 ]; then
        echo "✅ No hanging patterns detected"
    else
        echo "⚠️  Found $issues_found potential hanging patterns"
    fi
    
    return $issues_found
}

# Function: Validate script before execution
validate_script() {
    local script="$1"
    
    echo "🛡️  Validating script: $script"
    
    # Check syntax
    if ! bash -n "$script"; then
        echo "❌ Syntax error in script"
        return 1
    fi
    
    # Check for hanging patterns
    check_hang_patterns "$script"
    
    echo "✅ Script validation complete"
}

# Function: Safe file operations with backup
safe_file_operation() {
    local operation="$1"
    local source="$2"
    local destination="${3:-}"
    
    case "$operation" in
        "copy")
            if [ -z "$destination" ]; then
                echo "❌ Destination required for copy operation"
                return 1
            fi
            echo "📁 Safe copy: $source → $destination"
            cp "$source" "$destination"
            ;;
        "move")
            if [ -z "$destination" ]; then
                echo "❌ Destination required for move operation"
                return 1
            fi
            echo "📁 Safe move: $source → $destination"
            mv "$source" "$destination"
            ;;
        "delete")
            echo "🗑️  Safe delete: $source"
            if [ -f "$source" ] || [ -d "$source" ]; then
                rm -rf "$source"
            else
                echo "⚠️  File/directory does not exist: $source"
            fi
            ;;
        *)
            echo "❌ Unsupported operation: $operation"
            return 1
            ;;
    esac
}

# Function: Display anti-hanging guidelines
show_anti_hang_guidelines() {
    echo ""
    echo "🛡️  ANTI-HANGING GUIDELINES"
    echo "=========================="
    echo "✅ 1. Use single-line command strings"
    echo "✅ 2. Break complex chains into simple commands"
    echo "✅ 3. Always use non-interactive flags (-y, --yes)"
    echo "✅ 4. Add timeouts for network operations"
    echo "✅ 5. Use 'set -e' for proper error handling"
    echo "✅ 6. Validate quotes and escaping"
    echo "✅ 7. Test commands in isolation first"
    echo ""
    echo "❌ AVOID:"
    echo "❌ - Multi-line strings in shell commands"
    echo "❌ - Commands that wait for user input"
    echo "❌ - Complex nested pipes and chains"
    echo "❌ - Interactive package installations"
    echo "❌ - Network operations without timeouts"
    echo ""
}

# Export functions for use in other scripts
export -f safe_commit
export -f safe_execute
export -f safe_network_op
export -f safe_input
export -f safe_package_install
export -f check_hang_patterns
export -f validate_script
export -f safe_file_operation
export -f show_anti_hang_guidelines

echo "🛡️  Anti-hanging utilities loaded successfully"
