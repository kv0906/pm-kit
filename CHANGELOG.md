# Changelog

All notable changes to PM-Kit will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Removed
- `/gemini-research` command - MCP-based Gemini integration removed (Python scripts still available in `scripts/gemini/`)
- `.mcp.json` - MCP server configuration no longer required
- MCP tool references from `research-agent.md` and `gemini-grounded-search/SKILL.md`

---

## [0.5.0] - 2025-11-24

### Added
- `/northstar` - Transform raw ideas into North Star framework (Problem → Vision → Target → Constraints → Bets)
- `/retro` - Transform meeting notes into structured retrospectives with actions and owners
- `/today` - Daily work suggestions based on open items, priorities, and blockers
- `/handover` - Generate vacation/transition handover documentation
- `/gemini-research` - Research with Gemini grounded search (real-time web results with citations)
- `gemini-grounded-search` skill - Real-time web search and code execution via Gemini API
- Next-step suggestions added to all remaining commands

### Added Agents
- `northstar-architect.md` - North Star framework generation from raw ideas
- `retro-facilitator.md` - Retrospective facilitation and meeting synthesis
- `daily-planner.md` - Daily work planning and prioritization
- `handover-generator.md` - Handover and transition documentation

### Fixed
- Corrected broken file path references in 14 command files
- Fixed `.claude/agents/` → `./agents/` paths
- Fixed `.claude/templates/` → `./templates/` paths
- Fixed `.claude/skills/` → `./skills/*/SKILL.md` paths

### Removed
- `commands/evidence.md` - Deprecated, use `/research` with evidence keywords
- `commands/synthesize.md` - Deprecated, use `/research` with user research keywords
- `commands/research-unified.md` - Deprecated, use `/research` instead
- `agents/research-synthesizer.md` - Consolidated into `research-agent.md`
- Non-existent `.claude/workflows/` references from all commands

---

## [0.4.0] - 2025-11-24

### Added
- Native Claude Code plugin support
- `.claude-plugin/plugin.json` manifest for plugin installation
- `.claude-plugin/marketplace.json` for pm-kit marketplace
- Plugin can now be installed via `/plugin install kv0906/pm-kit`

### Changed
- **Breaking**: Restructured to Claude Code plugin standard directories:
  - `.claude/commands/` → `commands/`
  - `.claude/agents/` → `agents/`
  - `.claude/templates/` → `templates/`
  - `.claude/skills/` → `skills/[name]/SKILL.md` format
- Skills now use `SKILL.md` format in subdirectories for plugin auto-discovery
- Updated all documentation for plugin-based installation
- Project renamed from "ClaudeKit PM" to "PM-Kit"

### Removed
- `archived-workflows/` directory (workflows are embedded in agents)
- Legacy `.claude/` directory structure
- Dependency on `pm-kit-cli` for installation

### Migration
```bash
# Old installation (deprecated)
npm install -g pm-kit-cli && pm-kit init

# New installation
/plugin install kv0906/pm-kit
```

---

## [0.3.0] - 2025-11-24

### Added
- Claude Code subagent pattern alignment
- YAML frontmatter to all agents (`name`, `description`, `tools`, `model`)
- "Use PROACTIVELY" triggers in agent descriptions for auto-delegation
- ADR-005 documenting Claude Code alignment decision

### Changed
- All commands now use `$ARGUMENTS` placeholder (was `{{input}}`)
- Workflows embedded directly into agent definitions
- Architecture simplified from 3-layer to 2-layer:
  - Before: Command → Agent → Workflow
  - After: Command → Agent (workflow embedded)
- Agents restructured with complete methodology in single file

### Deprecated
- Standalone workflow files (now archived, embedded in agents)

---

## [0.2.0] - 2025-11-24

### Added
- `/pm` help command for guided command selection
- `/diagram` command for ASCII diagrams (promoted from skill)
- Next-step suggestions to major commands (`/prd`, `/decompose`, `/prioritize`, `/consensus`, `/research`)
- Command taxonomy in README organized by activity phase (Discovery, Definition, Decision, Communication)
- Contributor guidelines in CLAUDE.md
- PLAN.md optimization roadmap
- Repository maintenance documentation (CONTRIBUTING.md, CHANGELOG.md, CODE_OF_CONDUCT.md)
- GitHub issue and PR templates

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

---

## [0.1.0] - 2024-11-21

### Added
- Initial release of PM-Kit Framework
- 18 comprehensive PM workflows implementing Long Chain-of-Thought methodology
- 10 specialized agents for systematic problem-solving
- 16 slash commands for PM tasks
- 4 document templates (consensus, decision matrix, evidence log, research matrix)
- 5 technical literacy skills for non-technical PMs

---

## Version History Summary

| Version | Date | Highlights |
|---------|------|------------|
| 0.5.0 | 2025-11-24 | Golden Commands, Gemini integration, path fixes |
| 0.4.0 | 2025-11-24 | Claude Code plugin conversion, marketplace support |
| 0.3.0 | 2025-11-24 | Claude Code alignment, embedded workflows |
| 0.2.0 | 2025-11-24 | Research consolidation, `/pm` help, `/diagram` command |
| 0.1.0 | 2024-11-21 | Initial release |

---

## Versioning Policy

PM-Kit follows [Semantic Versioning](https://semver.org/):

- **MAJOR** (X.0.0): Breaking changes to command interfaces or plugin structure
- **MINOR** (0.X.0): New commands, agents, or features; non-breaking enhancements
- **PATCH** (0.0.X): Bug fixes, documentation updates, minor improvements

### Deprecation Timeline

- Deprecated features are announced in CHANGELOG
- Deprecated features remain functional for at least 2 minor versions
- Removal is announced in advance with migration guides
