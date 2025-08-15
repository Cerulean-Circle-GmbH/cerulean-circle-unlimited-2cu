#!/bin/bash

# deploy-to-main.sh - Deploy dual-context architecture to main branch
# Version: 2.0 - Clean deployment without merge conflicts
# Usage: ./deploy-to-main.sh [--dry-run]

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
log_step() { echo -e "${BLUE}→${NC} $1"; }

# Parse arguments
DRY_RUN=false
if [ $# -gt 0 ] && [ "$1" = "--dry-run" ]; then
    DRY_RUN=true
    log_info "Running in dry-run mode (no changes will be made)"
fi

cd "$REPO_ROOT"

# Pre-flight checks
log_step "Running pre-flight checks..."

# Check current branch
CURRENT_BRANCH=$(git branch --show-current)
if [ "$CURRENT_BRANCH" != "main" ]; then
    log_error "Must be on main branch (current: $CURRENT_BRANCH)"
    exit 1
fi

# Check git status
if ! git diff --quiet || ! git diff --cached --quiet; then
    log_error "Git working directory is not clean"
    exit 1
fi

# Pull latest
log_step "Pulling latest from origin/main..."
if [ "$DRY_RUN" = false ]; then
    git pull origin main
fi

# Create deployment tag
DEPLOY_TAG="pre-dual-context-$(date +%Y%m%d-%H%M%S)"
if [ "$DRY_RUN" = false ]; then
    git tag -a "$DEPLOY_TAG" -m "State before dual-context deployment"
    log_info "Created deployment tag: $DEPLOY_TAG"
fi

# Find all markdown files to convert
log_step "Scanning for markdown files to convert..."
MD_FILES=$(find cerulean-circle-unlimited-2cu -name "*.md" -type f | grep -v "\.entry\.md$" | sort)
MD_COUNT=$(echo "$MD_FILES" | grep -c . || echo 0)

log_info "Found $MD_COUNT markdown files to convert"

if [ "$DRY_RUN" = true ]; then
    echo "Files that would be converted:"
    echo "$MD_FILES" | head -20
    if [ "$MD_COUNT" -gt 20 ]; then
        echo "... and $((MD_COUNT - 20)) more"
    fi
    echo
    log_info "Dry run complete. No changes made."
    exit 0
fi

# Convert each file
CONVERTED=0
FAILED=0

echo "$MD_FILES" | while IFS= read -r md_file; do
    [ -z "$md_file" ] && continue
    
    # Generate page ID
    PAGE_ID=$(date +%s%N | cut -b1-13)
    FILENAME=$(basename "$md_file")
    
    log_step "Converting: ${md_file#./}"
    
    # Create pages directory
    PAGES_FILE_DIR="$PAGES_DIR/$PAGE_ID"
    mkdir -p "$PAGES_FILE_DIR"
    
    # Copy to pages
    PAGES_FILE="$PAGES_FILE_DIR/$FILENAME"
    cp "$md_file" "$PAGES_FILE"
    
    # Create entry file
    ENTRY_FILE="${md_file}.entry.md"
    cp "$md_file" "$ENTRY_FILE"
    
    # Convert to symlink
    SYMLINK_TARGET="../$(realpath --relative-to="$(dirname "$md_file")" "$PAGES_FILE")"
    rm "$md_file"
    ln -s "$SYMLINK_TARGET" "$md_file"
    
    # Optimize links in pages file
    sed -i -E 's|\.\./(\.\./)*2cu\.atlassian\.net/wiki/spaces/CCU/pages/([0-9]+)/([^)]+\.md)|../\2/\3|g' "$PAGES_FILE" 2>/dev/null || true
    
    ((CONVERTED++))
    
    # Commit in batches of 10
    if [ $((CONVERTED % 10)) -eq 0 ]; then
        git add .
        git commit -m "deploy: Convert batch of 10 files to dual-context (total: $CONVERTED/$MD_COUNT)" || true
    fi
done

# Final commit for remaining files
git add .
git commit -m "deploy: Complete dual-context deployment

- Converted $CONVERTED markdown files
- Created $CONVERTED .entry.md files
- Deployment tag: $DEPLOY_TAG" || true

# Validate deployment
log_step "Validating deployment..."

# Count results
SYMLINKS=$(find cerulean-circle-unlimited-2cu -name "*.md" -type l | grep -v "\.entry\.md$" | wc -l)
ENTRIES=$(find cerulean-circle-unlimited-2cu -name "*.entry.md" -type f | wc -l)
PAGES=$(find "$PAGES_DIR" -name "*.md" -type f | wc -l)

log_info "Deployment complete!"
echo
echo "Statistics:"
echo "  📄 Converted files: $CONVERTED"
echo "  🔗 Symlinks created: $SYMLINKS"
echo "  📝 Entry files created: $ENTRIES"
echo "  📁 Pages files: $PAGES"
echo "  🏷️  Deployment tag: $DEPLOY_TAG"
echo
echo "To rollback if needed: git reset --hard $DEPLOY_TAG && git clean -fd"

# Push to remote
read -p "Push to origin/main? (yes/no): " push_confirm
if [ "$push_confirm" = "yes" ]; then
    git push origin main
    git push --tags
    log_info "Pushed to origin/main"
fi