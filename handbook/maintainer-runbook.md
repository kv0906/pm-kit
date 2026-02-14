# Maintainer Runbook

Audience: PM-Kit contributors/maintainers.

Maintainer-only workflow for releasing PM-Kit and governing protected branches.

## Scope
Use this runbook for:
- release creation and tagging
- changelog governance
- branch protection and merge policy

Core user/operator flow lives in `AGENTS.md` and `CLAUDE.md`.

## Branch Protection (`main`)
Enable these repository settings:
- Require a pull request before merging
- Require at least 1 approval
- Dismiss stale approvals when new commits are pushed
- Require status checks to pass before merging
  - `PR Changelog Check / changelog-entry`
- Require branches to be up to date before merging
- Restrict direct pushes to `main`
- Prefer squash merges

## Changelog Automation
How changelog updates are enforced:
1. Contributor fills `## Changelog Entry` in the PR body
2. `PR Changelog Check` fails if that section is missing or empty
3. On merge to `main`, `Changelog On Merge` appends entry to `CHANGELOG.md`

Optional but recommended:
- Keep `PR Auto Labeler` enabled for triage and release scanning

## Version Format
PM-Kit uses date-based versions:
- `YYYY.MM.DD` (example: `2026.02.14`)
- same-day follow-up release: `YYYY.MM.DD.2`
- git tag format: `vYYYY.MM.DD`

Version sources:
- `VERSION`
- `.claude-plugin/plugin.json`

## Release Criteria
Cut a release when `[Unreleased]` in `CHANGELOG.md` has meaningful value, such as:
- skill additions or major improvements
- fixes affecting daily workflows
- template/config updates
- docs that materially change user operation

## Release Procedure
Run from a clean, up-to-date `main`:

```bash
./scripts/release.sh
```

Script behavior:
1. verifies branch and clean tree
2. checks `[Unreleased]` has entries
3. generates next date-based version/tag
4. previews and asks for confirmation
5. updates version files and changelog sections
6. commits, tags, and pushes

GitHub Actions `release-on-tag.yml` then creates the GitHub Release.

## Pre-release Checklist
- [ ] All intended PRs are merged to `main`
- [ ] `CHANGELOG.md` `[Unreleased]` is accurate and complete
- [ ] No known high-impact breakages in current framework
- [ ] Local `main` matches `origin/main`

## Post-release Verification
- [ ] Git tag exists on remote
- [ ] GitHub Release was created with expected notes
- [ ] `VERSION` and plugin version match released tag
- [ ] `/update` path works against latest release metadata
