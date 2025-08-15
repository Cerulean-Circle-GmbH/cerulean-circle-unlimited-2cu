#!/bin/bash

# install_git_hooks.sh - Install git hooks for dual-context maintenance automation
# Usage: ./install_git_hooks.sh [--uninstall]

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/../" && pwd)"
GIT_HOOKS_DIR="$REPO_ROOT/.git/hooks"
MAINTENANCE_HOOKS_DIR="$SCRIPT_DIR/git-hooks"

UNINSTALL=false

# Parse command line arguments
if [[ "$1" == "--uninstall" ]]; then
    UNINSTALL=true
fi

echo "⚙️  Git Hooks Installation for Dual-Context Architecture"
echo "======================================================"

if [ "$UNINSTALL" = true ]; then
    echo "🗑️  UNINSTALL MODE"
else
    echo "📥 INSTALL MODE"
fi

echo ""

# Check if we're in a git repository
if [ ! -d "$REPO_ROOT/.git" ]; then
    echo "❌ ERROR: Not in a git repository"
    echo "   Current directory: $REPO_ROOT"
    exit 1
fi

echo "📁 Repository: $REPO_ROOT"
echo "📁 Git hooks directory: $GIT_HOOKS_DIR"
echo "📁 Maintenance hooks: $MAINTENANCE_HOOKS_DIR"

# Function to install a hook
install_hook() {
    local hook_name="$1"
    local source_file="$MAINTENANCE_HOOKS_DIR/$hook_name"
    local target_file="$GIT_HOOKS_DIR/$hook_name"
    
    if [ ! -f "$source_file" ]; then
        echo "❌ Source hook not found: $source_file"
        return 1
    fi
    
    if [ "$UNINSTALL" = true ]; then
        if [ -f "$target_file" ]; then
            # Check if it's our hook (contains dual-context signature)
            if grep -q "dual-context architecture" "$target_file" 2>/dev/null; then
                rm "$target_file"
                echo "🗑️  Removed: $hook_name"
            else
                echo "⚠️  Skipped: $hook_name (not our hook)"
            fi
        else
            echo "📝 Not installed: $hook_name"
        fi
    else
        # Install mode
        if [ -f "$target_file" ]; then
            # Backup existing hook
            cp "$target_file" "${target_file}.backup.$(date +%Y%m%d_%H%M%S)"
            echo "💾 Backed up existing: $hook_name"
        fi
        
        # Copy and make executable
        cp "$source_file" "$target_file"
        chmod +x "$target_file"
        echo "✅ Installed: $hook_name"
    fi
}

# Install/uninstall hooks
echo ""
if [ "$UNINSTALL" = true ]; then
    echo "🗑️  REMOVING GIT HOOKS"
    echo "====================="
else
    echo "📥 INSTALLING GIT HOOKS"
    echo "======================"
fi

# List of hooks to install
HOOKS_TO_INSTALL="pre-commit post-merge"

for hook in $HOOKS_TO_INSTALL; do
    install_hook "$hook"
done

# Make all maintenance scripts executable
echo ""
echo "🔧 SETTING SCRIPT PERMISSIONS"
echo "============================="

find "$SCRIPT_DIR/src/sh" -name "*.sh" -type f | while read -r script; do
    chmod +x "$script"
    echo "✅ Made executable: $(basename "$script")"
done

# Test hooks (install mode only)
if [ "$UNINSTALL" = false ]; then
    echo ""
    echo "🧪 TESTING HOOK INSTALLATION"
    echo "============================"
    
    for hook in $HOOKS_TO_INSTALL; do
        local hook_file="$GIT_HOOKS_DIR/$hook"
        if [ -x "$hook_file" ]; then
            echo "✅ $hook is executable"
        else
            echo "❌ $hook is NOT executable"
        fi
    done
    
    # Test maintenance scripts
    echo ""
    echo "🧪 TESTING MAINTENANCE SCRIPTS"
    echo "=============================="
    
    find "$SCRIPT_DIR/src/sh" -name "*.sh" -type f | while read -r script; do
        if [ -x "$script" ]; then
            echo "✅ $(basename "$script") is executable"
        else
            echo "❌ $(basename "$script") is NOT executable"
        fi
    done
fi

# Summary
echo ""
echo "📊 INSTALLATION SUMMARY"
echo "======================"

if [ "$UNINSTALL" = true ]; then
    echo "✅ Git hooks uninstallation complete"
    echo ""
    echo "💡 Manual actions if needed:"
    echo "   - Remove maintenance directory: rm -rf maintenance/"
    echo "   - Restore original git workflow"
else
    echo "✅ Git hooks installation complete"
    echo ""
    echo "🎯 WHAT HAPPENS NOW:"
    echo "   📋 pre-commit: Validates dual-context integrity before commits"
    echo "   📋 post-merge: Auto-integrates new files and checks sync needs"
    echo ""
    echo "🔧 AVAILABLE MAINTENANCE TOOLS:"
    echo "   📁 maintenance/src/sh/add_new_markdown.sh - Integrate new MD files"
    echo "   📁 maintenance/src/sh/sync_dual_context.sh - Sync dual-context files"
    echo "   📁 maintenance/src/sh/validate_links.sh - Check link integrity"
    echo "   📁 maintenance/src/sh/cleanup_maintenance.sh - Clean backup files"
    echo ""
    echo "💡 QUICK START:"
    echo "   1. Add new MD file: maintenance/src/sh/add_new_markdown.sh path/to/file.md"
    echo "   2. Sync changes: maintenance/src/sh/sync_dual_context.sh --dry-run"
    echo "   3. Validate links: maintenance/src/sh/validate_links.sh"
    echo "   4. Clean backups: maintenance/src/sh/cleanup_maintenance.sh --dry-run"
fi

echo ""
echo "🎉 Setup complete!"
