#!/usr/bin/env bash
set -euo pipefail

# PM-Kit Update Script
# Downloads the latest release from GitHub and safely updates framework files.
# User content (notes, config) is never touched.

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
VAULT_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"

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

# Banner
if command -v npx >/dev/null 2>&1; then
    npx -y oh-my-logo "PM-Kit" sunset --filled 2>/dev/null || true
    echo ""
    echo -e "  ${CYAN}Framework Updater${NC}"
    echo ""
else
    echo -e "${CYAN}${BOLD}"
    echo "╔═══════════════════════════════════════════════════╗"
    echo "║   PM-Kit Framework Updater                       ║"
    echo "╚═══════════════════════════════════════════════════╝"
    echo -e "${NC}"
fi

# --- Flag parsing ---

CHECK_ONLY=false
DRY_RUN=false

usage() {
  echo "Usage: $(basename "$0") [OPTIONS]"
  echo ""
  echo "Check for and apply PM-Kit framework updates from GitHub releases."
  echo ""
  echo "Options:"
  echo "  --check     Check for updates only (no download or changes)"
  echo "  --dry-run   Download and preview what would change (no apply)"
  echo "  --help      Show this help message"
  echo ""
  echo "Examples:"
  echo "  ./scripts/update.sh            # Check and apply if available"
  echo "  ./scripts/update.sh --check    # Just check version"
  echo "  ./scripts/update.sh --dry-run  # Preview changes without applying"
}

for arg in "$@"; do
  case "$arg" in
    --check)   CHECK_ONLY=true ;;
    --dry-run) DRY_RUN=true ;;
    --help)    usage; exit 0 ;;
    *)         err "Unknown option: $arg"; usage; exit 1 ;;
  esac
done

# --- Preflight ---

for cmd in curl tar git; do
  command -v "$cmd" >/dev/null 2>&1 || { err "Required command not found: $cmd"; exit 1; }
done

VERSION_FILE="$VAULT_DIR/VERSION"
if [ ! -f "$VERSION_FILE" ]; then
  err "VERSION file not found. Run setup.sh first."
  exit 1
fi

LOCAL_VERSION="$(tr -d '[:space:]' < "$VERSION_FILE")"
info "Local version: ${BOLD}v${LOCAL_VERSION}${NC}"

# --- Detect repo owner/name from git remote ---

REPO_SLUG="kv0906/pm-kit"
REMOTE_URL="$(git -C "$VAULT_DIR" remote get-url origin 2>/dev/null || true)"
if [ -n "$REMOTE_URL" ]; then
  # Extract owner/repo from SSH or HTTPS URLs
  EXTRACTED="$(echo "$REMOTE_URL" | sed -E 's#.*[:/]([^/]+/[^/.]+)(\.git)?$#\1#')"
  if [ -n "$EXTRACTED" ] && [ "$EXTRACTED" != "$REMOTE_URL" ]; then
    REPO_SLUG="$EXTRACTED"
  fi
fi

info "Repository: ${BOLD}${REPO_SLUG}${NC}"

# --- Query latest release ---

API_URL="https://api.github.com/repos/${REPO_SLUG}/releases/latest"
info "Checking for updates..."

API_RESPONSE="$(curl -sS -w "\n%{http_code}" "$API_URL" 2>/dev/null)" || {
  err "Failed to reach GitHub API. Check your network connection."
  exit 1
}

HTTP_CODE="$(echo "$API_RESPONSE" | tail -1)"
API_BODY="$(echo "$API_RESPONSE" | sed '$d')"

if [ "$HTTP_CODE" != "200" ]; then
  err "GitHub API returned $HTTP_CODE. No releases found for ${REPO_SLUG}."
  exit 1
fi

