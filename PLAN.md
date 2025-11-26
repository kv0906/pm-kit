# PM-Kit - Project Knowledge Base

> This document serves as the centralized knowledge base for PM-Kit, tracking project vision, architecture decisions, roadmap, and progress.

**Last Updated:** 2025-11-25 (ADR-009: Excalidraw intelligent auto-detection & template system)

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
Traditional PM Work          →    PM-Kit
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

### ADR-001: Command → Agent Pattern
**Date:** 2024-11-21 | **Status:** Active (Updated v0.3.0)

**Context:** Need a consistent pattern for how commands execute.

**Decision (Updated):**
```
User invokes:     Command delegates to:
┌────────┐       ┌────────────────────────────────┐
│ /prd   │ ────> │ Agent (with embedded workflow) │ ──> Output
└────────┘       └────────────────────────────────┘
```

**Original (v0.1.0):** 3-layer Command → Agent → Workflow
**Current (v0.3.0+):** 2-layer Command → Agent (workflow embedded)

**Rationale:**
- Simpler architecture (2 components vs 3)
- Single file per agent contains complete methodology
- Easier maintenance and understanding

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
**Date:** 2025-11-24 | **Status:** Superseded by ADR-007

**Context:** `ascii-diagrams.md` skill was educational but users wanted to generate diagrams on demand.

**Decision:** Create `/diagram` command, keep skill for reference.

**Update (2025-11-25):** Renamed to `/ascii` for clarity. See ADR-007.

**Rationale:**
- Skills are for learning, commands are for doing
- Diagrams are frequently needed in PM work
- On-demand generation more valuable than reference material

---

### ADR-007: Diagram Command Consolidation
**Date:** 2025-11-25 | **Status:** Implemented

**Context:** Had multiple overlapping diagram-related commands causing user confusion:
- `/mockup` - ASCII wireframes
- `/wireframe` - Same as mockup (newer)
- `/flow` - Mermaid user flows
- `/mermaid` - Same as flow but with more diagram types
- `/diagram` - ASCII diagrams
- `/ascii` - Same as diagram (newer)

**Decision:** Consolidate and rename for clarity:
1. **DELETE**: `/mockup` → Use `/wireframe` instead
2. **DELETE**: `/flow` → Use `/mermaid` instead
3. **DELETE**: `/diagram` → Use `/ascii` instead

**Migration Guide:**
- `/mockup "page"` → `/wireframe "page"`
- `/flow "journey"` → `/mermaid "journey"`
- `/diagram "system"` → `/ascii "system"`

**Rationale:**
- **Clarity**: Names now match output format (wireframe, mermaid, ascii, excalidraw)
- **Simplicity**: 4 distinct commands instead of 7 overlapping ones
- **Discoverability**: Easier for users to understand which command to use
- **Non-breaking**: Kept deprecated files initially with migration notices (later removed)

