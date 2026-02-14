# Maintainer Workflow

This repository uses automated changelog logging for every merged PR to `main`.

## Required Branch Protection for `main`

Enable these settings in GitHub branch protection:

- Require a pull request before merging
- Require approvals: 1+
- Dismiss stale approvals when new commits are pushed
- Require status checks to pass before merging
  - `PR Changelog Check / changelog-entry`
- Require branches to be up to date before merging
- Restrict who can push to matching branches (no direct pushes)
- Allow only squash merges (recommended)

## How Changelog Logging Works

1. Contributor fills `## Changelog Entry` in PR body.
2. `PR Changelog Check` fails if this section is missing/empty.
3. After merge to `main`, `Changelog On Merge` appends an entry to `CHANGELOG.md` and commits it.

## Optional Labels Strategy

`PR Auto Labeler` applies labels by file path to improve triage and release scanning.
