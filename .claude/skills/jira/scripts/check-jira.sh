#!/usr/bin/env bash
# Check acli (Atlassian CLI) installation and auth status
set -euo pipefail

echo "=== Jira CLI (acli) Status Check ==="
echo ""

# Check if acli is installed
if command -v acli &>/dev/null; then
    echo "[OK] acli found: $(which acli)"
    echo "     Version: $(acli --version 2>/dev/null || echo 'unknown')"
else
    echo "[MISSING] acli not found"
    echo "  Install: brew install acli"
    echo "  Or download from: https://bobswift.atlassian.net/wiki/spaces/ACLI"
    exit 1
fi

echo ""

# Check auth / connectivity
echo "=== Auth Status ==="
if acli jira --action getServerInfo 2>/dev/null; then
    echo ""
    echo "[OK] Jira connection verified"
else
    echo "[NOT CONFIGURED] Cannot connect to Jira"
    echo "  1. Generate API token: https://id.atlassian.com/manage-profile/security/api-tokens"
    echo "  2. Configure: acli jira --server https://YOUR-ORG.atlassian.net --user your@email.com --token YOUR_TOKEN --action getServerInfo"
    echo "  3. Save to ~/.acli/credentials"
fi

echo ""
echo "=== Done ==="