**Final Command Structure:**
- `/mermaid` - Visual diagrams (Mermaid.js - flowcharts, Gantt, ERD, etc.)
- `/ascii` - Text-based diagrams (universal compatibility)
- `/wireframe` - ASCII wireframes for UI screens
- `/excalidraw` - Hand-drawn style diagrams (presentations)

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
After:  /plugin install kv0906/pm-kit
```

**Rationale:**
- Native Claude Code integration (no CLI required)
- Marketplace discovery for wider adoption
- Automatic updates via plugin system
- Standard structure familiar to plugin developers

---

### ADR-007: Golden Commands Initiative
**Date:** 2025-11-24 | **Status:** Planned (v0.5.0)

**Context:** Current command set covers core PM workflows but lacks "viral" daily-use commands that form habits. Analysis of successful PM tools shows high adoption comes from commands that:
1. Solve an immediate, frequent problem (daily use)
2. Produce shareable, impressive output (social proof)
3. Chain naturally to other commands (workflow lock-in)

**Decision:** Add 4 high-impact "Golden Commands" in v0.5.0:

| Command | Purpose | Viral Factor |
|---------|---------|--------------|
| `/northstar` | Raw idea → structured North Star framework | Clear before/after transformation |
| `/retro` | Meeting notes → structured retro with actions | Daily team use case |
| `/today` | Suggest daily work based on open items | Habit-forming daily trigger |
| `/handover` | Generate vacation handover docs | Solves universal PM pain point |

**Rationale:**
- Each command targets a frequent PM pain point
- Outputs are naturally shareable (impressive transformations)
- Commands chain: `/northstar` → `/prd` → `/prioritize`
- Low complexity to implement (leverage existing agent patterns)

---

### ADR-008: Mermaid Command Skill-Based Refactoring
**Date:** 2025-11-25 | **Status:** Implemented

**Context:** The `/mermaid` command had grown to 556 lines with:
- Complex rendering optimization rules (overlapping prevention, spacing, link styles)
- 7 diagram type syntax examples (Flowchart, Sequence, State, Journey, C4, Gantt, ERD)
- Diagram-specific optimization guidelines (Gantt dates, Flowchart alignment)
- Workflow methodology embedded in command
- Quality checklists and verification steps

This violated single responsibility principle and made maintenance difficult.

**Decision:** Split into skill-based architecture:
1. **Create `skills/mermaid-diagrams/SKILL.md`** (610 lines)
   - All Mermaid syntax reference (7 diagram types)
   - Complete optimization rules and best practices
   - Common pitfalls and fixes
   - Quality checklists
   - Reusable educational content

2. **Update `agents/rapid-prototyper.md`** (+144 lines)
   - Add Mermaid workflow methodology section
   - 4-phase process (Analysis → Content Extraction → Creation → Validation)
   - Reference skill for syntax/rules
   - Verification checkpoints at each phase

3. **Simplify `commands/mermaid.md`** (556 → 113 lines, -79%)
   - Lightweight entry point
   - Delegates to rapid-prototyper agent
   - References skill for comprehensive rules
   - Maintains "Next Steps" for command chaining

**Architecture Pattern:**
```
Before (Monolithic):
┌────────────────────┐
│ commands/mermaid.md│ (556 lines)
│ - Syntax           │
│ - Rules            │
│ - Workflow         │
│ - Quality checks   │
└────────────────────┘

After (Skill-Based):
┌────────────────┐     ┌────────────────────┐     ┌──────────────────┐
│ commands/      │     │ skills/            │     │ agents/          │
│ mermaid.md     │────>│ mermaid-diagrams/  │<────│ rapid-prototyper │
│ (113 lines)    │     │ SKILL.md           │     │ (+144 lines)     │
│ Entry point    │     │ (610 lines)        │     │ Workflow         │
└────────────────┘     │ Syntax & Rules     │     └──────────────────┘
                       └────────────────────┘
