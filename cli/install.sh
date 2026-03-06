#!/usr/bin/env bash
# PM-Kit CLI Installer
# Usage: curl -fsSL https://raw.githubusercontent.com/kv0906/pm-kit/main/cli/install.sh | bash

set -euo pipefail

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
BOLD='\033[1m'
NC='\033[0m'

info()  { echo -e "${CYAN}→${NC} $*"; }
ok()    { echo -e "${GREEN}✓${NC} $*"; }
warn()  { echo -e "${YELLOW}!${NC} $*"; }
err()   { echo -e "${RED}✗${NC} $*" >&2; }

echo -e "${CYAN}${BOLD}"
echo "╔═══════════════════════════════════════════════════╗"
echo "║   PM-Kit CLI Installer                           ║"
echo "╚═══════════════════════════════════════════════════╝"
echo -e "${NC}"

# --- Prerequisites ---

for cmd in bash git curl tar; do
  if ! command -v "$cmd" >/dev/null 2>&1; then
    err "Required command not found: $cmd"
    exit 1
  fi
done
ok "Prerequisites: bash, git, curl, tar"

# --- Platform ---

OS="$(uname -s)"
case "$OS" in
  Darwin) ok "Platform: macOS" ;;
  Linux)  ok "Platform: Linux" ;;
  *)      warn "Platform: $OS (untested, may work)" ;;
esac

# --- CLI home ---

CLI_HOME="${PM_KIT_HOME:-$HOME/.pm-kit}"
mkdir -p "$CLI_HOME/bin" "$CLI_HOME/lib"
info "Installing to: $CLI_HOME"

# --- Download latest release ---

REPO_SLUG="kv0906/pm-kit"
API_URL="https://api.github.com/repos/${REPO_SLUG}/releases/latest"

info "Fetching latest release..."

API_RESPONSE="$(curl -sS -w "\n%{http_code}" "$API_URL" 2>/dev/null)" || {
  err "Failed to reach GitHub API."
  exit 1
}

HTTP_CODE="$(echo "$API_RESPONSE" | tail -1)"
API_BODY="$(echo "$API_RESPONSE" | sed '$d')"

if [ "$HTTP_CODE" != "200" ]; then
  err "GitHub API returned $HTTP_CODE."
  exit 1
fi

REMOTE_TAG="$(echo "$API_BODY" | grep '"tag_name"' | head -1 | sed -E 's/.*"tag_name"[[:space:]]*:[[:space:]]*"([^"]+)".*/\1/')"
TARBALL_URL="$(echo "$API_BODY" | grep '"tarball_url"' | head -1 | sed -E 's/.*"tarball_url"[[:space:]]*:[[:space:]]*"([^"]+)".*/\1/')"
REMOTE_VERSION="${REMOTE_TAG#v}"

if [ -z "$REMOTE_VERSION" ] || [ -z "$TARBALL_URL" ]; then
  err "Could not parse release info."
  exit 1
fi

ok "Latest version: v${REMOTE_VERSION}"

# --- Download and extract ---

TMPDIR_INSTALL="$(mktemp -d)"
TARBALL="$TMPDIR_INSTALL/release.tar.gz"

info "Downloading..."
curl -sS -L -o "$TARBALL" "$TARBALL_URL" || {
  err "Download failed."
  rm -rf "$TMPDIR_INSTALL"
  exit 1
}

tar -xzf "$TARBALL" -C "$TMPDIR_INSTALL" || {
  err "Extraction failed."
  rm -rf "$TMPDIR_INSTALL"
  exit 1
}

EXTRACT_DIR="$(find "$TMPDIR_INSTALL" -mindepth 1 -maxdepth 1 -type d | head -1)"
if [ -z "$EXTRACT_DIR" ]; then
  err "Could not find extracted directory."
  rm -rf "$TMPDIR_INSTALL"
  exit 1
fi

# --- Install CLI files ---

CLI_SRC="$EXTRACT_DIR/cli"
if [ ! -d "$CLI_SRC" ]; then
  err "Release does not contain cli/ directory."
  err "This release may predate the CLI. Check for a newer release."
  rm -rf "$TMPDIR_INSTALL"
  exit 1
fi

info "Installing CLI..."

cp "$CLI_SRC/bin/pm-kit" "$CLI_HOME/bin/pm-kit"
chmod +x "$CLI_HOME/bin/pm-kit"

# Copy lib files
rm -rf "$CLI_HOME/lib"
cp -R "$CLI_SRC/lib" "$CLI_HOME/lib"

# Copy install.sh for reference
cp "$CLI_SRC/install.sh" "$CLI_HOME/install.sh" 2>/dev/null || true

# Write VERSION
echo "$REMOTE_VERSION" > "$CLI_HOME/VERSION"

# Initialize update check timer
date +%s > "$CLI_HOME/.last-update-check"

ok "CLI installed to $CLI_HOME"

# --- Cleanup ---

rm -rf "$TMPDIR_INSTALL"

# --- Add to PATH ---

BIN_DIR="$CLI_HOME/bin"
PATH_LINE="export PATH=\"$BIN_DIR:\$PATH\""

add_to_path() {
  local rc_file="$1"
  if [ -f "$rc_file" ]; then
    if grep -q "$BIN_DIR" "$rc_file" 2>/dev/null; then
      return 0  # Already present
    fi
  fi
  echo "" >> "$rc_file"
  echo "# PM-Kit CLI" >> "$rc_file"
  echo "$PATH_LINE" >> "$rc_file"
  return 1  # Added
}

SHELL_NAME="$(basename "$SHELL")"
ADDED_TO=""

case "$SHELL_NAME" in
  zsh)
    add_to_path "$HOME/.zshrc" || ADDED_TO="$HOME/.zshrc"
    ;;
  bash)
    if [ -f "$HOME/.bash_profile" ]; then
      add_to_path "$HOME/.bash_profile" || ADDED_TO="$HOME/.bash_profile"
    else
      add_to_path "$HOME/.bashrc" || ADDED_TO="$HOME/.bashrc"
    fi
    ;;
  *)
    add_to_path "$HOME/.profile" || ADDED_TO="$HOME/.profile"
    ;;
esac

# --- Success ---

echo ""
echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${GREEN}  PM-Kit CLI installed! (v${REMOTE_VERSION})${NC}"
echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""

if [ -n "$ADDED_TO" ]; then
  info "Added to PATH in $ADDED_TO"
  echo ""
  echo "To use immediately, run:"
  echo "  source $ADDED_TO"
  echo ""
fi

echo "Get started:"
echo "  pm-kit init              # Create a new vault"
echo "  pm-kit help              # See all commands"
echo ""
echo "Or from an existing vault:"
echo "  cd /path/to/vault"
echo "  pm-kit migrate           # Convert to CLI-managed"
echo "  pm-kit doctor            # Check vault health"
