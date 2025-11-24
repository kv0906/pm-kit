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

## Current Status

**Version:** 0.2.0
**Released:** 2025-11-24

### Component Counts
| Component | Active | Deprecated | Total |
|-----------|--------|------------|-------|
| Commands | 16 | 3 | 19 |
| Workflows | 20 | 1 | 21 |
| Agents | 10 | 1 | 11 |
| Templates | 4 | 0 | 4 |
| Skills | 4 | 0 | 4 |

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

### v0.3.0 - Quality of Life (Planned)
- [ ] Command cheat sheet template
- [ ] Interactive tutorials for new users
- [ ] More "Next Steps" suggestions across all commands
- [ ] Improved error handling and guidance

### v0.4.0 - Expansion (Planned)
- [ ] New commands for competitive analysis
- [ ] New commands for go-to-market planning
- [ ] Integration templates for common tools (Jira, Linear, Notion)
- [ ] Multi-document workflows (PRD → Spec → Tasks)

### v1.0.0 - Stable Release (Future)
- [ ] Comprehensive documentation
- [ ] Battle-tested workflows
- [ ] Community contributions incorporated
- [ ] CLI v1.0.0 alignment

### Future Considerations
- Localization (non-English support)
- Industry-specific command variants (B2B, B2C, Platform)
- Custom command creation guide
- Agent orchestration (multi-agent collaboration)

---

## Completed Initiatives

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
| 2025-11-24 | Keep skills in `.claude/skills/` | Low priority to reorganize, current structure works | - |
| 2025-11-24 | Root-level documentation files | Simpler than docs/ folder for markdown-only repo | - |

---

## Contributing to This Document

This PLAN.md serves as the project's living knowledge base. When making changes:

1. **Adding ADRs**: Use the ADR-XXX format with Date, Status, Context, Decision, Rationale
2. **Updating Roadmap**: Move completed items to "Completed Initiatives"
3. **Decision Log**: Record significant decisions with date and rationale
4. **Status Updates**: Keep component counts current after releases

See [CONTRIBUTING.md](CONTRIBUTING.md) for full contribution guidelines.