```

**Benefits:**
1. **Separation of Concerns:**
   - Command: What to do (entry point)
   - Skill: How to do it (knowledge base)
   - Agent: Execution (systematic workflow)

2. **Reusability:**
   - Mermaid syntax/rules available to ALL agents (not locked to `/mermaid`)
   - Skill can be referenced in custom workflows
   - Follows established `ascii-diagrams` skill pattern

3. **Maintainability:**
   - Update syntax in ONE place (skill)
   - Add new diagram types easily
   - Clear ownership per component

4. **Consistency:**
   - Matches existing skill architecture pattern
   - Professional skill-based design
   - Follows PM-Kit architecture guidelines

**Migration Impact:**
- **No breaking changes**: `/mermaid` command works identically
- **Improved quality**: Better diagram optimization through systematic workflow
- **Better access**: Mermaid knowledge available across all conversations

**Rationale:**
- Commands should be lightweight entry points, not 500+ line monoliths
- Educational content belongs in skills (reusable knowledge)
- Workflow methodology belongs in agents (execution logic)
- Follows established architecture patterns (ascii-diagrams precedent)
- Makes PM-Kit more maintainable and scalable

---

### ADR-009: Excalidraw Intelligent Auto-Detection & Template System
**Date:** 2025-11-25 | **Status:** Implemented

**Context:** The `/excalidraw` command existed but lacked flexibility:
- No automatic diagram type detection (users had to specify type manually)
- Single flowchart template only
- No complexity analysis or breakdown suggestions
- Limited to basic flowcharts, missing mind maps, architecture, timelines, wireframes
- No keyword synonym support (users had to know exact terms)

This created friction where users said "visualize my thinking" and got flowcharts instead of mind maps.

**Decision:** Implement intelligent auto-detection with comprehensive template system:

1. **Auto-Type Detection System**
   - Keyword mapping table for 8 diagram types
   - Synonym expansion (brainstorm, ideation, explore → mind map)
   - Detection priority rules (specific > general, complexity indicators)
   - Default fallbacks for ambiguous cases

2. **Template Library** (`skills/excalidraw-skill/assets/`)
   - `templates.json` - Metadata for all templates (9 templates)
   - **Mind Maps**: `mindmap-basic.excalidraw.json` (4 branches)
   - **Architecture**: `architecture-3tier.excalidraw.json` (Frontend/Backend/Database)
   - **Timelines**: `timeline-horizontal.excalidraw.json` (Q1-Q4 milestones)
   - Template metadata includes keywords, complexity, use cases, best-for scenarios

3. **Complexity Analysis**
   - Thresholds: >20 elements, >4 connections/node, >2000px canvas
   - Auto-detect when diagrams would be too complex
   - Suggest 3 breakdown options (split, overview+detail, simplify)
   - 5 breakdown strategies (layer, phase, component, journey, time)

4. **Comprehensive Skill Documentation** (`skills/excalidraw-skill/SKILL.md` +280 lines)
   - 5 detailed diagram patterns with layouts, color schemes, examples
   - Auto-detection rules and synonym mapping
   - Complexity thresholds and detection logic
   - Progressive disclosure pattern for complex systems
   - Best practices per diagram type

5. **Enhanced Command Workflow** (`commands/excalidraw.md` +100 lines)
   - Phase 1: Auto-detection & complexity analysis
   - Phase 2: Template selection & customization
   - Phase 3: JSON generation with quality checks
   - Phase 4: Complexity management with breakdown suggestions

**User Experience Transformation:**

| User Input | Before | After |
|------------|--------|-------|
| "visualize my thinking about AI" | Generic flowchart | ✅ Mind map (auto-detected) |
| "show user flow for checkout" | Manual type selection | ✅ Flowchart (auto-detected) |
| "diagram our microservices" | Basic architecture | ✅ Microservices template (auto-detected) |
| "Q1-Q4 roadmap" | No template | ✅ Timeline with milestones (auto-detected) |
| Complex system (35+ elements) | Creates messy diagram | ✅ Suggests breakdown into 3 diagrams |

**Architecture Pattern:**
```
User Input: "visualize my thinking about AI strategy"
     ↓
Auto-Detection: Keywords "thinking" → Mind Map
     ↓
Template Selection: mindmap-basic.excalidraw.json
     ↓
Complexity Check: Estimate 8-12 elements → OK (< 20 threshold)
     ↓
Customization: Adapt template branches to AI strategy topics
     ↓
