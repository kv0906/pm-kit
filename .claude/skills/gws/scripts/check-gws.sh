#!/usr/bin/env bash
# Check gws CLI installation and auth status
set -euo pipefail

echo "=== GWS CLI Status Check ==="
echo ""

# Check if gws is installed
if command -v gws &>/dev/null; then
    echo "[OK] gws found: $(which gws)"
    echo "     Version: $(gws --version 2>/dev/null || echo 'unknown')"
else
    echo "[MISSING] gws not found"
    echo "  Install: npm install -g @googleworkspace/cli"
    exit 1
fi

echo ""

# Check if gcloud is installed
if command -v gcloud &>/dev/null; then
    echo "[OK] gcloud found: $(which gcloud)"
else
    echo "[MISSING] gcloud not found"
    echo "  Install: brew install --cask google-cloud-sdk"
fi

echo ""

# Check auth status
echo "=== Auth Status ==="
if gws auth list 2>/dev/null; then
    echo ""
    echo "[OK] Auth configured"
else
    echo "[NOT CONFIGURED] Run: gws auth setup && gws auth login"
fi

echo ""

# Quick connectivity test
echo "=== Connectivity Test ==="
if gws gmail users messages list --params '{"userId": "me", "maxResults": 1}' &>/dev/null; then
    echo "[OK] Gmail API accessible"
else
    echo "[FAIL] Gmail API not accessible - check auth and API enablement"
fi

echo ""
echo "=== Done ==="
