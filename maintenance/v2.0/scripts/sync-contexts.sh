#!/bin/bash

# sync-contexts.sh - Synchronize changes between dual contexts
# Version: 2.0 - Git-native synchronization
# Usage: ./sync-contexts.sh [--check-only]

set -euo pipefail

# Configuration
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/../../../.." && pwd)"
PAGES_DIR="$REPO_ROOT/2cu.atlassian.net/wiki/spaces/CCU/pages"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Helper functions
log_info() { echo -e "${GREEN}✓${NC} $1"; }
log_warn() { echo -e "${YELLOW}⚠${NC} $1"; }
log_error() { echo -e "${RED}✗${NC} $1"; }
log_debug() { echo -e "${BLUE}→${NC} $1"; }

# Parse arguments
CHECK_ONLY=false
if [ $# -gt 0 ] && [ "$1" = "--check-only" ]; then
    CHECK_ONLY=true
    log_info "Running in check-only mode"
fi

cd "$REPO_ROOT"

# Find all .entry.md files
echo "Scanning for dual-context files..."
ENTRY_FILES=$(find . -name "*.entry.md" -type f | grep -v "^\./\.git/" | sort)
ENTRY_COUNT=$(echo "$ENTRY_FILES" | grep -c . || echo 0)

if [ "$ENTRY_COUNT" -eq 0 ]; then
    log_warn "No .entry.md files found"
    exit 0
fi

log_info "Found $ENTRY_COUNT dual-context file pairs"

# Track sync status
SYNCED=0
OUT_OF_SYNC=0
ERRORS=0

# Check each entry file
echo "$ENTRY_FILES" | while IFS= read -r entry_file; do
    # Skip if empty
    [ -z "$entry_file" ] && continue
    
    # Derive symlink path (remove .entry.md)
    symlink_path="${entry_file%.entry.md}"
    
    # Check if symlink exists
    if [ ! -L "$symlink_path" ]; then
        log_error "Missing symlink: $symlink_path"
        ((ERRORS++))
        continue
    fi
    
    # Get the pages file path
    pages_file=$(readlink -f "$symlink_path")
    
    # Check if pages file exists
    if [ ! -f "$pages_file" ]; then
        log_error "Missing pages file: $pages_file"
        ((ERRORS++))
        continue
    fi
    
    # Compare checksums
    entry_sum=$(md5sum "$entry_file" | cut -d' ' -f1)
    pages_sum=$(md5sum "$pages_file" | cut -d' ' -f1)
    
    if [ "$entry_sum" = "$pages_sum" ]; then
        log_debug "In sync: ${entry_file#./}"
        ((SYNCED++))
    else
        log_warn "Out of sync: ${entry_file#./}"
        ((OUT_OF_SYNC++))
        
        if [ "$CHECK_ONLY" = false ]; then
            # Determine which file is newer
            if [ "$entry_file" -nt "$pages_file" ]; then
                log_info "  → Updating pages file from entry"
                cp "$entry_file" "$pages_file"
            else
                log_info "  → Updating entry file from pages"
                cp "$pages_file" "$entry_file"
            fi
        fi
    fi
done

# Summary
echo
echo "Summary:"
echo "  ✓ In sync: $SYNCED"
echo "  ⚠ Out of sync: $OUT_OF_SYNC"
echo "  ✗ Errors: $ERRORS"

# If not check-only and changes were made, commit them
if [ "$CHECK_ONLY" = false ] && [ "$OUT_OF_SYNC" -gt 0 ]; then
    # Create checkpoint
    CHECKPOINT_TAG="checkpoint-sync-$(date +%Y%m%d-%H%M%S)"
    git tag -a "$CHECKPOINT_TAG" -m "Checkpoint before sync" || true
    
    # Commit changes
    git add .
    git commit -m "sync: Synchronize dual-context files

- Synced $OUT_OF_SYNC file pairs
- Checkpoint: $CHECKPOINT_TAG" || log_warn "No changes to commit"
    
    log_info "Sync complete! Checkpoint: $CHECKPOINT_TAG"
fi

# Exit with error if issues found
if [ "$ERRORS" -gt 0 ]; then
    exit 1
fi

if [ "$CHECK_ONLY" = true ] && [ "$OUT_OF_SYNC" -gt 0 ]; then
    exit 2  # Different exit code for out-of-sync
fi