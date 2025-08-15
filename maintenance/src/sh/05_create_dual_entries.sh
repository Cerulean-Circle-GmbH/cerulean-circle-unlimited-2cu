#!/bin/bash

# Dual Entry Point Creation Script - PDCA Cycle 6
# Creates .entry.md files for original context navigation

echo "=== PDCA Cycle 6: Dual-Context Entry Points ==="
echo "Creating .entry.md files for original context navigation"
echo ""

# Safety check
read -p "This will create dual entry points (.entry.md files) using migration backups. Continue? (yes/no): " confirm
if [ "$confirm" != "yes" ]; then
    echo "Dual entry creation cancelled."
    exit 1
fi

echo ""

# Find all .migration.backup files
migration_backups=$(find . -name "*.migration.backup" 2>/dev/null)

if [ -z "$migration_backups" ]; then
    echo "No migration backup files found!"
    exit 1
fi

echo "Found migration backups: $(echo "$migration_backups" | wc -l)"
echo ""

created_count=0

echo "$migration_backups" | while IFS= read -r backup_file; do
    # Extract the base name without .migration.backup
    base_file="${backup_file%.migration.backup}"
    entry_file="${base_file}.entry.md"
    
    echo "Processing: $backup_file"
    echo "  → Creating: $entry_file"
    
    # Copy the migration backup to .entry.md
    cp "$backup_file" "$entry_file"
    
    # Verify the symlink still exists for pages context
    if [ -L "$base_file" ]; then
        echo "  ✓ Symlink preserved: $base_file (pages context)"
        echo "  ✓ Entry created: $entry_file (original context)"
    else
        echo "  ⚠️  WARNING: No symlink found at $base_file"
    fi
    
    created_count=$((created_count + 1))
    echo ""
done

echo ""
echo "=== Dual Entry Creation Complete ==="
echo "✓ .entry.md files created: $created_count"
echo ""
echo "Architecture Summary:"
echo "  - .md files: Symlinks to pages structure (pages context)"
echo "  - .entry.md files: Original content with original links (original context)"
echo ""
echo "Example for scrum:"
echo "  - scrum.md → symlink to pages (works from pages context)"
echo "  - scrum.entry.md → original file (works from original context)"
echo ""
echo "Next: Document synchronization strategy and test navigation"
