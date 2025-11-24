# Changelog

All notable changes to ClaudeKit PM will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added
- Repository maintenance documentation (CONTRIBUTING.md, CHANGELOG.md, CODE_OF_CONDUCT.md)
- GitHub issue and PR templates
- .gitignore file

### Changed
- PLAN.md restructured as centralized knowledge base
- README.md documentation links fixed

---

## [0.2.0] - 2025-11-24

### Added
- `/pm` help command for guided command selection
- `/diagram` command for ASCII diagrams (promoted from skill)
- Next-step suggestions to major commands (`/prd`, `/decompose`, `/prioritize`, `/consensus`, `/research`)
- Command taxonomy in README organized by activity phase (Discovery, Definition, Decision, Communication)
- Contributor guidelines in CLAUDE.md
- PLAN.md optimization roadmap

### Changed
- `/research` command now handles all research types with auto-detection:
  - Multi-source synthesis (default)
  - User research (keywords: users, customers, personas, interviews)
  - Evidence assessment (keywords: evidence, validate, confidence)
  - Analytics research (keywords: metrics, analytics, KPI, funnel)
- README.md reorganized with simplified mental model (Commands + Skills)
- CLAUDE.md updated with architecture explanation

### Deprecated
- `/research-unified` - Use `/research` instead
- `/evidence` - Use `/research` with evidence keywords
- `/synthesize` - Use `/research` with user research keywords
- `research-synthesizer.md` agent - Use `research-agent.md`
- `research-synthesis.md` workflow - Use `research-core.md`

---

## [0.1.0] - 2024-11-21

### Added
- Initial release of ClaudeKit PM Framework
- 18 comprehensive PM workflows implementing Long Chain-of-Thought methodology
- 10 specialized agents for systematic problem-solving:
  - Problem Decomposer
  - PRD Writer
  - Research Synthesizer
  - User Researcher
  - Prioritization Engine
  - Consensus Builder
  - Matrix Generator
  - Analytics Synthesizer
  - Technical Translator
  - Rapid Prototyper
- 16 slash commands for quick access:
  - `/prd` - Generate PRDs
  - `/decompose` - Problem decomposition
  - `/research` - Research synthesis
  - `/prioritize` - Feature prioritization
  - `/strategy` - Strategic planning
  - `/decide` - Decision framework
  - `/consensus` - Stakeholder alignment
  - `/matrix` - Comparison matrices
  - `/evidence` - Evidence assessment
  - `/synthesize` - User research synthesis
  - `/architecture` - Architecture documentation
  - `/explain-code` - Code translation
  - `/tech-impact` - Technical feasibility
  - `/mockup` - ASCII wireframes
  - `/flow` - User flow diagrams
  - `/design-spec` - Design handoff specs
- 4 document templates:
  - Consensus template
  - Decision matrix
  - Evidence log
  - Research matrix
- 5 technical literacy skills for non-technical PMs:
  - JSON fundamentals
  - API basics
  - ASCII diagrams
  - Frontend prompts
  - Debug without code

---

## Version History Summary

| Version | Date | Highlights |
|---------|------|------------|
| 0.2.0 | 2025-11-24 | Research consolidation, `/pm` help, `/diagram` command |
| 0.1.0 | 2024-11-21 | Initial release |

---

## Versioning Policy

ClaudeKit PM follows [Semantic Versioning](https://semver.org/):

- **MAJOR** (X.0.0): Breaking changes to command interfaces or workflow outputs
- **MINOR** (0.X.0): New commands, workflows, or agents; non-breaking enhancements
- **PATCH** (0.0.X): Bug fixes, documentation updates, minor improvements

### Deprecation Timeline

- Deprecated features are announced in CHANGELOG
- Deprecated features remain functional for at least 2 minor versions
- Removal is announced in advance with migration guides
