#!/bin/bash

# add-file.sh - Add a new markdown file to the dual-context architecture
# Version: 2.0 - Pure git operations, no backup files
# Usage: ./add-file.sh <path/to/file.md>

set -euo pipefail

# Configuration
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/../../../.." && pwd)"
PAGES_DIR="$REPO_ROOT/2cu.atlassian.net/wiki/spaces/CCU/pages"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Helper functions
log_info() { echo -e "${GREEN}✓${NC} $1"; }
log_warn() { echo -e "${YELLOW}⚠${NC} $1"; }
log_error() { echo -e "${RED}✗${NC} $1"; }

# Validate arguments
if [ $# -eq 0 ]; then
    log_error "Usage: $0 <path/to/file.md>"
    exit 1
fi

FILE_PATH="$1"

# Convert to absolute path if relative
if [[ ! "$FILE_PATH" = /* ]]; then
    FILE_PATH="$REPO_ROOT/$FILE_PATH"
fi

# Validate file
if [ ! -f "$FILE_PATH" ]; then
    log_error "File not found: $FILE_PATH"
    exit 1
fi

if [[ ! "$FILE_PATH" =~ \.md$ ]]; then
    log_error "File must be a markdown file (.md)"
    exit 1
fi

# Check git status
cd "$REPO_ROOT"
if ! git diff --quiet || ! git diff --cached --quiet; then
    log_error "Git working directory is not clean. Please commit or stash changes."
    exit 1
fi

# Generate page ID (timestamp-based for uniqueness)
PAGE_ID=$(date +%s%N | cut -b1-13)
FILENAME=$(basename "$FILE_PATH")
REL_PATH="${FILE_PATH#$REPO_ROOT/}"

log_info "Adding file to dual-context architecture: $REL_PATH"

# Create checkpoint
CHECKPOINT_TAG="checkpoint-add-$(basename "$FILE_PATH" .md)-$(date +%Y%m%d-%H%M%S)"
git tag -a "$CHECKPOINT_TAG" -m "Checkpoint before adding $REL_PATH" || true

log_info "Created checkpoint: $CHECKPOINT_TAG"

# Step 1: Create pages directory
PAGES_FILE_DIR="$PAGES_DIR/$PAGE_ID"
mkdir -p "$PAGES_FILE_DIR"

# Step 2: Copy file to pages structure
PAGES_FILE="$PAGES_FILE_DIR/$FILENAME"
cp "$FILE_PATH" "$PAGES_FILE"

log_info "Copied to pages: $PAGES_FILE"

# Step 3: Convert original to symlink
SYMLINK_TARGET="../$(realpath --relative-to="$(dirname "$FILE_PATH")" "$PAGES_FILE")"
rm "$FILE_PATH"
ln -s "$SYMLINK_TARGET" "$FILE_PATH"

log_info "Created symlink: $FILE_PATH → $SYMLINK_TARGET"

# Step 4: Create .entry.md file
ENTRY_FILE="${FILE_PATH}.entry.md"
cp "$PAGES_FILE" "$ENTRY_FILE"

log_info "Created entry file: $ENTRY_FILE"

# Step 5: Optimize links in pages file
# Convert relative paths that go up to the root and back down to pages
sed -i -E 's|\.\./(\.\./)*2cu\.atlassian\.net/wiki/spaces/CCU/pages/([0-9]+)/([^)]+\.md)|../\2/\3|g' "$PAGES_FILE" 2>/dev/null || true

# Step 6: Commit changes
git add "$PAGES_FILE" "$FILE_PATH" "$ENTRY_FILE"
git commit -m "feat: Add $REL_PATH to dual-context architecture

- Page ID: $PAGE_ID
- Pages file: ${PAGES_FILE#$REPO_ROOT/}
- Symlink: ${FILE_PATH#$REPO_ROOT/}
- Entry file: ${ENTRY_FILE#$REPO_ROOT/}
- Checkpoint: $CHECKPOINT_TAG"

log_info "Successfully added $FILENAME to dual-context architecture!"

# Summary
echo
echo "Summary:"
echo "  📄 Original: $REL_PATH (now symlink)"
echo "  📁 Pages: ${PAGES_FILE#$REPO_ROOT/}"
echo "  📝 Entry: ${ENTRY_FILE#$REPO_ROOT/}"
echo "  🏷️  Checkpoint: $CHECKPOINT_TAG"
echo
echo "To rollback if needed: git reset --hard $CHECKPOINT_TAG"