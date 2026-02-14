# Release Policy

How PM-Kit versions are created and published.

## Version Format

**Date-based**: `YYYY.MM.DD` (e.g., `2026.02.14`). Same-day releases append a suffix: `2026.02.14.2`.

Git tags use a `v` prefix: `v2026.02.14`.

**Why date-based?** PM-Kit is a knowledge vault framework, not a library with API contracts. Date-based versions communicate "when" rather than implying semver compatibility promises. Users see a clear timeline of updates.

## When to Release

Release when the `[Unreleased]` section in `CHANGELOG.md` has meaningful content:
- New skills or skill improvements
- Bug fixes affecting user workflows
- Template or config changes
- Documentation improvements that ship with the framework

No fixed schedule — release when there's value to ship.

## How to Release

From a clean `main` branch:

```bash
./scripts/release.sh
```

The script will:
1. Verify you're on `main` with a clean, up-to-date tree
2. Check that `[Unreleased]` in CHANGELOG.md has entries
3. Generate a date-based tag (handles same-day collisions)
4. Show a preview and prompt for confirmation
5. Update `VERSION`, `.claude-plugin/plugin.json`, and `CHANGELOG.md`
6. Commit, tag, and push

## What Happens After

GitHub Actions (`.github/workflows/release-on-tag.yml`) automatically creates a GitHub Release with the changelog notes extracted from `CHANGELOG.md`.

Users receive the update when they run `/update` or `./scripts/update.sh`.

## Checklist

Before running `release.sh`:
- [ ] All PRs for this release are merged to `main`
- [ ] `[Unreleased]` section in CHANGELOG.md accurately describes changes
- [ ] No known broken functionality in the framework
- [ ] Local `main` is up-to-date with `origin/main`