Output: Mind map with central "AI Strategy" node + 4 themed branches
```

**Benefits:**

1. **User-Friendly:**
   - Natural language input ("thinking" → mind map, "flow" → flowchart)
   - No need to know diagram type names
   - Synonym support handles varied vocabulary

2. **Quality Outputs:**
   - Templates provide professional layouts and color schemes
   - Complexity analysis prevents overwhelming diagrams
   - Breakdown suggestions maintain usability

3. **Comprehensive Coverage:**
   - 5 diagram types vs. 1 before (500% increase)
   - 9 templates vs. 1 before
   - All common PM visualization needs covered

4. **Maintainable:**
   - Metadata-driven template selection
   - Easy to add new templates (just add to templates.json)
   - Clear separation: detection → selection → customization

**Metrics:**

| Metric | Before | After | Improvement |
|--------|--------|-------|-------------|
| Diagram types supported | 1 (flowchart) | 5 (flow, mind map, arch, timeline, wireframe) | 400% |
| Templates available | 1 | 9 | 800% |
| Manual type selection required | Yes | No (auto-detect) | 100% reduction |
| Complexity warnings | None | Yes (>20 elements) | ∞ |
| Keyword synonyms supported | 0 | 25+ | ∞ |

**Rationale:**
- PMs shouldn't need to know diagram type terminology
- Natural language ("thinking", "flow", "architecture") should just work
- Template-based approach ensures consistent, professional output
- Complexity analysis prevents unusable diagrams
- Metadata system makes adding new types trivial
- Follows successful pattern from `/research` auto-detection (ADR-003)

**Implementation:**
- 4 new files created (templates.json + 3 templates)
- `excalidraw-skill` SKILL.md enhanced (+280 lines)
- `/excalidraw` command enhanced (+100 lines)
- `rapid-prototyper` agent updated with new capabilities

---

## Current Status

**Version:** 0.5.0
**Released:** 2025-11-24
**Distribution:** Claude Code Plugin
**Install:** `/plugin install kv0906/pm-kit`

### Component Counts
| Component | Active | Deprecated | Total |
|-----------|--------|------------|-------|
| Commands | 21 | 3 | 24 |
| Agents | 14 | 1 | 15 |
| Templates | 4 | 0 | 4 |
| Skills | 6 | 0 | 6 |

> **Note:** Distributed as Claude Code plugin (v0.4.0+). Workflows embedded in agents.

### Active Commands by Category

**Discovery:**
- `/pm` - Help choosing the right command
- `/decompose` - Problem decomposition
- `/research` - Comprehensive research (all types)

**Definition:**
- `/prd` - Product Requirements Document
- `/mermaid` - Visual diagrams (flows, architecture, Gantt, ERD)
- `/ascii` - Text-based diagrams (universal compatibility)
- `/wireframe` - ASCII wireframes for UI screens
- `/excalidraw` - Hand-drawn style diagrams (presentations)
- `/design-spec` - Design handoff specs
- `/northstar` - North Star framework from raw ideas

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

**Daily Operations (v0.5.0):**
- `/retro` - Meeting notes to structured retrospectives
- `/today` - Daily work suggestions
- `/handover` - Vacation handover documentation

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

### v0.5.0 - Golden Commands (Released)
**Theme:** High-impact "viral" commands for daily PM workflows

#### New Commands
- [x] `/northstar` - Generate North Star framework from raw ideas (Problem → Vision → Target → Constraints → Bets)
- [x] `/retro` - Transform meeting notes into structured retros with actions/owners
- [x] `/today` - Daily work suggestions based on open PRDs/decisions
- [x] `/handover` - Generate vacation handover docs with open tasks and owners

#### Enhancements
- [x] Add "Next Steps" suggestions to all 20 commands (20/20 complete)
- [ ] Add screenshots/GIFs to README for onboarding

### v0.6.0 - Templates & Tools (Planned)
**Theme:** Expand template library and add utility commands

#### New Templates
- [ ] `prd-mobile-feature.md` - Mobile feature PRD template
- [ ] `prd-platform.md` - Platform PRD template
- [ ] `prd-growth-experiment.md` - Growth experiment template
- [ ] `decision-build-vs-buy.md` - Build vs buy decision template

#### New Commands
- [ ] `/template [type]` - Browse and apply templates
- [ ] `/skill [topic]` - Interactive skill browser
- [ ] `/share` - Format output for X/Twitter/LinkedIn sharing

#### Enhancements
- [x] `/wireframe` - Add Excalidraw JSON output option (implemented as `/excalidraw`)
- [x] `/mermaid` - Add Gantt chart subtype (completed)
- [ ] `/prd-fast`, `/research-fast` - Lightweight variants for quick outputs

### v0.7.0 - Community & Polish (Planned)
**Theme:** Community growth and documentation polish

- [ ] Update CONTRIBUTING.md paths (`.claude/` → root level)
- [ ] Submit to Claude Code plugin directories
- [ ] Add plugin badges to README
- [ ] Document testing of zero-install flow
- [ ] Community contribution showcase

### v1.0.0 - Stable Release (Future)
- [ ] Comprehensive documentation
- [ ] Battle-tested workflows (6+ months of usage)
- [ ] Community contributions incorporated
- [ ] Plugin marketplace verification
- [ ] All commands have "Next Steps" guidance

### Future Considerations
- Localization (non-English support)
- Industry-specific command variants (B2B, B2C, Platform)
- Custom command creation guide
- Agent orchestration (multi-agent collaboration)
- `/competitive` - Competitive analysis command
- `/gtm` - Go-to-market planning command
- Integration templates for common tools (Jira, Linear, Notion)

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
| Installation | `npm install -g pm-kit-cli` | `/plugin install kv0906/pm-kit` |
| Directory structure | `.claude/` subdirectories | Root-level plugin standard |
| Skills format | Individual `.md` files | `SKILL.md` in directories |

**What was done:**
1. Created `.claude-plugin/plugin.json` manifest
2. Created `.claude-plugin/marketplace.json` for pm-kit marketplace
3. Moved `commands/`, `agents/`, `templates/` to root level
4. Converted skills to `skills/[name]/SKILL.md` format
5. Removed `archived-workflows/` (workflows embedded in agents)
6. Updated all documentation with plugin installation instructions
7. Renamed project from "ClaudeKit PM" to "PM-Kit"

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
| New helpful commands | 0 | 2 (`/pm`, `/ascii`) |
| Commands with next-step guidance | 0 | 5 |
| Mental model concepts | 4 | 2 |

**What was done:**
1. Created `/pm` help command for guided selection
2. Created `/ascii` command (promoted from skill, originally `/diagram`)
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
| 2025-11-24 | Convert ascii-diagrams skill to `/ascii` command | Commands for doing, skills for learning | ADR-004 |
| 2025-11-25 | Consolidate diagram commands | Eliminate confusion: `/mockup`→`/wireframe`, `/flow`→`/mermaid`, `/diagram`→`/ascii` | ADR-007 |
| 2025-11-24 | Align with Claude Code subagent patterns | Simpler architecture, better auto-delegation | ADR-005 |
| 2025-11-24 | Embed workflows into agents | Single-file agents, easier maintenance | ADR-005 |
| 2025-11-24 | Use `$ARGUMENTS` placeholder | Claude Code standard syntax | ADR-005 |
| 2025-11-24 | Convert to Claude Code plugin | Native integration, marketplace distribution | ADR-006 |
| 2025-11-24 | Restructure to plugin standard directories | Standard plugin layout, auto-discovery | ADR-006 |
| 2025-11-24 | Convert skills to SKILL.md format | Plugin skill discovery requirement | ADR-006 |
| 2025-11-24 | Remove archived-workflows | Workflows embedded in agents, cleaner plugin | ADR-006 |
| 2025-11-24 | Rename to PM-Kit | Simpler, cleaner branding | ADR-006 |
| 2025-11-24 | Root-level documentation files | Simpler than docs/ folder for markdown-only repo | - |
| 2025-11-25 | Split `/mermaid` into skill-based architecture | Reusability, maintainability, separation of concerns | ADR-008 |
| 2025-11-25 | Excalidraw intelligent auto-detection | Natural language UX, template-based quality, complexity analysis | ADR-009 |
| 2025-11-24 | Add "Golden Commands" for v0.5.0 | Viral daily-use commands for adoption | ADR-007 |
| 2025-11-24 | `/northstar` for idea-to-framework | Clear before/after transformation | ADR-007 |
| 2025-11-24 | `/retro` for meeting-to-actions | Daily team use case | ADR-007 |
| 2025-11-24 | `/today` for daily suggestions | Habit-forming trigger | ADR-007 |
| 2025-11-24 | `/handover` for vacation docs | Universal PM pain point | ADR-007 |

---

## Contributing to This Document

This PLAN.md serves as the project's living knowledge base. When making changes:

1. **Adding ADRs**: Use the ADR-XXX format with Date, Status, Context, Decision, Rationale
2. **Updating Roadmap**: Move completed items to "Completed Initiatives"
3. **Decision Log**: Record significant decisions with date and rationale
4. **Status Updates**: Keep component counts current after releases

See [CONTRIBUTING.md](CONTRIBUTING.md) for full contribution guidelines.
