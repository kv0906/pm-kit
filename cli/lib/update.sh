#!/usr/bin/env bash
# PM-Kit CLI — update subcommand
# Updates framework files in the current vault from the latest release

cmd_update() {
  banner
  echo -e "  ${CYAN}Framework Updater${NC}"
  echo ""

  require_commands curl tar git

  # --- Flag parsing ---

  local check_only=false
  local dry_run=false
  local auto_yes=false

  for arg in "$@"; do
    case "$arg" in
      --check)   check_only=true ;;
      --dry-run) dry_run=true ;;
      --yes|-y)  auto_yes=true ;;
      --help)
        echo "Usage: pm-kit update [--check|--dry-run|--yes]"
        echo ""
        echo "  --check     Check for updates only (no download)"
        echo "  --dry-run   Preview what would change (no apply)"
        echo "  --yes       Skip confirmation prompt"
        return 0
        ;;
      *) err "Unknown option: $arg"; return 1 ;;
    esac
  done

  # --- Find vault ---

  require_vault
  info "Vault: ${BOLD}${VAULT_DIR}${NC}"

  # --- Read local version ---

  local version_file="$VAULT_DIR/VERSION"
  if [ ! -f "$version_file" ]; then
    err "VERSION file not found in vault."
    return 1
  fi

  local local_version
  local_version="$(tr -d '[:space:]' < "$version_file")"
  info "Local version: ${BOLD}v${local_version}${NC}"

  # --- Query latest release ---

  github_latest_release || return 1

  # --- Compare ---

  if [ "$local_version" = "$REMOTE_VERSION" ]; then
    ok "Already up to date (v${local_version})"
    return 0
  fi

  echo ""
  echo -e "${BOLD}Update available: v${local_version} → v${REMOTE_VERSION}${NC}"
  echo ""

  if [ -n "${RELEASE_BODY:-}" ]; then
    echo -e "${CYAN}What's new:${NC}"
    echo "$RELEASE_BODY" | head -30
    echo ""
  fi

  # --- Check-only ---

  if [ "$check_only" = true ]; then
    return 0
  fi

  # --- Download ---

  download_and_extract "$TARBALL_URL" "$REMOTE_VERSION" || return 1

  # --- Framework file lists ---

  local -a FRAMEWORK_FILES=(
    "CLAUDE.md" "README.md" "START_HERE.md"
    "CHANGELOG.md" "CONTRIBUTING.md" "CODE_OF_CONDUCT.md" "LICENSE"
    "AGENTS.md"
    "_core/MANIFESTO.md" "_core/PROCESSING.md"
  )

  local -a FRAMEWORK_DIRS=(
    "_templates" ".claude" ".claude-plugin" "scripts" "handbook" "examples" ".github" "cli"
  )

  # --- Dry-run ---

  if [ "$dry_run" = true ]; then
    echo -e "${BOLD}Dry-run: previewing changes${NC}"
    echo ""

    local dry_new=0 dry_changed=0 dry_unchanged=0

    for file in "${FRAMEWORK_FILES[@]}"; do
      local src="$EXTRACT_DIR/$file" dst="$VAULT_DIR/$file"
      if [ -f "$src" ]; then
        if [ ! -f "$dst" ]; then
          echo -e "  ${GREEN}+ new${NC}     $file"
          dry_new=$((dry_new + 1))
        elif ! diff -q "$src" "$dst" >/dev/null 2>&1; then
          echo -e "  ${YELLOW}~ changed${NC} $file"
          dry_changed=$((dry_changed + 1))
        else
          dry_unchanged=$((dry_unchanged + 1))
        fi
      fi
    done

    for dir in "${FRAMEWORK_DIRS[@]}"; do
      local src_dir="$EXTRACT_DIR/$dir"
      if [ -d "$src_dir" ]; then
        while IFS= read -r src_file; do
          local rel_path="${src_file#$src_dir/}"
          local dst_file="$VAULT_DIR/$dir/$rel_path"
          if [ ! -f "$dst_file" ]; then
            echo -e "  ${GREEN}+ new${NC}     $dir/$rel_path"
            dry_new=$((dry_new + 1))
          elif ! diff -q "$src_file" "$dst_file" >/dev/null 2>&1; then
            echo -e "  ${YELLOW}~ changed${NC} $dir/$rel_path"
            dry_changed=$((dry_changed + 1))
          else
            dry_unchanged=$((dry_unchanged + 1))
          fi
        done < <(find "$src_dir" -type f)
      fi
    done

    for hybrid_file in "_core/config.yaml" ".gitignore"; do
      local src="$EXTRACT_DIR/$hybrid_file" dst="$VAULT_DIR/$hybrid_file"
      if [ -f "$src" ] && [ -f "$dst" ]; then
        if ! diff -q "$src" "$dst" >/dev/null 2>&1; then
          echo -e "  ${CYAN}* hybrid${NC}  $hybrid_file (diff shown, not overwritten)"
        fi
      fi
    done

    echo ""
    echo -e "${BOLD}Summary:${NC} ${GREEN}${dry_new} new${NC}, ${YELLOW}${dry_changed} changed${NC}, ${dry_unchanged} unchanged"
    info "No changes applied (dry-run mode)."
    cleanup_tmp
    return 0
  fi

  # --- Confirm ---

  if [ "$auto_yes" = false ]; then
    printf "Update from v%s to v%s? (y/n) " "$local_version" "$REMOTE_VERSION"
    read -r confirm
    if [ "$confirm" != "y" ] && [ "$confirm" != "Y" ]; then
      info "Update cancelled."
      cleanup_tmp
      return 0
    fi
  fi

  # --- Dirty tree guard ---

  if ! git -C "$VAULT_DIR" diff --quiet 2>/dev/null || \
     ! git -C "$VAULT_DIR" diff --cached --quiet 2>/dev/null; then
    warn "You have uncommitted changes. Commit or stash before updating."
    git -C "$VAULT_DIR" status --short
    cleanup_tmp
    return 1
  fi

  # --- Backup ---

  local backup_date
  backup_date="$(date +%Y-%m-%d)"
  local backup_dir="$VAULT_DIR/_archive/_updates/${backup_date}"
  mkdir -p "$backup_dir"
  info "Backing up to _archive/_updates/${backup_date}/"

  local updated=0 skipped=0

  # --- Copy framework files ---

  for file in "${FRAMEWORK_FILES[@]}"; do
    local src="$EXTRACT_DIR/$file" dst="$VAULT_DIR/$file"
    if [ -f "$src" ]; then
      if [ -f "$dst" ]; then
        mkdir -p "$backup_dir/$(dirname "$file")"
        cp "$dst" "$backup_dir/$file"
      fi
      mkdir -p "$(dirname "$dst")"
      cp "$src" "$dst"
      updated=$((updated + 1))
    fi
  done

  # --- Copy framework directories ---

  for dir in "${FRAMEWORK_DIRS[@]}"; do
    local src_dir="$EXTRACT_DIR/$dir" dst_dir="$VAULT_DIR/$dir"
    if [ -d "$src_dir" ]; then
      if [ -d "$dst_dir" ]; then
        mkdir -p "$backup_dir/$dir"
        cp -R "$dst_dir/." "$backup_dir/$dir/" 2>/dev/null || true
      fi
      mkdir -p "$dst_dir"
      cp -R "$src_dir/." "$dst_dir/"
      local dir_count
      dir_count="$(find "$src_dir" -type f | wc -l | tr -d ' ')"
      updated=$((updated + dir_count))
    fi
  done

  # --- Hybrid files ---

  echo ""
  for hybrid_file in "_core/config.yaml" ".gitignore"; do
    local src="$EXTRACT_DIR/$hybrid_file" dst="$VAULT_DIR/$hybrid_file"
    if [ -f "$src" ] && [ -f "$dst" ]; then
      if ! diff -q "$src" "$dst" >/dev/null 2>&1; then
        warn "Skipped ${BOLD}${hybrid_file}${NC} (your copy differs from upstream)"
        mkdir -p "$backup_dir/$(dirname "$hybrid_file")"
        cp "$src" "$backup_dir/${hybrid_file}.upstream"
        skipped=$((skipped + 1))
      fi
    fi
  done

  # --- Update VERSION and .pm-kit marker ---

  echo "$REMOTE_VERSION" > "$version_file"

  if [ -f "$VAULT_DIR/.pm-kit" ]; then
    sed_inplace "s/^version=.*/version=$REMOTE_VERSION/" "$VAULT_DIR/.pm-kit"
  fi

  # Make hooks executable
  chmod +x "$VAULT_DIR/.claude/hooks/"*.sh 2>/dev/null || true

  # --- Cleanup ---

  cleanup_tmp

  # --- Summary ---

  echo ""
  echo -e "${GREEN}${BOLD}Update complete: v${local_version} → v${REMOTE_VERSION}${NC}"
  echo -e "  Files updated:  ${BOLD}${updated}${NC}"
  echo -e "  Files skipped:  ${BOLD}${skipped}${NC}"
  echo -e "  Backup:         ${BOLD}_archive/_updates/${backup_date}/${NC}"
  echo ""
  if [ "$skipped" -gt 0 ]; then
    warn "Review skipped files — upstream copies saved with .upstream suffix."
  fi
  info "Run ${BOLD}/push${NC} or ${BOLD}git commit${NC} to save the updated files."
}
