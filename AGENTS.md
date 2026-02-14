# AGENTS.md

Audience: PM-Kit users/operators.

## Project snapshot
PM-Kit is a markdown-first workspace template. Most work is in docs, templates, and shell scripts rather than compiled code.

Key paths:
- Framework docs: `README.md`, `CLAUDE.md`, `START_HERE.md`, `CHANGELOG.md`
- Runtime/config: `_core/` (including `_core/config.yaml`)
- Reusable templates: `_templates/`
- Agent assets: `.claude/` (`agents/`, `skills/`, `rules/`, `hooks/`)
- Distribution metadata: `.claude-plugin/plugin.json`
- Automation scripts: `scripts/setup.sh`, `scripts/update.sh`
- Reference material: `handbook/`, `examples/`

## Dev environment tips
- Use `rg`/`rg --files` for fast discovery instead of manual folder scanning.
- Use `./scripts/setup.sh` after cloning to initialize or validate a local PM-Kit vault.
- Before changing automation, read the script you are touching end-to-end and keep guardrails intact.
- Keep edits repository-relative and avoid machine-specific absolute paths in docs and scripts.
- If a change affects user-facing flow, update both docs and templates in the same PR.

## Core commands
- `./scripts/setup.sh`: initialize or verify local PM-Kit setup.
- `./scripts/update.sh --check`: detect whether upstream framework updates are available.
- `./scripts/update.sh --dry-run`: preview update effects without mutating files.
- `./scripts/update.sh`: apply framework updates.
- `git status && git diff`: required local sanity check before commit/PR.

## Testing instructions
- Inspect CI definitions in `.github/workflows/` before significant changes.
- Primary CI checks include:
  - `PR Changelog Check` (`.github/workflows/pr-changelog-check.yml`)
  - `PR Auto Labeler` (`.github/workflows/pr-labeler.yml`)
  - `Changelog On Merge` (`.github/workflows/changelog-on-merge.yml`)
- For script changes, test both:
  - happy path
  - guardrails (dirty git tree, missing prerequisites, invalid inputs)
- For docs/template changes, verify command examples and paths still resolve.
- Treat changes as incomplete until affected flows can be executed without manual patch-ups.

## Style and naming rules
- Prefer clear Markdown with short, action-oriented sections.
- Use heading hierarchy in order: `#`, `##`, `###`.
- Use kebab-case filenames for new docs/scripts/templates.
- For new shell scripts, use `bash` and `set -euo pipefail`.

## PR instructions
- Use conventional commit prefixes: `feat:`, `fix:`, `docs:`, `chore:`, `release:` (optional scope allowed, e.g. `fix(update): ...`).
- Use `.github/PULL_REQUEST_TEMPLATE.md`.
- Ensure `## Changelog Entry` is completed in the PR template.
- Include:
  - what changed
  - why it changed
  - manual test evidence
  - screenshots/examples for workflow UX changes
- Run relevant local checks before opening/merging a PR.

## Maintainer-only operations
Release, tagging, and branch-protection workflow are intentionally separated from this core guide.
Use `handbook/maintainer-runbook.md` for maintainer flow.
