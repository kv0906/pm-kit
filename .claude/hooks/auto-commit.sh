#!/bin/bash
# Auto-commit hook for vault changes
# Called after Write/Edit operations on vault files

VAULT_PATH="${VAULT_PATH:-$(pwd)}"
MODIFIED_FILE="${1:-unknown}"

# Only run if auto-commit is enabled
if [ "${GIT_AUTO_COMMIT}" != "true" ]; then
    exit 0
fi

cd "$VAULT_PATH" || exit 0

# Check if this is a git repository
if [ ! -d .git ]; then
    exit 0
fi

# Check if there are changes to commit
if git diff --quiet && git diff --staged --quiet; then
    exit 0
fi

# Generate commit message based on file location
TIMESTAMP=$(date +"%Y-%m-%d %H:%M")

if [[ "$MODIFIED_FILE" == *"daily/"* ]]; then
    MSG="Update daily note - $TIMESTAMP"
elif [[ "$MODIFIED_FILE" == *"docs/"* ]]; then
    PROJECT=$(echo "$MODIFIED_FILE" | sed 's|.*/docs/\([^/]*\)/.*|\1|')
    if [ -z "$PROJECT" ] || [ "$PROJECT" = "general" ]; then
        PROJECT="general"
    fi
    MSG="Update doc ($PROJECT) - $TIMESTAMP"
elif [[ "$MODIFIED_FILE" == *"decisions/"* ]]; then
    PROJECT=$(echo "$MODIFIED_FILE" | sed 's|.*/decisions/\([^/]*\)/.*|\1|')
    MSG="Log decision ($PROJECT) - $TIMESTAMP"
elif [[ "$MODIFIED_FILE" == *"blockers/"* ]]; then
    PROJECT=$(echo "$MODIFIED_FILE" | sed 's|.*/blockers/\([^/]*\)/.*|\1|')
    MSG="Update blocker ($PROJECT) - $TIMESTAMP"
elif [[ "$MODIFIED_FILE" == *"meetings/"* ]]; then
    MSG="Add meeting notes - $TIMESTAMP"
elif [[ "$MODIFIED_FILE" == *"index/"* ]]; then
    MSG="Regenerate index - $TIMESTAMP"
elif [[ "$MODIFIED_FILE" == *"inbox/"* ]]; then
    MSG="Capture inbox item - $TIMESTAMP"
else
    MSG="Vault update - $TIMESTAMP"
fi

# Stage and commit
git add .
git commit -m "$MSG" --quiet 2>/dev/null

if [ $? -eq 0 ]; then
    echo "Auto-committed: $MSG"
fi
