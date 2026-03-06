#!/usr/bin/env bash
# PM-Kit CLI — status subcommand
# Shows CLI version, vault version, and active projects

cmd_status() {
  local cli_ver
  cli_ver="$(cli_version)"

  echo -e "${BOLD}PM-Kit Status${NC}"
  echo ""
  echo -e "  CLI version:   ${BOLD}v${cli_ver}${NC}"
  echo -e "  CLI home:      ${CLI_HOME}"

  # --- Vault info ---

  if VAULT_DIR="$(find_vault_root)"; then
    echo -e "  Vault path:    ${BOLD}${VAULT_DIR}${NC}"

    if [ -f "$VAULT_DIR/VERSION" ]; then
      local vault_ver
      vault_ver="$(tr -d '[:space:]' < "$VAULT_DIR/VERSION")"
      echo -e "  Vault version: ${BOLD}v${vault_ver}${NC}"
    fi

    if [ -f "$VAULT_DIR/.pm-kit" ]; then
      echo -e "  Managed by:    CLI (.pm-kit marker present)"
    else
      echo -e "  Managed by:    Template (no .pm-kit marker)"
    fi

    # Active projects from config.yaml
    if [ -f "$VAULT_DIR/_core/config.yaml" ]; then
      echo ""
      echo -e "  ${BOLD}Active Projects:${NC}"
      # Simple YAML parsing — extract project IDs where active: true
      local in_projects=false
      local current_id=""
      local current_name=""
      while IFS= read -r line; do
        if echo "$line" | grep -q "^projects:"; then
          in_projects=true
          continue
        fi
        if [ "$in_projects" = true ]; then
          # Stop at next top-level key
          if echo "$line" | grep -qE "^[a-z]" && ! echo "$line" | grep -q "^  "; then
            break
          fi
          if echo "$line" | grep -q "id:"; then
            current_id="$(echo "$line" | sed -E 's/.*id:[[:space:]]*//')"
          fi
          if echo "$line" | grep -q "name:"; then
            current_name="$(echo "$line" | sed -E 's/.*name:[[:space:]]*//')"
          fi
          if echo "$line" | grep -q "active: true"; then
            echo "    - ${current_name} (${current_id})"
          fi
        fi
      done < "$VAULT_DIR/_core/config.yaml"
    fi
  else
    echo ""
    info "Not inside a PM-Kit vault"
  fi
  echo ""
}
