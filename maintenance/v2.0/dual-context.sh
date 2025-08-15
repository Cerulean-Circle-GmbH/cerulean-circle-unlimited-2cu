#!/bin/bash

# 🎯 Dual-Context Navigation System v2.0
# Unified interface for dual-context maintenance tools
# Based on Dual-Context Navigation Specification v1.0

set -euo pipefail

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# Script directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SRC_DIR="$SCRIPT_DIR/src"

# Banner
show_banner() {
    echo -e "${CYAN}╔════════════════════════════════════════════╗${NC}"
    echo -e "${CYAN}║     Dual-Context Navigation System v2.0    ║${NC}"
    echo -e "${CYAN}╚════════════════════════════════════════════╝${NC}"
}

# Usage function
usage() {
    show_banner
    echo -e "\n${BLUE}Usage: $0 <command> [arguments]${NC}"
    echo -e "\n${YELLOW}Commands:${NC}"
    echo -e "  ${GREEN}migrate${NC} <file-path> <page-id>"
    echo -e "    Migrate existing content to dual-context structure"
    echo -e "    Example: $0 migrate cerulean-circle-unlimited-2cu/doc.md 12345"
    echo -e ""
    echo -e "  ${GREEN}create${NC} <dir-path> <page-id> <topic-name>"
    echo -e "    Create new dual-context content from scratch"
    echo -e "    Example: $0 create cerulean-circle-unlimited-2cu/new 67890 NewDoc"
    echo -e ""
    echo -e "  ${GREEN}add${NC} <file-path> <page-id>"
    echo -e "    Add existing file to dual-context system"
    echo -e "    Example: $0 add cerulean-circle-unlimited-2cu/existing.md 54321"
    echo -e ""
    echo -e "  ${GREEN}update${NC} <file-path> [options]"
    echo -e "    Update/modify existing dual-context content"
    echo -e "    Options: --refresh-nav, --fix-links, --sync-content, --check-only"
    echo -e "    Example: $0 update cerulean-circle-unlimited-2cu/doc.md --sync-content"
    echo -e ""
    echo -e "  ${GREEN}status${NC} [pattern]"
    echo -e "    Show status of dual-context files"
    echo -e "    Example: $0 status 'cerulean-circle-unlimited-2cu/**/*.md'"
    echo -e ""
    echo -e "  ${GREEN}help${NC}"
    echo -e "    Show this help message"
    echo -e ""
    echo -e "${YELLOW}Documentation:${NC}"
    echo -e "  README: $SCRIPT_DIR/README.md"
    echo -e "  Specification: $SCRIPT_DIR/../specification.md"
    exit 0
}

# Check if tools exist
check_tools() {
    local tool="$1"
    if [ ! -f "$SRC_DIR/$tool.sh" ]; then
        echo -e "${RED}Error: Tool not found: $SRC_DIR/$tool.sh${NC}"
        exit 1
    fi
    if [ ! -x "$SRC_DIR/$tool.sh" ]; then
        echo -e "${RED}Error: Tool not executable: $SRC_DIR/$tool.sh${NC}"
        exit 1
    fi
}

# Status command
show_status() {
    local pattern="${1:-**/*.md}"
    echo -e "${BLUE}Checking dual-context status...${NC}\n"
    
    local total=0
    local dual_context=0
    local missing_page=0
    local missing_nav=0
    
    # Find all markdown files matching pattern
    while IFS= read -r file; do
        # Skip files in page structure
        if [[ "$file" == *"2cu.atlassian.net/wiki/spaces/CCU/pages"* ]]; then
            continue
        fi
        
        ((total++))
        
        # Check if has navigation header
        if head -n 1 "$file" 2>/dev/null | grep -q "📁.*🌐"; then
            ((dual_context++))
            echo -e "${GREEN}✓${NC} $(basename "$file") - Has dual-context"
        else
            ((missing_nav++))
            echo -e "${YELLOW}!${NC} $(basename "$file") - Missing navigation"
        fi
    done < <(find /workspace -path "*/\.git" -prune -o -name "*.md" -print | grep -E "$pattern" 2>/dev/null || true)
    
    echo -e "\n${CYAN}Summary:${NC}"
    echo -e "  Total files: $total"
    echo -e "  Dual-context: ${GREEN}$dual_context${NC}"
    echo -e "  Missing navigation: ${YELLOW}$missing_nav${NC}"
}

# Main logic
if [ $# -eq 0 ]; then
    usage
fi

COMMAND="$1"
shift

case "$COMMAND" in
    migrate)
        check_tools "migrate"
        "$SRC_DIR/migrate.sh" "$@"
        ;;
    create)
        check_tools "create"
        "$SRC_DIR/create.sh" "$@"
        ;;
    add)
        check_tools "add"
        "$SRC_DIR/add.sh" "$@"
        ;;
    update)
        check_tools "update"
        "$SRC_DIR/update.sh" "$@"
        ;;
    status)
        show_status "$@"
        ;;
    help|--help|-h)
        usage
        ;;
    *)
        echo -e "${RED}Error: Unknown command: $COMMAND${NC}"
        echo -e "Run '$0 help' for usage information"
        exit 1
        ;;
esac