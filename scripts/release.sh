#!/usr/bin/env bash
set -euo pipefail

# PM-Kit Release Script
# One-command release publisher. Creates a date-based version tag,
# updates VERSION + plugin.json + CHANGELOG.md, commits, tags, and pushes.
# GitHub Actions then creates the GitHub Release automatically.

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
    echo -e "  ${CYAN}Release Publisher${NC}"
    echo ""
else
    echo -e "${CYAN}${BOLD}"
    echo "╔═══════════════════════════════════════════════════╗"
    echo "║   PM-Kit Release Publisher                       ║"
    echo "╚═══════════════════════════════════════════════════╝"
    echo -e "${NC}"
fi

# --- Preflight checks ---

cd "$VAULT_DIR"

# Must be on main branch
BRANCH="$(git rev-parse --abbrev-ref HEAD)"
if [ "$BRANCH" != "main" ]; then
  err "Must be on main branch (currently on ${BRANCH})."
  exit 1
fi

# Must have clean working tree
if [ -n "$(git status --porcelain)" ]; then
  err "Working tree is not clean. Commit or stash changes first."
  exit 1
fi

# Must be up-to-date with remote
git fetch origin main --quiet
LOCAL_SHA="$(git rev-parse HEAD)"
REMOTE_SHA="$(git rev-parse origin/main)"
if [ "$LOCAL_SHA" != "$REMOTE_SHA" ]; then
  err "Local main is not up-to-date with origin/main. Pull first."
  exit 1
fi

# --- Validate CHANGELOG.md has [Unreleased] content ---

CHANGELOG="$VAULT_DIR/CHANGELOG.md"
if [ ! -f "$CHANGELOG" ]; then
  err "CHANGELOG.md not found."
  exit 1
fi

# Extract content between [Unreleased] header and next ## header
UNRELEASED_CONTENT="$(sed -n '/^## \[Unreleased\]/,/^## \[/{/^## \[/!p;}' "$CHANGELOG" | grep -v '^$' | grep -v '^<!--' || true)"
if [ -z "$UNRELEASED_CONTENT" ]; then
  err "Nothing to release — [Unreleased] section in CHANGELOG.md is empty."
  exit 1
fi

# --- Generate date-based tag ---

TODAY="$(date +%Y.%m.%d)"
TAG="v${TODAY}"

# Handle same-day collision
SUFFIX=1
while git tag -l "$TAG" | grep -q "^${TAG}$"; do
  SUFFIX=$((SUFFIX + 1))
  TAG="v${TODAY}.${SUFFIX}"
done

VERSION="${TAG#v}"

# --- Show preview and confirm ---

echo ""
echo -e "${BOLD}Release Preview${NC}"
echo -e "  Tag:     ${CYAN}${TAG}${NC}"
echo -e "  Version: ${CYAN}${VERSION}${NC}"
echo ""
echo -e "${BOLD}Changelog entries:${NC}"
echo "$UNRELEASED_CONTENT"
echo ""

printf "Create release %s? (y/n) " "$TAG"
read -r CONFIRM
if [ "$CONFIRM" != "y" ] && [ "$CONFIRM" != "Y" ]; then
  info "Release cancelled."
  exit 0
fi

# --- Update VERSION file ---

echo "$VERSION" > "$VAULT_DIR/VERSION"
ok "Updated VERSION → ${VERSION}"

# --- Update plugin.json version ---

sed -i '' "s/\"version\": \"[^\"]*\"/\"version\": \"${VERSION}\"/" "$VAULT_DIR/.claude-plugin/plugin.json"
ok "Updated plugin.json → ${VERSION}"

# --- Update CHANGELOG.md ---

DATE_FORMATTED="$(date +%Y-%m-%d)"

# Replace [Unreleased] section: keep the header, add new version section below
sed -i '' "/^## \[Unreleased\]/{
a\\
\\
<!-- New merged PR entries are inserted here automatically. -->\\
\\
## [${VERSION}] - ${DATE_FORMATTED}
}" "$CHANGELOG"

# Remove the old placeholder comment that's now duplicated
# The old comment is the one right after the original [Unreleased] line (now after the new version header)
# We need to remove the first occurrence of the comment after the new version header
sed -i '' "0,/^## \[${VERSION}\]/{ /^## \[${VERSION}\]/,/^## \[/{
  /^<!-- New merged PR entries are inserted here automatically. -->/{
    N
    s/<!-- New merged PR entries are inserted here automatically. -->\n//
  }
}; }" "$CHANGELOG"

# Update comparison links at bottom of CHANGELOG.md
# Get the previous version tag for the comparison link
PREV_TAG="$(git describe --tags --abbrev=0 2>/dev/null || echo "")"

# Detect repo slug for links
REPO_SLUG="kv0906/pm-kit"
REMOTE_URL="$(git remote get-url origin 2>/dev/null || true)"
if [ -n "$REMOTE_URL" ]; then
  EXTRACTED="$(echo "$REMOTE_URL" | sed -E 's#.*[:/]([^/]+/[^/.]+)(\.git)?$#\1#')"
  if [ -n "$EXTRACTED" ] && [ "$EXTRACTED" != "$REMOTE_URL" ]; then
    REPO_SLUG="$EXTRACTED"
  fi
fi

# Update [Unreleased] comparison link
sed -i '' "s|\[Unreleased\]:.*|[Unreleased]: https://github.com/${REPO_SLUG}/compare/${TAG}...HEAD|" "$CHANGELOG"

# Add new version comparison link (after [Unreleased] link)
if [ -n "$PREV_TAG" ]; then
  sed -i '' "/^\[Unreleased\]:/a\\
[${VERSION}]: https://github.com/${REPO_SLUG}/compare/${PREV_TAG}...${TAG}" "$CHANGELOG"
else
  sed -i '' "/^\[Unreleased\]:/a\\
[${VERSION}]: https://github.com/${REPO_SLUG}/releases/tag/${TAG}" "$CHANGELOG"
fi

ok "Updated CHANGELOG.md"

# --- Commit, tag, push ---

git add VERSION .claude-plugin/plugin.json CHANGELOG.md
git commit -m "release: ${TAG}"
ok "Created commit: release: ${TAG}"

git tag -a "$TAG" -m "Release ${TAG}"
ok "Created tag: ${TAG}"

git push origin main
git push origin "$TAG"
ok "Pushed commit and tag to origin"

# --- Done ---

echo ""
echo -e "${GREEN}${BOLD}Release ${TAG} published!${NC}"
echo -e "  GitHub Actions will create the release automatically."
echo -e "  ${CYAN}https://github.com/${REPO_SLUG}/releases/tag/${TAG}${NC}"
