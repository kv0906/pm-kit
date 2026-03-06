#!/usr/bin/env bash
# PM-Kit CLI — migrate subcommand
# Converts a template-cloned vault to CLI-managed

cmd_migrate() {
  banner
  echo -e "  ${CYAN}Migrate to CLI-Managed Vault${NC}"
  echo ""

  # --- Detect vault ---

  local vault_dir
  vault_dir="$(find_vault_root)" || {
    err "No PM-Kit vault found in current directory tree."
    info "This command must be run from inside an existing vault."
    return 1
  }

  info "Found vault: ${BOLD}${vault_dir}${NC}"

  # --- Check if already migrated ---

  if [ -f "$vault_dir/.pm-kit" ]; then
    ok "Vault is already CLI-managed (.pm-kit marker exists)"
    return 0
  fi

  # --- Validate it's a real vault ---

  if [ ! -f "$vault_dir/CLAUDE.md" ] || [ ! -f "$vault_dir/_core/config.yaml" ]; then
    err "Directory doesn't look like a PM-Kit vault (missing CLAUDE.md or _core/config.yaml)"
    return 1
  fi

  if [ ! -d "$vault_dir/.git" ]; then
    err "No git repository found. Initialize git first."
    return 1
  fi

  # --- Get vault version ---

  local vault_ver="unknown"
  if [ -f "$vault_dir/VERSION" ]; then
    vault_ver="$(tr -d '[:space:]' < "$vault_dir/VERSION")"
  fi

  # --- Create .pm-kit marker ---

  cat > "$vault_dir/.pm-kit" << EOF
# PM-Kit CLI marker file
# This file marks this directory as a CLI-managed PM-Kit vault.
# Do not delete — pm-kit update and pm-kit doctor depend on it.
version=$vault_ver
created=$(date +%Y-%m-%d)
migrated=true
EOF

  ok "Created .pm-kit marker file"

  # --- Check git remote ---

  local remote_url
  remote_url="$(git -C "$vault_dir" remote get-url origin 2>/dev/null || true)"

  if [ -n "$remote_url" ] && echo "$remote_url" | grep -q "kv0906/pm-kit"; then
    echo ""
    warn "Git remote still points to the PM-Kit source repo:"
    echo "  $remote_url"
    echo ""
    info "You probably want to change this to your own repo:"
    echo "  git remote set-url origin <your-repo-url>"
    echo ""
  fi

  # --- Ensure user dirs exist ---

  for dir in 00-inbox 01-index daily docs decisions blockers meetings reports _archive; do
    mkdir -p "$vault_dir/$dir"
  done

  # --- Done ---

  echo ""
  ok "Migration complete"
  info "You can now use ${BOLD}pm-kit update${NC} and ${BOLD}pm-kit doctor${NC} from anywhere inside this vault."
}
