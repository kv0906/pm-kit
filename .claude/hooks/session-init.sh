#!/bin/bash
# Session initialization hook for MindLoom vault
# Sets up environment variables for the Claude Code session

# Set vault path (defaults to current directory)
export VAULT_PATH="${VAULT_PATH:-$(pwd)}"

# Date variables for daily operations
export TODAY=$(date +%Y-%m-%d)
export YESTERDAY=$(date -v-1d +%Y-%m-%d 2>/dev/null || date -d "yesterday" +%Y-%m-%d)
export CURRENT_WEEK=$(date +%Y-W%V)

# Daily note path
export DAILY_NOTE="$VAULT_PATH/daily/$TODAY.md"

# Parse active projects from config.yaml
if [ -f "$VAULT_PATH/_core/config.yaml" ]; then
    ACTIVE_PROJECTS=$(grep -A2 "active: true" "$VAULT_PATH/_core/config.yaml" | grep "id:" | sed 's/.*id: //' | tr '\n' ',' | sed 's/,$//')
    export ACTIVE_PROJECTS
fi

# Verify vault structure
if [ ! -f "$VAULT_PATH/CLAUDE.md" ]; then
    echo "Note: Not in a vault root directory (no CLAUDE.md found)"
fi

# Output session info
echo "MindLoom session initialized"
echo "  Vault: $VAULT_PATH"
echo "  Today: $TODAY"
if [ -n "$ACTIVE_PROJECTS" ]; then
    echo "  Projects: $ACTIVE_PROJECTS"
fi
