#!/bin/bash

# Generate migration list for dual-context navigation

set -euo pipefail

echo "# Analyzing files for migration..."
echo "# Generated: $(date)"
echo ""

# Extract all .md files from index.md
echo "Files referenced in index.md:"
grep -oE '\./[^)]+\.md' /workspace/index.md | sed 's|^\./||' | sort -u > /tmp/index_files.txt
cat /tmp/index_files.txt | wc -l

# Check which ones already have navigation
echo -e "\nChecking migration status..."
TOTAL=0
MIGRATED=0
PENDING=0

while read -r file; do
    ((TOTAL++))
    if [ -f "/workspace/$file" ]; then
        if head -1 "/workspace/$file" 2>/dev/null | grep -q "📁.*🌐"; then
            ((MIGRATED++))
            echo "✓ MIGRATED: $file"
        else
            ((PENDING++))
            echo "✗ PENDING: $file"
        fi
    else
        echo "! NOT FOUND: $file"
    fi
done < /tmp/index_files.txt

echo -e "\n=== SUMMARY ==="
echo "Total files: $TOTAL"
echo "Already migrated: $MIGRATED"
echo "Pending migration: $PENDING"
echo "Success rate: $(( (MIGRATED * 100) / TOTAL ))%"