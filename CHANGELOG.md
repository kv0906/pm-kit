# Changelog

All notable changes to this project are documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/).

## [Unreleased]

<!-- New merged PR entries are inserted here automatically. -->

## [2026.02.14] - 2026-02-14

<!-- New merged PR entries are inserted here automatically. -->

### Removed
- `/adr` command and ADR workflow (architecture decisions now use `/decide`)
- OKR tracking system (`/okr-tracking` skill, `roadmap/` folder)
- ADR template, naming conventions, and folder structure
- OKR references from `/weekly`, `/progress`, `/onboard`, and output styles
- `research/` folder concept removed (use `docs/general/` for non-project docs)
- Framework docs moved from `docs/` to `handbook/` (docs/ is now user-only)

### Changed
- `/weekly` simplified to operational weekly review (Collect/Reflect/Plan without OKR alignment)
- PM Coach output style uses delivery/accountability language instead of OKR-specific terms
- Migration auto-removes deprecated `adrs/` and `roadmap/` directories on update
- Framework documentation moved to `handbook/` directory
- `docs/` is now exclusively for user-generated content
- `/doc` without project writes to `docs/general/` instead of requiring project

## [3.1.0] - 2026-02-14

### Added
- Update system: `scripts/update.sh` for safe framework updates from upstream
- `/update` skill for checking and applying updates from within Claude
- `VERSION` file as single source of truth for release tracking
- Interactive `/onboard` rewrite with project setup wizard
- QMD integration documentation (`docs/QMD_INTEGRATION.md`)

### Changed
- Path standardization: dropped `00-inbox`/`01-index` prefixed folders
- Setup hardening: `scripts/setup.sh` validates prerequisites and handles edge cases
- Vault consistency pass: standardized paths, hardened setup, fixed stale refs

### Fixed
- Stale references to old folder naming conventions
- Broken wikilinks after path standardization

## [3.0.0] - 2026-01-15

### Added
- Initial PM-Kit release (renamed from MindLoom)
- 15 skills: daily, progress, block, decide, doc, meet, inbox, ask, health, adr, weekly, push, onboard, vault-ops, okr-tracking
- 4 agents: scribe, analyst, maintainer, processor
- QMD integration for hybrid search (BM25 + vector + rerank)
- Obsidian-compatible knowledge vault structure
- `_core/` framework: config.yaml, MANIFESTO.md, PROCESSING.md
- Template system with Handlebars syntax
- Naming-as-API conventions for glob-based queries
- Auto-archiving on status change
- PM Coach output style
- GitHub Actions workflow for changelog automation

[Unreleased]: https://github.com/kv0906/pm-kit/compare/v2026.02.14...HEAD
[2026.02.14]: https://github.com/kv0906/pm-kit/compare/v0.1.1...v2026.02.14[3.1.0]: https://github.com/kv0906/pm-kit/compare/v3.0.0...v3.1.0
[3.0.0]: https://github.com/kv0906/pm-kit/releases/tag/v3.0.0
