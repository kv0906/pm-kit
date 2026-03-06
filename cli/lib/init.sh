#!/usr/bin/env bash
# PM-Kit CLI — init subcommand
# Scaffolds a new PM-Kit vault from the latest release

cmd_init() {
  banner
  echo -e "  ${CYAN}New Vault Setup${NC}"
  echo ""

  require_commands git curl tar

  # --- Vault path ---

  local vault_path="${1:-}"

  if [ -z "$vault_path" ]; then
    local default_vault="$HOME/Documents/PM-Kit"
    printf "Where should we create your vault? [%s]: " "$default_vault"
    read -r vault_path
    vault_path="${vault_path:-$default_vault}"
  fi

  # Expand ~ and make absolute
  vault_path="${vault_path/#\~/$HOME}"
  if [[ "$vault_path" != /* ]]; then
    vault_path="$(pwd)/$vault_path"
  fi

  if [ -d "$vault_path" ] && [ -f "$vault_path/CLAUDE.md" ]; then
    err "A PM-Kit vault already exists at $vault_path"
    info "Use ${BOLD}pm-kit update${NC} to update it, or ${BOLD}pm-kit migrate${NC} to convert it."
    return 1
  fi

  if [ -d "$vault_path" ] && [ "$(ls -A "$vault_path" 2>/dev/null)" ]; then
    warn "Directory already exists and is not empty: $vault_path"
    printf "Use existing directory? (y/n): "
    read -r -n 1 confirm
    echo
    if [[ ! "$confirm" =~ ^[Yy]$ ]]; then return 1; fi
  fi

  mkdir -p "$vault_path"

  # --- Download latest release ---

  info "Fetching latest PM-Kit release..."
  github_latest_release || return 1

  echo -e "  Version: ${BOLD}v${REMOTE_VERSION}${NC}"
  echo ""

  download_and_extract "$TARBALL_URL" "$REMOTE_VERSION" || return 1

  # --- Copy framework files ---

  info "Setting up vault structure..."

  # Framework files (root level)
  for file in CLAUDE.md README.md START_HERE.md CHANGELOG.md CONTRIBUTING.md \
              CODE_OF_CONDUCT.md LICENSE AGENTS.md VERSION; do
    if [ -f "$EXTRACT_DIR/$file" ]; then
      cp "$EXTRACT_DIR/$file" "$vault_path/"
    fi
  done

  # Framework directories
  for dir in _core _templates .claude .claude-plugin scripts handbook examples .github cli; do
    if [ -d "$EXTRACT_DIR/$dir" ]; then
      cp -R "$EXTRACT_DIR/$dir" "$vault_path/"
    fi
  done

  # Symlinks (copy as-is — they point to CLAUDE.md or .claude/rules)
  for link in .cursorrules .windsurfrules .clinerules; do
    if [ -e "$EXTRACT_DIR/$link" ]; then
      cp -a "$EXTRACT_DIR/$link" "$vault_path/" 2>/dev/null || true
    fi
  done
  for link_dir in .cursor; do
    if [ -e "$EXTRACT_DIR/$link_dir" ]; then
      cp -aR "$EXTRACT_DIR/$link_dir" "$vault_path/" 2>/dev/null || true
    fi
  done
  # .agent, .agents files
  for agent_file in .agent .agents; do
    if [ -e "$EXTRACT_DIR/$agent_file" ]; then
      cp -a "$EXTRACT_DIR/$agent_file" "$vault_path/" 2>/dev/null || true
    fi
  done

  # Banner image
  if [ -f "$EXTRACT_DIR/pm-kit-banner.png" ]; then
    cp "$EXTRACT_DIR/pm-kit-banner.png" "$vault_path/"
  fi

  # --- Create user content directories ---

  for dir in 00-inbox 01-index daily docs decisions blockers meetings reports _archive; do
    mkdir -p "$vault_path/$dir"
  done

  # Make hooks executable
  chmod +x "$vault_path/.claude/hooks/"*.sh 2>/dev/null || true

  # --- Write .pm-kit marker ---

  cat > "$vault_path/.pm-kit" << EOF
# PM-Kit CLI marker file
# This file marks this directory as a CLI-managed PM-Kit vault.
# Do not delete — pm-kit update and pm-kit doctor depend on it.
version=$REMOTE_VERSION
created=$(date +%Y-%m-%d)
EOF

  ok "Vault structure created"

  # --- Cleanup download ---

  cleanup_tmp

  # --- Create .gitignore ---

  if [ ! -f "$vault_path/.gitignore" ]; then
    if [ -f "$EXTRACT_DIR/.gitignore" ] 2>/dev/null; then
      cp "$EXTRACT_DIR/.gitignore" "$vault_path/"
    else
      cat > "$vault_path/.gitignore" << 'GITIGNORE'
.obsidian/workspace*
.obsidian/cache
.trash/
.DS_Store
.setup_complete
*.swp
*~
GITIGNORE
    fi
    ok "Created .gitignore"
  fi

  # --- Project configuration ---

  echo ""
  echo -e "${CYAN}Configure Your First Project${NC}"
  echo "================================"

  printf "Project ID (lowercase, e.g., 'my-project'): "
  read -r project_id
  printf "Project name (display name): "
  read -r project_name
  printf "Brief description: "
  read -r project_desc

  if [ -n "$project_id" ] && [ -n "$project_name" ]; then
    local config="$vault_path/_core/config.yaml"
    if [ -f "$config" ] && grep -q "id: project-a" "$config"; then
      sed_inplace "s/id: project-a/id: $project_id/" "$config"
      sed_inplace "s/name: Project A/name: $project_name/" "$config"
      sed_inplace "s/description: Your first project/description: $project_desc/" "$config"
    fi

    # Create project directories
    mkdir -p "$vault_path/docs/$project_id"
    mkdir -p "$vault_path/decisions/$project_id"
    mkdir -p "$vault_path/blockers/$project_id"

    # Create project index
    cat > "$vault_path/01-index/$project_id.md" << EOF
---
type: index
project: $project_id
status: active
---

# $project_name

> $project_desc

---

## Open Blockers

*No open blockers*

---

## Active Docs

*No active docs*

---

## Recent Dailies (7 days)

*No dailies yet*

---

## Recent Decisions (30 days)

*No decisions yet*

---

## Manual Notes

%% Add your own notes below — this section is preserved during updates %%
EOF

    ok "Project '$project_name' configured"
  fi

  # --- Git init ---

  echo ""
  info "Initializing Git repository..."

  cd "$vault_path"
  if [ ! -d .git ]; then
    git init -q
    git add .
    git commit -q -m "Initial PM-Kit setup (v${REMOTE_VERSION})"
    ok "Git repository initialized with initial commit"
  else
    warn "Git repository already exists"
  fi

  # --- Check for Claude Code ---

  if ! command_exists claude; then
    warn "Claude Code CLI not found — install from https://claude.ai/code"
  fi

  # --- Done ---

  echo ""
  echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
  echo -e "${GREEN}  PM-Kit vault created!${NC}"
  echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
  echo ""
  echo "  Path: $vault_path"
  echo "  Version: v${REMOTE_VERSION}"
  echo ""
  echo "Next steps:"
  echo "  cd \"$vault_path\""
  echo "  claude"
  echo "  /onboard"
  echo ""
}
