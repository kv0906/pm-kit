#!/usr/bin/env bash
# PM-Kit CLI — self-update subcommand
# Updates the CLI itself from the latest release

cmd_self_update() {
  banner
  echo -e "  ${CYAN}CLI Self-Update${NC}"
  echo ""

  require_commands curl tar

  local local_ver
  local_ver="$(cli_version)"
  info "Installed CLI version: ${BOLD}v${local_ver}${NC}"

  # --- Query latest release ---

  github_latest_release || return 1

  if [ "$local_ver" = "$REMOTE_VERSION" ]; then
    ok "CLI is already up to date (v${local_ver})"
    return 0
  fi

  echo ""
  echo -e "${BOLD}CLI update available: v${local_ver} → v${REMOTE_VERSION}${NC}"
  echo ""

  # --- Download ---

  download_and_extract "$TARBALL_URL" "$REMOTE_VERSION" || return 1

  # --- Install cli/ contents into ~/.pm-kit/ ---

  local cli_src="$EXTRACT_DIR/cli"
  if [ ! -d "$cli_src" ]; then
    err "Release does not contain cli/ directory. Try reinstalling."
    cleanup_tmp
    return 1
  fi

  info "Updating CLI files..."

  # Copy bin and lib
  cp "$cli_src/bin/pm-kit" "$CLI_HOME/bin/pm-kit"
  chmod +x "$CLI_HOME/bin/pm-kit"

  # Refresh lib/
  rm -rf "$CLI_HOME/lib"
  cp -R "$cli_src/lib" "$CLI_HOME/lib"

  # Copy install.sh for reference
  if [ -f "$cli_src/install.sh" ]; then
    cp "$cli_src/install.sh" "$CLI_HOME/install.sh"
  fi

  # Update VERSION
  echo "$REMOTE_VERSION" > "$CLI_HOME/VERSION"

  # Reset update check timer
  date +%s > "$LAST_CHECK_FILE"

  # --- Cleanup ---

  cleanup_tmp

  echo ""
  ok "CLI updated to v${REMOTE_VERSION}"
  info "Run ${BOLD}pm-kit version${NC} to verify."
}
