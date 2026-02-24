#!/bin/bash
# Automated workspace backup to GitHub

WORKSPACE_DIR="/home/oscar/.openclaw/workspace"
REPO_DIR="$WORKSPACE_DIR/oscar-workspace"

cd "$REPO_DIR" || exit 1

# Copy updated files from workspace
cp "$WORKSPACE_DIR"/*.md . 2>/dev/null || true
cp -r "$WORKSPACE_DIR"/memory . 2>/dev/null || true

# Check if there are changes
if [[ -n $(git status --porcelain) ]]; then
    # Add and commit changes
    git add .
    TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S')
    git commit -m "Auto-backup: $TIMESTAMP"
    
    # Push to GitHub
    git push origin main
    
    echo "✅ Workspace backed up at $TIMESTAMP"
else
    echo "✓ No changes to backup"
fi
