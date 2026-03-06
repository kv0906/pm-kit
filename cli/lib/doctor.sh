#!/usr/bin/env bash
# PM-Kit CLI — doctor subcommand
# Verifies vault structure, versions, hooks, and optional dependencies

cmd_doctor() {
  banner
  echo -e "  ${CYAN}Vault Health Check${NC}"
  echo ""

  local issues=0

  # --- CLI version ---

  local cli_ver
  cli_ver="$(cli_version)"
  ok "CLI version: v${cli_ver}"

  # --- Check for CLI updates ---

  if github_latest_release 2>/dev/null; then
    if [ "$cli_ver" != "$REMOTE_VERSION" ] && [ -n "$REMOTE_VERSION" ]; then
      warn "CLI update available: v${cli_ver} → v${REMOTE_VERSION}"
      issues=$((issues + 1))
    else
      ok "CLI is up to date"
    fi
  else
    warn "Could not check for CLI updates (network issue?)"
  fi

  echo ""

  # --- Vault detection ---

  if VAULT_DIR="$(find_vault_root)"; then
    ok "Vault found: $VAULT_DIR"
  else
    err "No PM-Kit vault detected in current directory tree"
    echo ""
    info "Run ${BOLD}pm-kit init${NC} to create a vault, or cd into one."
    return 1
  fi

  # Marker file
  if [ -f "$VAULT_DIR/.pm-kit" ]; then
    ok "CLI marker file (.pm-kit) present"
  else
    warn "No .pm-kit marker — run ${BOLD}pm-kit migrate${NC} to add it"
    issues=$((issues + 1))
  fi

  # Vault version
  if [ -f "$VAULT_DIR/VERSION" ]; then
    local vault_ver
    vault_ver="$(tr -d '[:space:]' < "$VAULT_DIR/VERSION")"
    ok "Vault version: v${vault_ver}"
  else
    err "VERSION file missing"
    issues=$((issues + 1))
  fi

  echo ""

  # --- Required directories ---

  echo -e "${BOLD}Directories:${NC}"

  local -a required_dirs=(
    "_core" "_templates" ".claude" ".claude/skills" ".claude/agents"
    ".claude/hooks" ".claude/rules"
    "00-inbox" "01-index" "daily" "docs" "decisions" "blockers"
    "meetings" "reports" "_archive"
  )

  for dir in "${required_dirs[@]}"; do
    if [ -d "$VAULT_DIR/$dir" ]; then
      ok "$dir/"
    else
      err "Missing: $dir/"
      issues=$((issues + 1))
    fi
  done

  echo ""

  # --- Required files ---

  echo -e "${BOLD}Config & Framework:${NC}"

  if [ -f "$VAULT_DIR/_core/config.yaml" ]; then
    ok "_core/config.yaml"
  else
    err "Missing: _core/config.yaml"
    issues=$((issues + 1))
  fi

  if [ -f "$VAULT_DIR/CLAUDE.md" ]; then
    ok "CLAUDE.md"
  else
    err "Missing: CLAUDE.md"
    issues=$((issues + 1))
  fi

  if [ -f "$VAULT_DIR/.claude/settings.json" ]; then
    ok ".claude/settings.json"
  else
    warn "Missing: .claude/settings.json"
    issues=$((issues + 1))
  fi

  # Hooks executable
  local hooks_ok=true
  for hook in "$VAULT_DIR/.claude/hooks/"*.sh; do
    [ -f "$hook" ] || continue
    if [ ! -x "$hook" ]; then
      warn "Hook not executable: $(basename "$hook")"
      hooks_ok=false
      issues=$((issues + 1))
    fi
  done
  if [ "$hooks_ok" = true ]; then
    ok "Hooks are executable"
  fi

  echo ""

  # --- Git ---

  echo -e "${BOLD}Git:${NC}"

  if [ -d "$VAULT_DIR/.git" ]; then
    ok "Git repository initialized"

    if git -C "$VAULT_DIR" remote get-url origin >/dev/null 2>&1; then
      local remote_url
      remote_url="$(git -C "$VAULT_DIR" remote get-url origin)"
      ok "Remote: $remote_url"

      # Warn if still pointing to pm-kit source
      if echo "$remote_url" | grep -q "kv0906/pm-kit"; then
        warn "Remote points to PM-Kit source repo — you may want to change this"
        issues=$((issues + 1))
      fi
    else
      warn "No git remote configured"
    fi

    if git -C "$VAULT_DIR" diff --quiet 2>/dev/null && \
       git -C "$VAULT_DIR" diff --cached --quiet 2>/dev/null; then
      ok "Working tree is clean"
    else
      warn "Uncommitted changes present"
    fi
  else
    warn "No git repository"
    issues=$((issues + 1))
  fi

  echo ""

  # --- Optional dependencies ---

  echo -e "${BOLD}Optional Dependencies:${NC}"

  if command_exists claude; then
    ok "claude (Claude Code CLI)"
  else
    warn "claude not found — install from https://claude.ai/code"
  fi

  if command_exists qmd; then
    ok "qmd (smart search)"
  else
    info "qmd not installed — /ask uses vault grep (still works)"
  fi

  # Export deps
  if python3 -c "import openpyxl" 2>/dev/null; then
    ok "openpyxl (Excel export)"
  else
    info "openpyxl not installed (optional: --xlsx export)"
  fi

  if node -e "require('docx')" 2>/dev/null; then
    ok "docx (Word export)"
  else
    info "docx not installed (optional: --docx export)"
  fi

  if python3 -c "from reportlab.lib.pagesizes import letter" 2>/dev/null; then
    ok "reportlab (PDF export)"
  else
    info "reportlab not installed (optional: --pdf export)"
  fi

  if node -e "require('pptxgenjs')" 2>/dev/null; then
    ok "pptxgenjs (PowerPoint export)"
  else
    info "pptxgenjs not installed (optional: --pptx export)"
  fi

  # --- Summary ---

  echo ""
  if [ "$issues" -eq 0 ]; then
    echo -e "${GREEN}${BOLD}All checks passed.${NC}"
  else
    echo -e "${YELLOW}${BOLD}${issues} issue(s) found.${NC}"
  fi
}
