# ClaudeKit PM - Project Knowledge Base

> This document serves as the centralized knowledge base for ClaudeKit PM, tracking project vision, architecture decisions, roadmap, and progress.

**Last Updated:** 2025-11-24

---

## Table of Contents

1. [Project Vision](#project-vision)
2. [Core Principles](#core-principles)
3. [Architecture Decisions](#architecture-decisions)
4. [Current Status](#current-status)
5. [Roadmap](#roadmap)
6. [Completed Initiatives](#completed-initiatives)
7. [Decision Log](#decision-log)

---

## Project Vision

### Mission
Empower Product Managers with AI-enhanced systematic thinking through Long Chain-of-Thought methodology, making expert-level PM practices accessible to everyone.

### Goals
1. **Simplicity**: PMs should understand and use the framework in minutes, not hours
2. **Depth**: Every command delivers expert-level analysis with 15+ reasoning steps
3. **Consistency**: Outputs follow professional standards and templates
4. **Discoverability**: PMs always know which command to use for their situation

### Target Users
- Product Managers (all experience levels)
- Technical Program Managers
- Product Owners
- Anyone doing product work who needs structured thinking

### Value Proposition
```
Traditional PM Work          →    ClaudeKit PM
──────────────────────────────────────────────────
Hours writing PRDs           →    `/prd` in minutes
Scattered research notes     →    `/research` synthesized
Gut-feel prioritization      →    `/prioritize` with frameworks
Endless stakeholder debates  →    `/consensus` with structure
```

---

## Core Principles

### 1. Simple Mental Model (2+1)
PMs see only two concepts:
- **Commands** - "I need to do something" (produce deliverables)
- **Skills** - "I need to learn something" (educational content)

Everything else (agents, workflows, templates) is hidden "under the hood."

### 2. File System As Context
All prompts, workflows, and agents are stored as markdown files that Claude reads dynamically. Benefits:
- Version controllable
- Human readable and editable
- No compilation or runtime
- Easy to extend and customize

### 3. Long Chain-of-Thought
Every workflow implements:
- **15+ systematic steps** across multiple phases
- **Verification checkpoints** at each phase
- **Backtracking triggers** when issues are found
- **Quality checklists** before completion

### 4. Progressive Disclosure
- Quick commands for simple tasks
- Deep workflows for complex reasoning
- Optional depth at every step

---

## Architecture Decisions

### ADR-001: Command → Agent → Workflow Pattern
**Date:** 2024-11-21 | **Status:** Active

**Context:** Need a consistent pattern for how commands execute.

**Decision:**
```
User invokes:     Command loads:      Which follows:
┌────────┐       ┌────────────┐      ┌──────────────┐
│ /prd   │ ────> │ Agent      │ ───> │ Workflow     │ ──> Output
└────────┘       │ Persona    │      │ Methodology  │
                 └────────────┘      └──────────────┘
```

**Rationale:**
- Separation of concerns (entry point, capabilities, methodology)
- Reusable agents across multiple commands
- Detailed workflows without cluttering commands

---

### ADR-002: Deprecate Rather Than Delete
**Date:** 2025-11-24 | **Status:** Active

**Context:** Need to consolidate redundant commands without breaking existing users.

**Decision:** When consolidating components:
1. Add deprecation notice at top of file
2. Include migration guide
3. Preserve legacy documentation
4. Keep for minimum 2 minor versions

**Rationale:**
- Non-breaking changes
- Gradual migration path
- Transparent communication

---

### ADR-003: Research Command Consolidation
**Date:** 2025-11-24 | **Status:** Implemented

**Context:** 4 separate research commands caused confusion:
- `/research` - Multi-source synthesis
- `/research-unified` - All types unified
- `/evidence` - Evidence assessment
- `/synthesize` - User research

**Decision:** Consolidate into single `/research` command with auto-detection:
- Keywords "users", "customers", "interviews" → User research mode
- Keywords "evidence", "validate", "confidence" → Evidence assessment mode
- Keywords "metrics", "analytics", "KPI" → Analytics research mode
- Default → Multi-source synthesis mode

**Rationale:**
- One command to remember
- Auto-detection reduces cognitive load
- All functionality preserved

---

### ADR-004: ASCII Diagrams as Command
**Date:** 2025-11-24 | **Status:** Implemented

**Context:** `ascii-diagrams.md` skill was educational but users wanted to generate diagrams on demand.

**Decision:** Create `/diagram` command, keep skill for reference.

**Rationale:**
- Skills are for learning, commands are for doing
- Diagrams are frequently needed in PM work
- On-demand generation more valuable than reference material

---

### ADR-005: Claude Code Alignment
**Date:** 2025-11-24 | **Status:** Implemented

**Context:** Framework used custom patterns that didn't align with Claude Code best practices:
- `{{input}}` placeholder instead of `$ARGUMENTS`
- Agents lacked proper YAML frontmatter for auto-delegation
- Workflows in separate files (complex 3-layer architecture)

**Decision:** Align with Claude Code subagent patterns:
1. Use `$ARGUMENTS` placeholder in all commands
2. Add YAML frontmatter to agents: `name`, `description`, `tools`, `model`
3. Include "Use PROACTIVELY" in agent descriptions for auto-delegation
4. Embed workflows directly into agent files
5. Archive legacy workflow files for reference

**Migration:**
```
Before: Command → Agent → Workflow (3 files)
After:  Command → Agent (2 files, workflow embedded)
```

**Rationale:**
- Simpler architecture (2 components vs 3)
- Better agent auto-delegation with proper frontmatter
- Consistent with Claude Code documentation
- Easier maintenance (single file per agent)

---

### ADR-006: Claude Code Plugin Conversion
**Date:** 2025-11-24 | **Status:** Implemented

**Context:** Framework was distributed via custom CLI (`pm-kit-cli`) which required separate installation and maintenance. Claude Code now supports native plugins with marketplace distribution.

**Decision:** Convert to native Claude Code plugin:
1. Create `.claude-plugin/plugin.json` manifest
2. Create `.claude-plugin/marketplace.json` for distribution
3. Restructure to plugin standard directories:
   - `.claude/commands/` → `commands/`
   - `.claude/agents/` → `agents/`
   - `.claude/skills/` → `skills/[name]/SKILL.md` format
4. Deprecate pm-kit-cli in favor of plugin installation

**Migration:**
```
Before: npm install -g pm-kit-cli && pm-kit init
After:  /plugin marketplace add vanlumberworks/pm-kit && /plugin install pm-kit@pm-tools
```

**Rationale:**
- Native Claude Code integration (no CLI required)
- Marketplace discovery for wider adoption
- Automatic updates via plugin system
- Standard structure familiar to plugin developers

---

## Current Status

**Version:** 0.4.0
**Released:** 2025-11-24
**Distribution:** Claude Code Plugin (marketplace: pm-tools)

### Component Counts
| Component | Active | Deprecated | Archived | Total |
|-----------|--------|------------|----------|-------|
| Commands | 16 | 3 | 0 | 19 |
| Agents | 10 | 1 | 0 | 11 |
| Templates | 4 | 0 | 0 | 4 |
| Skills | 5 | 0 | 0 | 5 |
| Workflows | 0 | 0 | 19 | 19 |

> **Note:** Now distributed as Claude Code plugin (v0.4.0+)

### Active Commands by Category

**Discovery:**
- `/pm` - Help choosing the right command
- `/decompose` - Problem decomposition
- `/research` - Comprehensive research (all types)

**Definition:**
- `/prd` - Product Requirements Document
- `/flow` - User flow diagrams (Mermaid)
- `/mockup` - ASCII wireframes
- `/diagram` - ASCII diagrams
- `/design-spec` - Design handoff specs

**Decision:**
- `/prioritize` - RICE/ICE/Kano frameworks
- `/decide` - Quick decision framework
- `/matrix` - Comparison matrices
- `/consensus` - Stakeholder alignment

**Communication:**
- `/strategy` - Strategic planning
- `/architecture` - PM-friendly architecture docs
- `/explain-code` - Code translation
- `/tech-impact` - Technical feasibility

---

## Roadmap

### v0.3.0 - Claude Code Alignment (Released)
- [x] Migrate `{{input}}` to `$ARGUMENTS` in all commands
- [x] Restructure agents with YAML frontmatter
- [x] Embed workflows into agents
- [x] Archive legacy workflow files
- [x] Update documentation

### v0.4.0 - Plugin Conversion (Released)
- [x] Create `.claude-plugin/plugin.json` manifest
- [x] Create `.claude-plugin/marketplace.json`
- [x] Restructure to plugin standard directories
- [x] Convert skills to `SKILL.md` format
- [x] Update documentation for plugin installation

### v0.5.0 - Quality of Life (Planned)
- [ ] Command cheat sheet template
- [ ] Interactive tutorials for new users
- [ ] More "Next Steps" suggestions across all commands
- [ ] Improved error handling and guidance

### v0.6.0 - Expansion (Planned)
- [ ] New commands for competitive analysis
- [ ] New commands for go-to-market planning
- [ ] Integration templates for common tools (Jira, Linear, Notion)

### v1.0.0 - Stable Release (Future)
- [ ] Comprehensive documentation
- [ ] Battle-tested workflows
- [ ] Community contributions incorporated
- [ ] Plugin marketplace verification

### Future Considerations
- Localization (non-English support)
- Industry-specific command variants (B2B, B2C, Platform)
- Custom command creation guide
- Agent orchestration (multi-agent collaboration)
- Additional PM tool plugins in marketplace

---

## Completed Initiatives

### Initiative: Plugin Conversion (v0.4.0)
**Completed:** 2025-11-24

**Goals:**
- Convert to native Claude Code plugin
- Enable marketplace distribution
- Deprecate custom CLI installation

**Outcomes:**
| Metric | Before | After |
|--------|--------|-------|
| Distribution | npm CLI (pm-kit-cli) | Claude Code plugin |
| Installation | `npm install -g pm-kit-cli` | `/plugin install pm-kit` |
| Directory structure | `.claude/` subdirectories | Root-level plugin standard |
| Skills format | Individual `.md` files | `SKILL.md` in directories |

**What was done:**
1. Created `.claude-plugin/plugin.json` manifest
2. Created `.claude-plugin/marketplace.json` for pm-tools marketplace
3. Moved `commands/`, `agents/`, `templates/` to root level
4. Converted skills to `skills/[name]/SKILL.md` format
5. Updated all documentation with plugin installation instructions
6. Added deprecation notice for pm-kit-cli

---

### Initiative: Claude Code Alignment (v0.3.0)
**Completed:** 2025-11-24

**Goals:**
- Align framework with Claude Code best practices
- Simplify architecture from 3-layer to 2-layer
- Enable proper agent auto-delegation

**Outcomes:**
| Metric | Before | After |
|--------|--------|-------|
| Architecture layers | 3 (Command→Agent→Workflow) | 2 (Command→Agent) |
| Placeholder syntax | `{{input}}` | `$ARGUMENTS` |
| Agent frontmatter | None | YAML with name, description, tools, model |
| Workflow location | Separate files (21) | Embedded in agents |

**What was done:**
1. Migrated all 19 commands from `{{input}}` to `$ARGUMENTS`
2. Restructured all 11 agents with Claude Code YAML frontmatter
3. Embedded workflows directly into agent definitions
4. Added "Use PROACTIVELY" to agent descriptions for auto-delegation
5. Archived legacy workflow files to `.claude/archived-workflows/`
6. Updated all documentation (CLAUDE.md, README, PLAN.md)

---

### Initiative: Framework Optimization (v0.2.0)
**Completed:** 2025-11-24

**Goals:**
- Simplify mental model for PMs
- Reduce command redundancy
- Improve discoverability

**Outcomes:**
| Metric | Before | After |
|--------|--------|-------|
| Research entry points | 4 | 1 |
| New helpful commands | 0 | 2 (`/pm`, `/diagram`) |
| Commands with next-step guidance | 0 | 5 |
| Mental model concepts | 4 | 2 |

**What was done:**
1. Created `/pm` help command for guided selection
2. Created `/diagram` command (promoted from skill)
3. Consolidated research stack into single `/research` command
4. Added next-step suggestions to major commands
5. Updated README with command taxonomy
6. Updated CLAUDE.md with contributor guidelines

### Initiative: Open Source Readiness (v0.2.0)
**Completed:** 2025-11-24

**Goals:**
- Prepare repository for public contribution
- Establish maintenance processes
- Fix documentation issues

**Outcomes:**
- CONTRIBUTING.md with style guide
- CHANGELOG.md with version history
- CODE_OF_CONDUCT.md for community standards
- GitHub issue and PR templates
- Fixed all broken README links
- Added .gitignore

---

## Decision Log

| Date | Decision | Rationale | ADR |
|------|----------|-----------|-----|
| 2024-11-21 | Use markdown files for all prompts | Version control, human readable, no build step | ADR-001 |
| 2024-11-21 | Command → Agent → Workflow pattern | Separation of concerns, reusability | ADR-001 |
| 2025-11-24 | Deprecate rather than delete | Non-breaking, gradual migration | ADR-002 |
| 2025-11-24 | `/research` as canonical research command | Simpler, auto-detection for modes | ADR-003 |
| 2025-11-24 | Convert ascii-diagrams skill to `/diagram` command | Commands for doing, skills for learning | ADR-004 |
| 2025-11-24 | Align with Claude Code subagent patterns | Simpler architecture, better auto-delegation | ADR-005 |
| 2025-11-24 | Embed workflows into agents | Single-file agents, easier maintenance | ADR-005 |
| 2025-11-24 | Use `$ARGUMENTS` placeholder | Claude Code standard syntax | ADR-005 |
| 2025-11-24 | Convert to Claude Code plugin | Native integration, marketplace distribution | ADR-006 |
| 2025-11-24 | Restructure to plugin standard directories | Standard plugin layout, auto-discovery | ADR-006 |
| 2025-11-24 | Convert skills to SKILL.md format | Plugin skill discovery requirement | ADR-006 |
| 2025-11-24 | Root-level documentation files | Simpler than docs/ folder for markdown-only repo | - |

---

## Contributing to This Document

This PLAN.md serves as the project's living knowledge base. When making changes:

1. **Adding ADRs**: Use the ADR-XXX format with Date, Status, Context, Decision, Rationale
2. **Updating Roadmap**: Move completed items to "Completed Initiatives"
3. **Decision Log**: Record significant decisions with date and rationale
4. **Status Updates**: Keep component counts current after releases

See [CONTRIBUTING.md](CONTRIBUTING.md) for full contribution guidelines.
