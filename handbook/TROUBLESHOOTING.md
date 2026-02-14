# PM-Kit Troubleshooting

## Common Issues

### Skills Not Found

**Symptom**: `/daily` or other skills don't work.

**Fix**: Ensure `.claude/skills/` directory exists and contains `SKILL.md` files.
```bash
ls .claude/skills/*/SKILL.md
```

If missing, re-run `scripts/setup.sh` or copy from source.

### Auto-Commit Not Working

**Symptom**: Changes aren't automatically committed.

**Check**:
1. `GIT_AUTO_COMMIT` is `"true"` in `.claude/settings.json`
2. Hook scripts are executable: `chmod +x .claude/hooks/*.sh`
3. You're in a git repository: `git status`

### Session Init Not Running

**Symptom**: Date variables not set, no session initialization message.

**Check**:
1. `.claude/settings.json` has SessionStart hook configured
2. `.claude/hooks/session-init.sh` is executable
3. Run manually to test: `bash .claude/hooks/session-init.sh`

### Project Not Recognized

**Symptom**: Skills say project not found.

**Fix**: Ensure project is in `_core/config.yaml` with `active: true`:
```yaml
projects:
  - id: your-project    # This must match exactly
    name: Your Project
    active: true
```

### Template Not Applied

**Symptom**: Notes created without proper structure.

**Check**: Templates exist in `_templates/`:
```bash
ls _templates/
# Should show: daily.md doc.md decision.md blocker.md meeting.md index.md inbox.md sprint-retro.md
```

### Broken Wiki-Links

**Symptom**: Links like `[[note]]` don't resolve.

**Fix**: Run `/health` to generate a health report showing all broken links, then fix or remove them.

### Git Push Fails

**Symptom**: `/push` fails with authentication error.

**Fix**:
- Check remote: `git remote -v`
- Ensure SSH key or token is configured
- Try manual push: `git push origin main`

## Config Reference

### settings.json Structure

```json
{
  "permissions": { "allow": [...], "deny": [...] },
  "env": { "VAULT_PATH": "${cwd}", "GIT_AUTO_COMMIT": "true" },
  "hooks": {
    "SessionStart": [{ "hooks": [{ "type": "command", "command": "..." }] }],
    "PostToolUse": [{ "matcher": "Write|Edit", "hooks": [...] }]
  }
}
```

### config.yaml Structure

```yaml
projects: [...]           # Your projects
paths: { ... }            # Folder path overrides
defaults: { ... }         # Behavior settings
note_types: { ... }       # Note type definitions
keywords: { ... }         # Auto-detection keywords
tags: { ... }             # Tag taxonomy
integrations: { ... }     # External service configs
templates: { ... }        # Template file mappings
```

### QMD: Command Not Found

**Symptom**: `qmd` commands fail with "command not found".

**Fix**:
1. Check bun is installed: `bun --version`
2. If bun is missing: `curl -fsSL https://bun.sh/install | bash`
3. Install QMD: `bun install -g github:tobi/qmd`
4. Verify: `qmd --version`

### QMD: Slow First Query

**Symptom**: First `/ask` with QMD takes 30-60 seconds.

**Cause**: QMD downloads a small embedding model (~100MB) on first use.

**Fix**: This is expected. Subsequent queries are fast. You can pre-warm by running `qmd embed` once.

### QMD: No Semantic Results

**Symptom**: `/ask` shows `Search Mode: Fallback (vault grep)` even though QMD is installed.

**Fix**:
1. Check embeddings exist: `qmd status`
2. If embedded count is 0: `qmd embed`
3. Verify collection exists: `qmd collection list`
4. If no collection: `qmd collection add . --name pm-kit`

### QMD: MCP Not Connected

**Symptom**: QMD is installed but `/ask` always falls back.

**Fix**:
1. Check `.mcp.json` exists in vault root with QMD config
2. Restart Claude Code session (MCP servers connect at session start)
3. Check QMD runs: `qmd mcp` (should start without errors, Ctrl+C to stop)

For full QMD reference, see [QMD_INTEGRATION.md](QMD_INTEGRATION.md).

If you're stuck, [open an issue](https://github.com/kv0906/pm-kit/issues).

## Getting Help

1. Run `/ask how do I...` for vault-specific guidance
2. Run `/health` to diagnose vault issues
3. Check `_core/PROCESSING.md` for I-P-O flows
4. Review `_core/MANIFESTO.md` for design philosophy
