# Repository Guidelines

## Project Structure & Module Organization
PM-Kit is a markdown-first workspace template. Core framework files live at the repository root (`README.md`, `CLAUDE.md`, `START_HERE.md`, `CHANGELOG.md`).

- Runtime/config: `_core/` (manifesto, processing guide, `config.yaml`)
- Reusable content: `_templates/` (daily, decision, blocker, doc templates)
- Agent system: `.claude/` (`agents/`, `skills/`, `rules/`, `hooks/`)
- Distribution metadata: `.claude-plugin/plugin.json`
- Automation scripts: `scripts/setup.sh`, `scripts/update.sh`, `scripts/release.sh`
- Reference docs: `handbook/`, `examples/`

## Build, Test, and Development Commands
This repo does not have a compile step; validation is script- and workflow-driven.

- `./scripts/setup.sh`: initialize or verify a PM-Kit vault locally
- `./scripts/update.sh --check`: check for upstream framework updates
- `./scripts/update.sh --dry-run`: preview update changes without applying
- `./scripts/release.sh`: maintainer-only release flow (requires clean `main`)
- `git status && git diff`: required pre-PR sanity check

## Coding Style & Naming Conventions
Prefer Markdown + shell with simple, readable structure.

- Markdown headings in logical order (`#`, `##`, `###`), short sections, actionable wording
- Shell scripts: `bash` with `set -euo pipefail` for new scripts
- File names: kebab-case for docs/templates/scripts (for example, `workflow-examples.md`)
- Keep paths explicit and repository-relative (for example, `_templates/daily.md`)

## Testing Guidelines
Testing is primarily manual plus CI policy checks.

- Manually run affected scripts and verify expected files/outputs
- If changing update/release behavior, test both happy path and guardrails (dirty tree, missing tools)
- Confirm docs and command references stay in sync (`README.md`, `CLAUDE.md`, handbook pages)
- CI enforces PR changelog quality via `PR Changelog Check`

## Commit & Pull Request Guidelines
Follow conventional-style commit prefixes seen in history: `feat:`, `fix:`, `docs:`, `chore:`, `release:` (optional scope, e.g., `fix(update): ...`). Keep messages imperative and specific.

For PRs, use `.github/PULL_REQUEST_TEMPLATE.md` and include:
- clear description and change type
- linked issue when applicable
- completed `## Changelog Entry` (required for merge)
- manual test notes; screenshots/examples for workflow UX changes
