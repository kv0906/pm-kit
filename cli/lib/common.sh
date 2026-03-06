#!/usr/bin/env bash
# PM-Kit CLI — shared utilities
# Sourced by all CLI subcommands

# --- Colors & Logging ---

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

banner() {
  echo -e "${CYAN}${BOLD}"
  echo "╔═══════════════════════════════════════════════════╗"
  echo "║   PM-Kit CLI                                     ║"
  echo "╚═══════════════════════════════════════════════════╝"
  echo -e "${NC}"
}

# --- Platform detection ---

is_macos() { [[ "$OSTYPE" == darwin* ]]; }

sed_inplace() {
  if is_macos; then
    sed -i '' "$@"
  else
    sed -i "$@"
  fi
}

# --- Prerequisites ---

command_exists() { command -v "$1" >/dev/null 2>&1; }

require_commands() {
  local missing=0
  for cmd in "$@"; do
    if ! command_exists "$cmd"; then
      err "Required command not found: $cmd"
      missing=1
    fi
  done
  if [ "$missing" -eq 1 ]; then
    exit 1
  fi
}

# --- Vault detection ---

# Walk up from cwd looking for .pm-kit marker or VERSION + CLAUDE.md
find_vault_root() {
  local dir="${1:-$(pwd)}"

  while [ "$dir" != "/" ]; do
    # CLI-managed vault: has .pm-kit marker
    if [ -f "$dir/.pm-kit" ]; then
      echo "$dir"
      return 0
    fi
    # Template-based vault: has VERSION + CLAUDE.md + _core/config.yaml
    if [ -f "$dir/VERSION" ] && [ -f "$dir/CLAUDE.md" ] && [ -f "$dir/_core/config.yaml" ]; then
      echo "$dir"
      return 0
    fi
    dir="$(dirname "$dir")"
  done

  return 1
}

require_vault() {
  VAULT_DIR="$(find_vault_root)" || {
    err "Not inside a PM-Kit vault."
    err "Run ${BOLD}pm-kit init${NC} to create one, or cd into an existing vault."
    exit 1
  }
}

# --- GitHub API ---

REPO_SLUG="kv0906/pm-kit"

github_latest_release() {
  # Local testing override — skip GitHub API entirely
  if [ -n "${PM_KIT_LOCAL_TARBALL:-}" ]; then
    REMOTE_VERSION="${PM_KIT_LOCAL_VERSION:-99.99.99}"
    REMOTE_TAG="v$REMOTE_VERSION"
    TARBALL_URL="local://$PM_KIT_LOCAL_TARBALL"
    RELEASE_BODY="Local test release"
    return 0
  fi

  local api_url="https://api.github.com/repos/${REPO_SLUG}/releases/latest"
  local api_response

  api_response="$(curl -sS -w "\n%{http_code}" "$api_url" 2>/dev/null)" || {
    err "Failed to reach GitHub API. Check your network connection."
    return 1
  }

  local http_code
  http_code="$(echo "$api_response" | tail -1)"
  API_BODY="$(echo "$api_response" | sed '$d')"

  if [ "$http_code" != "200" ]; then
    err "GitHub API returned $http_code. No releases found for ${REPO_SLUG}."
    return 1
  fi

  REMOTE_TAG="$(echo "$API_BODY" | grep '"tag_name"' | head -1 | sed -E 's/.*"tag_name"[[:space:]]*:[[:space:]]*"([^"]+)".*/\1/')"
  TARBALL_URL="$(echo "$API_BODY" | grep '"tarball_url"' | head -1 | sed -E 's/.*"tarball_url"[[:space:]]*:[[:space:]]*"([^"]+)".*/\1/')"
  RELEASE_BODY="$(echo "$API_BODY" | grep '"body"' | head -1 | sed -E 's/.*"body"[[:space:]]*:[[:space:]]*"(.*)".*/\1/' | sed 's/\\n/\n/g; s/\\r//g')"
  REMOTE_VERSION="${REMOTE_TAG#v}"

  if [ -z "$REMOTE_VERSION" ] || [ -z "$TARBALL_URL" ]; then
    err "Could not parse release info from GitHub API."
    return 1
  fi

  return 0
}

# Download and extract a release tarball into a temp directory
# Sets EXTRACT_DIR to the extracted content root
download_and_extract() {
  local tarball_url="$1"
  local version="$2"

  TMPDIR_UPDATE="$(mktemp -d)"
  local tarball="$TMPDIR_UPDATE/release.tar.gz"

  # Local testing override — copy instead of download
  if [ -n "${PM_KIT_LOCAL_TARBALL:-}" ]; then
    info "Using local tarball: $PM_KIT_LOCAL_TARBALL"
    cp "$PM_KIT_LOCAL_TARBALL" "$tarball" || {
      err "Failed to copy local tarball."
      rm -rf "$TMPDIR_UPDATE"
      return 1
    }
  else
    info "Downloading v${version}..."
    curl -sS -L -o "$tarball" "$tarball_url" || {
      err "Download failed."
      rm -rf "$TMPDIR_UPDATE"
      return 1
    }
  fi

  info "Extracting..."
  tar -xzf "$tarball" -C "$TMPDIR_UPDATE" || {
    err "Extraction failed."
    rm -rf "$TMPDIR_UPDATE"
    return 1
  }

  # GitHub tarballs extract to owner-repo-hash/ directory
  EXTRACT_DIR="$(find "$TMPDIR_UPDATE" -mindepth 1 -maxdepth 1 -type d | head -1)"
  if [ -z "$EXTRACT_DIR" ]; then
    err "Could not find extracted directory."
    rm -rf "$TMPDIR_UPDATE"
    return 1
  fi

  return 0
}

cleanup_tmp() {
  [ -n "${TMPDIR_UPDATE:-}" ] && rm -rf "$TMPDIR_UPDATE"
}

# --- Self-update nag ---

CLI_HOME="${PM_KIT_HOME:-$HOME/.pm-kit}"
LAST_CHECK_FILE="$CLI_HOME/.last-update-check"

# Non-blocking background check (24h cooldown)
maybe_check_for_updates() {
  # Skip if no VERSION file
  [ -f "$CLI_HOME/VERSION" ] || return 0

  # Check cooldown (24 hours = 86400 seconds)
  if [ -f "$LAST_CHECK_FILE" ]; then
    local last_check
    last_check="$(cat "$LAST_CHECK_FILE" 2>/dev/null || echo 0)"
    local now
    now="$(date +%s)"
    local diff=$((now - last_check))
    if [ "$diff" -lt 86400 ]; then
      return 0
    fi
  fi

  # Run check in background
  (
    date +%s > "$LAST_CHECK_FILE"
    if github_latest_release 2>/dev/null; then
      local local_ver
      local_ver="$(cat "$CLI_HOME/VERSION" 2>/dev/null | tr -d '[:space:]')"
      if [ "$local_ver" != "$REMOTE_VERSION" ] && [ -n "$REMOTE_VERSION" ]; then
        echo -e "\n${YELLOW}!${NC} PM-Kit CLI update available: v${local_ver} → v${REMOTE_VERSION}" >&2
        echo -e "  Run ${BOLD}pm-kit self-update${NC} to update.\n" >&2
      fi
    fi
  ) &
  disown 2>/dev/null
}

# --- CLI version ---

cli_version() {
  if [ -f "$CLI_HOME/VERSION" ]; then
    tr -d '[:space:]' < "$CLI_HOME/VERSION"
  else
    echo "unknown"
  fi
}