# Parse tag_name and tarball_url without jq
REMOTE_TAG="$(echo "$API_BODY" | grep '"tag_name"' | head -1 | sed -E 's/.*"tag_name"[[:space:]]*:[[:space:]]*"([^"]+)".*/\1/')"
TARBALL_URL="$(echo "$API_BODY" | grep '"tarball_url"' | head -1 | sed -E 's/.*"tarball_url"[[:space:]]*:[[:space:]]*"([^"]+)".*/\1/')"
RELEASE_BODY="$(echo "$API_BODY" | grep '"body"' | head -1 | sed -E 's/.*"body"[[:space:]]*:[[:space:]]*"(.*)".*/\1/' | sed 's/\\n/\n/g; s/\\r//g')"

REMOTE_VERSION="${REMOTE_TAG#v}"

if [ -z "$REMOTE_VERSION" ] || [ -z "$TARBALL_URL" ]; then
  err "Could not parse release info from GitHub API."
  exit 1
fi

# --- Compare versions ---

if [ "$LOCAL_VERSION" = "$REMOTE_VERSION" ]; then
  ok "Already up to date (v${LOCAL_VERSION})"
  exit 0
fi

echo ""
echo -e "${BOLD}Update available: v${LOCAL_VERSION} → v${REMOTE_VERSION}${NC}"
echo ""

# Show changelog excerpt
if [ -n "$RELEASE_BODY" ]; then
  echo -e "${CYAN}What's new:${NC}"
  echo "$RELEASE_BODY" | head -30
  echo ""
fi

# --- Check-only mode ---

if [ "$CHECK_ONLY" = true ]; then
  exit 0
fi

# --- Prompt user (skip for --dry-run) ---

if [ "$DRY_RUN" = false ]; then
  printf "Update from v%s to v%s? (y/n) " "$LOCAL_VERSION" "$REMOTE_VERSION"
  read -r CONFIRM
  if [ "$CONFIRM" != "y" ] && [ "$CONFIRM" != "Y" ]; then
    info "Update cancelled."
    exit 0
  fi
fi

# --- Dirty tree guard (skip for --dry-run) ---

if [ "$DRY_RUN" = false ]; then
  if ! git -C "$VAULT_DIR" diff --quiet 2>/dev/null || ! git -C "$VAULT_DIR" diff --cached --quiet 2>/dev/null; then
    warn "You have uncommitted changes. Commit or stash before updating."
    git -C "$VAULT_DIR" status --short
    exit 1
  fi
fi

# --- Download and extract ---

TMPDIR_UPDATE="$(mktemp -d)"
TARBALL="$TMPDIR_UPDATE/release.tar.gz"

info "Downloading v${REMOTE_VERSION}..."
curl -sS -L -o "$TARBALL" "$TARBALL_URL" || {
  err "Download failed."
  rm -rf "$TMPDIR_UPDATE"
  exit 1
}

info "Extracting..."
tar -xzf "$TARBALL" -C "$TMPDIR_UPDATE" || {
  err "Extraction failed."
  rm -rf "$TMPDIR_UPDATE"
  exit 1
}

# GitHub tarballs extract to owner-repo-hash/ directory
EXTRACT_DIR="$(find "$TMPDIR_UPDATE" -mindepth 1 -maxdepth 1 -type d | head -1)"
if [ -z "$EXTRACT_DIR" ]; then
  err "Could not find extracted directory."
  rm -rf "$TMPDIR_UPDATE"
  exit 1
fi

# --- Dry-run mode: preview changes and exit ---

if [ "$DRY_RUN" = true ]; then
  echo -e "${BOLD}Dry-run: previewing changes (nothing will be applied)${NC}"
  echo ""

  DRY_NEW=0
  DRY_CHANGED=0
  DRY_UNCHANGED=0

  # Check individual framework files
  for file in "CLAUDE.md" "CLAUDE.local.md.template" "README.md" "START_HERE.md" \
              "CHANGELOG.md" "CONTRIBUTING.md" "CODE_OF_CONDUCT.md" "LICENSE" \
              "_core/MANIFESTO.md" "_core/PROCESSING.md"; do
    SRC="$EXTRACT_DIR/$file"
    DST="$VAULT_DIR/$file"
    if [ -f "$SRC" ]; then
      if [ ! -f "$DST" ]; then
        echo -e "  ${GREEN}+ new${NC}     $file"
        DRY_NEW=$((DRY_NEW + 1))
      elif ! diff -q "$SRC" "$DST" >/dev/null 2>&1; then
        echo -e "  ${YELLOW}~ changed${NC} $file"
        DRY_CHANGED=$((DRY_CHANGED + 1))
      else
        DRY_UNCHANGED=$((DRY_UNCHANGED + 1))
      fi
    fi
  done

  # Check framework directories
  for dir in "_templates" ".claude" ".claude-plugin" "scripts" "handbook" "examples" ".github"; do
    SRC_DIR="$EXTRACT_DIR/$dir"
    if [ -d "$SRC_DIR" ]; then
      while IFS= read -r src_file; do
        rel_path="${src_file#$SRC_DIR/}"
        dst_file="$VAULT_DIR/$dir/$rel_path"
        if [ ! -f "$dst_file" ]; then
          echo -e "  ${GREEN}+ new${NC}     $dir/$rel_path"
          DRY_NEW=$((DRY_NEW + 1))
        elif ! diff -q "$src_file" "$dst_file" >/dev/null 2>&1; then
          echo -e "  ${YELLOW}~ changed${NC} $dir/$rel_path"
          DRY_CHANGED=$((DRY_CHANGED + 1))
        else
          DRY_UNCHANGED=$((DRY_UNCHANGED + 1))
        fi
      done < <(find "$SRC_DIR" -type f)
    fi
  done

  # Check hybrid files
  for hybrid_file in "_core/config.yaml" ".gitignore"; do
    SRC="$EXTRACT_DIR/$hybrid_file"
    DST="$VAULT_DIR/$hybrid_file"
    if [ -f "$SRC" ] && [ -f "$DST" ]; then
      if ! diff -q "$SRC" "$DST" >/dev/null 2>&1; then
        echo -e "  ${CYAN}⚡ hybrid${NC}  $hybrid_file (would show diff, not overwrite)"
      fi
    fi
  done

  echo ""
  echo -e "${BOLD}Summary:${NC}"
  echo -e "  New files:       ${GREEN}${DRY_NEW}${NC}"
  echo -e "  Changed files:   ${YELLOW}${DRY_CHANGED}${NC}"
  echo -e "  Unchanged files: ${DRY_UNCHANGED}"
  echo ""
  info "No changes applied (dry-run mode)."
  rm -rf "$TMPDIR_UPDATE"
  exit 0
fi

# --- Backup current framework files ---

BACKUP_DATE="$(date +%Y-%m-%d)"
BACKUP_DIR="$VAULT_DIR/_archive/_updates/${BACKUP_DATE}"
mkdir -p "$BACKUP_DIR"
info "Backing up current files to _archive/_updates/${BACKUP_DATE}/"

# --- Define framework files (overwrite with backup) ---

# Individual files to update
FRAMEWORK_FILES=(
  "CLAUDE.md"
  "CLAUDE.local.md.template"
  "README.md"
  "START_HERE.md"
  "CHANGELOG.md"
  "CONTRIBUTING.md"
  "CODE_OF_CONDUCT.md"
  "LICENSE"
  "_core/MANIFESTO.md"
  "_core/PROCESSING.md"
)

# Directories to update (entire contents)
FRAMEWORK_DIRS=(
  "_templates"
  ".claude"
  ".claude-plugin"
  "scripts"
  "handbook"
  "examples"
  ".github"
)

UPDATED=0
SKIPPED=0

# --- Copy framework files ---

for file in "${FRAMEWORK_FILES[@]}"; do
  SRC="$EXTRACT_DIR/$file"
  DST="$VAULT_DIR/$file"
  if [ -f "$SRC" ]; then
    if [ -f "$DST" ]; then
      mkdir -p "$BACKUP_DIR/$(dirname "$file")"
      cp "$DST" "$BACKUP_DIR/$file"
    fi
    mkdir -p "$(dirname "$DST")"
    cp "$SRC" "$DST"
    UPDATED=$((UPDATED + 1))
  fi
done

# --- Copy framework directories ---

for dir in "${FRAMEWORK_DIRS[@]}"; do
  SRC_DIR="$EXTRACT_DIR/$dir"
  DST_DIR="$VAULT_DIR/$dir"
  if [ -d "$SRC_DIR" ]; then
    if [ -d "$DST_DIR" ]; then
      mkdir -p "$BACKUP_DIR/$dir"
      cp -R "$DST_DIR/." "$BACKUP_DIR/$dir/" 2>/dev/null || true
    fi
    mkdir -p "$DST_DIR"
    cp -R "$SRC_DIR/." "$DST_DIR/"
    DIR_COUNT="$(find "$SRC_DIR" -type f | wc -l | tr -d ' ')"
    UPDATED=$((UPDATED + DIR_COUNT))
  fi
done

# --- Handle hybrid files (show diff, skip overwrite) ---

echo ""
for hybrid_file in "_core/config.yaml" ".gitignore"; do
  SRC="$EXTRACT_DIR/$hybrid_file"
  DST="$VAULT_DIR/$hybrid_file"
  if [ -f "$SRC" ] && [ -f "$DST" ]; then
    if ! diff -q "$SRC" "$DST" >/dev/null 2>&1; then
      warn "Skipped ${BOLD}${hybrid_file}${NC} (your copy differs from upstream)"
      echo -e "  ${CYAN}Review diff:${NC} diff \"$DST\" <(curl -sL ...)"
      echo -e "  ${CYAN}Upstream copy saved to:${NC} ${BACKUP_DIR}/${hybrid_file}.upstream"
      mkdir -p "$BACKUP_DIR/$(dirname "$hybrid_file")"
      cp "$SRC" "$BACKUP_DIR/${hybrid_file}.upstream"
      SKIPPED=$((SKIPPED + 1))
    fi
  fi
done

# --- Migration: remove deprecated directories ---

for deprecated_dir in adrs roadmap research; do
  if [ -d "$VAULT_DIR/$deprecated_dir" ]; then
    rm -rf "$VAULT_DIR/$deprecated_dir"
    warn "Removed deprecated folder: ${BOLD}${deprecated_dir}/${NC}"
  fi
done

# --- Update VERSION ---

echo "$REMOTE_VERSION" > "$VERSION_FILE"

# --- Cleanup ---

rm -rf "$TMPDIR_UPDATE"

# --- Summary ---

echo ""
echo -e "${GREEN}${BOLD}Update complete: v${LOCAL_VERSION} → v${REMOTE_VERSION}${NC}"
echo -e "  Files updated:  ${BOLD}${UPDATED}${NC}"
echo -e "  Files skipped:  ${BOLD}${SKIPPED}${NC}"
echo -e "  Backup:         ${BOLD}_archive/_updates/${BACKUP_DATE}/${NC}"
echo ""
if [ "$SKIPPED" -gt 0 ]; then
  warn "Review skipped files and merge upstream changes manually if needed."
  echo "  Upstream copies are saved with .upstream suffix in the backup directory."
fi
echo -e "Run ${BOLD}/push${NC} to commit the updated files."
