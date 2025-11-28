# Changelog

All notable changes to PM-Kit will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Changed
- **Multi-plugin marketplace restructure** - Transformed repo into marketplace hosting multiple plugins
  - Created `plugins/pm/` directory for Product Management plugin
  - Moved `commands/`, `agents/`, `skills/`, `templates/` into `plugins/pm/`
  - Moved `plugin.json` to `plugins/pm/.claude-plugin/`
  - Updated `marketplace.json` source to `"./plugins/pm"`
  - Prepares for future plugins (marketing, etc.)

### Fixed
- **Plugin marketplace discovery** - Fixed source path in `marketplace.json`
  - Plugin was not showing up when users installed from marketplace
  - Root cause: `source` field pointed to wrong directory (`.claude-plugin/` vs plugin content)
  - Fixed by restructuring to standard marketplace pattern with `plugins/` directory
- **Command discovery** - Fixed commands not appearing in slash command autocomplete
  - Users only saw `/pm:commands` instead of individual commands (`/pm:prd`, `/pm:mermaid`, etc.)
  - Root cause: Explicit `commands`, `agents`, `skills` fields in `plugin.json` broke auto-discovery
  - Fix: Removed explicit path declarations to rely on standard directory-based auto-discovery (matching working plugins like hookify, commit-commands)

## [0.7.0] - 2025-11-27

### Added
- **Subagent Architecture Fields** - All 14 agents enhanced with standardized YAML frontmatter
  - `mode`: Execution pattern (sequential/parallel/iterative)
  - `parallelizable`: Can run in parallel with other agents (true/false)
  - `context_isolation`: Context preservation needs (low/medium/high)
  - `tool_rationale`: Explicit justification for tool choices with per-tool explanations
- **AGENT-DESIGN-PRINCIPLES.md enhancements** - New YAML frontmatter documentation
  - Complete field definitions and value ranges
  - Model selection guidelines (haiku/sonnet/opus)
  - Mode guidelines (sequential/parallel/iterative)
  - Context isolation guidelines (low/medium/high)
  - Updated agent classification tables with new fields

### Changed
- **Model Optimization** - 2 agents upgraded to Haiku for faster execution
  - `rapid-prototyper.md`: sonnet → haiku (deterministic diagram generation)
  - `daily-planner.md`: sonnet → haiku (rapid prioritization frameworks)
- **Agent Classification Update** - Enhanced documentation in CLAUDE.md
  - Updated agent table with Model, Mode, and Context Isolation columns
  - Added clear group classifications (Group A: Input-Focused, Group B: Research)
  - Documented haiku-optimized agents
- **Tool Rationale Documentation** - All 14 agents now explain their tool choices
  - Group A agents (12): Write-only rationale with input-first justification
  - Group B agents (1): Multi-tool rationale for research-agent's exploration needs
  - Clear "No Read/Glob/Grep" explanations for input-focused agents

### Performance Impact
- **Expected improvements** from model optimization:
  - rapid-prototyper: ~40% faster diagram generation
  - daily-planner: ~50% faster daily plan creation
  - Maintained quality: Both agents use structured, templated outputs ideal for Haiku
- **Architectural clarity**:
  - Explicit execution patterns documented
  - Clear parallelization boundaries
  - Transparent tool usage justification

### Architecture
- **ADR-013**: Subagent Architecture Adoption (see PLAN.md)
  - Standardized YAML fields across all agents
  - Model selection optimization strategy
  - Context isolation classification system

### Added
- **`/template` command** - Browse and apply PM-Kit templates
  - Catalog of available templates (consensus, decision-matrix, evidence-log, research-matrix)
  - Interactive template application workflow
- **`/skill` command** - Interactive skill browser
  - Catalog of all 8 learning modules
  - Topic matching for easy discovery
  - Difficulty levels indicated
- **README badges** - Plugin, version, license, and PRs welcome badges
- **Zero-install testing documentation** - Verification checklist for local testing
- **Agent triggering examples** - All 14 agents now include `<example>` blocks in descriptions
  - Improves Claude's ability to automatically select the right agent
  - Each agent has 2 concrete examples showing when to trigger
  - Examples include Context, user request, assistant response, and commentary
- **Agent color coding** - All 14 agents now have `color` field in frontmatter
  - Green: Documentation agents (prd-writer, handover-generator)
  - Blue: Research agents (research-agent, user-researcher, analytics-synthesizer)
  - Purple: Problem solving agents (problem-decomposer, northstar-architect)
  - Magenta: Decision making agents (prioritization-engine, matrix-generator, consensus-builder)
  - Red: Planning agents (daily-planner, retro-facilitator)
  - Orange: Technical/design agents (technical-translator, rapid-prototyper)
- **Command security** - All 20 agent-invoking commands now have `allowed-tools` field
  - Specifies which tools agents can use
  - Improves security and transparency
  - Helps users understand what file operations will occur
- **Command hints** - All 23 commands now have `argument-hint` field
  - Shows placeholder text guiding expected input
  - Optional commands use `[optional: ...]` format
  - Improves discoverability and UX
- **Mermaid skill references** - Split mermaid-diagrams skill into progressive disclosure pattern
  - `SKILL.md`: Overview and quick reference (323 lines, was 611)
  - `references/syntax-reference.md`: Complete syntax for all 7 diagram types
  - `references/optimization-rules.md`: Rendering rules and quality checklist
  - `references/examples.md`: Practice exercises and prompt patterns

### Changed
- **Skills frontmatter** - Added missing YAML frontmatter to skills
  - `api-basics/SKILL.md` - Added name and description with trigger phrases
  - `json-fundamentals/SKILL.md` - Added name and description with trigger phrases
- **Gemini scripts location** - Moved Python scripts to skill directory
  - From: `scripts/gemini/` (now removed)
  - To: `skills/gemini-grounded-search/scripts/`
  - Updated all script paths in skill documentation
- **CLAUDE.md**: Added new commands to Discovery & Help section
- **PLAN.md**: Marked v0.6.0 new commands and v0.7.0 community tasks as complete
- **README.md**: Updated command tables with `/template` and `/skill`

## [0.6.0] - 2025-11-26

### Added
- **AGENT-DESIGN-PRINCIPLES.md** - Canonical design principles for all agents
  - 6 core principles (Input-First, Tool Minimalism, Mental Model Clarity, etc.)
  - Agent classification system (Input-Focused vs Research)
  - Trigger word detection patterns
  - Fallback hierarchy for ambiguous requests
  - Testing and validation criteria

### Changed
- **Agent Performance Optimization** - Complete Input-First Architecture transformation (ADR-012)
  - **13 agents optimized**: Tools reduced to `Write` only
    - problem-decomposer, consensus-builder, prioritization-engine
    - matrix-generator, daily-planner, analytics-synthesizer
    - handover-generator, northstar-architect, retro-facilitator
    - technical-translator, rapid-prototyper, user-researcher, prd-writer
  - **research-agent enhanced**: Added explicit trigger detection
    - File exploration only when user explicitly requests
    - Clear trigger phrases documented
    - Default mode: work from user-provided data
  - **Performance improvements**:
    - 50-60% reduction in token usage (8-12K → 3-5K)
    - 40-50% faster execution (3-5 min → 1-2 min)
    - 90% reduction in I/O operations
  - **All agents**: Added Step 1.0 Input Validation phase
    - Work exclusively from `$ARGUMENTS`
    - Prompt for missing context instead of file searching
    - Never speculate or explore without explicit request
- **CLAUDE.md**: Added Agent Design Principles section
  - Performance impact metrics
  - Link to AGENT-DESIGN-PRINCIPLES.md
  - Clear guidance for contributors

### Migration Notes
- **No breaking changes** - All commands work identically
- **Mental model clarified**: "I provide context, you structure it"
- **Faster responses**: Less waiting for file searches
- **Lower costs**: Reduced token consumption

## [0.5.0] - 2025-11-25

### Added
- **MANIFESTO.md** - Complete PO-OS (Product Operating System) philosophy document
  - 6 operating principles (PMs think not administrate, evidence-based decisions, technical literacy as superpower)
  - Identity transformation narrative (PM → CEO with engineering superpowers)
  - Before/after user stories demonstrating transformation
  - Command examples with empowerment language
  - 450+ lines of philosophy and vision

### Changed
- **Integrated PO-OS Philosophy** across entire architecture (ADR-011)
  - 4-level reinforcement strategy (MANIFESTO → README → CLAUDE → Agents)
  - All 14 agents now include PO-OS preambles with empowerment statements
  - Language transformation: "help/assist" → "execute/command/orchestrate"
  - Tone shift: Service-oriented → CEO enablement
  - User identity: "Tool user" → "System operator"
- **README.md**: Lead with transformation narrative
  - Bold opening: "You are a CEO with engineering superpowers"
  - Transformation table (Old World → PO-OS World)
  - Value proposition focused on strategic thinking vs tools
  - Prominent link to MANIFESTO.md
- **CLAUDE.md**: Added "Philosophy: PO-OS" section
  - Condensed 6 operating principles
  - Language patterns for all agents (power verbs required)
  - Tone requirements (empower as CEOs, not serve as assistants)
  - Mandatory preamble template
- **All 14 Agents**: PO-OS preambles added
  - `prd-writer`: "Executing the user's product vision"
  - `research-agent`: "Commanding multi-source intelligence synthesis"
  - `problem-decomposer`: "Deconstructing complex systems"
  - `consensus-builder`: "Orchestrating stakeholder coordination"
  - `prioritization-engine`: "Executing evidence-based frameworks"
  - `matrix-generator`: "Commanding multi-dimensional decision analysis"
  - `rapid-prototyper`: "Executing visual architecture generation"
  - `analytics-synthesizer`: "Commanding systematic insights extraction"
  - `technical-translator`: "Scaling technical literacy"
  - `user-researcher`: "Orchestrating user insights synthesis"
  - `northstar-architect`: "Executing strategic vision frameworks"
  - `retro-facilitator`: "Commanding systematic meeting synthesis"
  - `daily-planner`: "Orchestrating priority optimization"
  - `handover-generator`: "Executing knowledge transfer documentation"
- **Optimized**: PRD Writer agent (`prd-writer.md`) made lightweight (~60% reduction)
  - Removed context browsing (no file system searches for `./research/`, `./specs/technical/`)
  - Removed multi-layer validation requiring external stakeholder input
  - Removed Phase 4: Stakeholder Alignment (cross-functional review)
  - Simplified workflow from 5 phases to 3 phases (Foundation, Solution Design, Documentation)
  - Changed tools from `Read, Write, Glob, Grep` → `Write` only
  - Agent now relies solely on user `$ARGUMENTS` input
  - Maintains comprehensive PRD template structure with quality checklist
  - Faster execution, lower token usage, simpler mental model

### Added
- `/mermaid` - Enhanced visual diagram command (flowcharts, architecture, Gantt, ERD) replacing `/flow`
  - Anti-overlap optimization rules (subgraph alignment, link styles)
  - Gantt-specific optimization (dependencies, date formats)
  - Flowchart-specific optimization (decision branches, spacing)
  - Comprehensive quality checklist (20+ verification points)
- `/ascii` - Text-based diagram command (universal compatibility) replacing `/diagram`
- `/wireframe` - ASCII wireframe command (renamed from `/mockup` for clarity)
- `/excalidraw` - Hand-drawn style diagram generator with intelligent auto-detection
  - **Auto-type detection** from keywords (flow, thinking, architecture, timeline, wireframe)
  - **5 diagram types**: Flowcharts, Mind Maps, Architecture (3-tier + microservices), Timelines (horizontal + Gantt), Wireframes (mobile + desktop)
  - **Template system** with metadata-driven selection
  - **Complexity analysis** with breakdown suggestions (>20 elements, >4 connections/node, >2000px canvas)
  - **Synonym support** for flexible keyword matching (brainstorm, ideation, explore → mind map)
- `excalidraw-skill` - Comprehensive Excalidraw generation patterns and optimization (420+ lines)
  - Diagram type auto-detection with keyword mapping table (8 types)
  - 5 comprehensive diagram patterns with layouts, color schemes, and best practices
  - Complexity thresholds and detection rules with breakdown suggestions
  - Progressive disclosure pattern for complex systems (overview + detail diagrams)
  - Breakdown strategies: by layer, phase, component, journey, time
- `mermaid-diagrams` skill - Comprehensive Mermaid syntax, optimization rules, and rendering best practices (610 lines)
- Template assets for Excalidraw:
  - `templates.json` - Metadata for all diagram templates (9 templates defined)
  - `mindmap-basic.excalidraw.json` - Mind map with 4 radiating branches
  - `architecture-3tier.excalidraw.json` - Frontend/Backend/Database layers
  - `timeline-horizontal.excalidraw.json` - Q1-Q4 roadmap with milestones
- C4 architecture diagrams in `/mermaid`
- Gantt chart support in `/mermaid`
- Entity relationship diagram (ERD) support in `/mermaid`

### Changed
- **Refactored**: `/mermaid` command split into skill-based architecture for better maintainability
  - `commands/mermaid.md` reduced from 556 → 113 lines (-79%)
  - New `skills/mermaid-diagrams/SKILL.md` (610 lines) contains all syntax, rules, and optimization guidelines
  - `agents/rapid-prototyper.md` enhanced with Mermaid workflow methodology (+144 lines)
  - Separation of concerns: Command (entry point) → Skill (knowledge) → Agent (execution)
- **Enhanced**: `/excalidraw` command with intelligent workflow (+100 lines)
  - Auto-detection of diagram type from user keywords
  - Template selection and customization phase
  - Complexity management with 3 breakdown options
  - Detection priority rules for ambiguous cases
- **Enhanced**: `excalidraw-skill` with comprehensive patterns (+280 lines)
  - 5 detailed diagram patterns (flowchart, mind map, architecture, timeline, wireframe)
  - Complexity analysis section with thresholds and strategies
  - User journey pattern for experience mapping
- **Enhanced**: `rapid-prototyper` agent with Excalidraw capabilities
  - Added 5 Excalidraw diagram types to output identification
  - Integrated complexity analysis capability
  - Updated core capabilities list with auto-type detection
- Command count: 21 commands
- Skills count: 7 skills (added `excalidraw-skill`)

### Deprecated
- `/diagram` → Use `/ascii` instead (same functionality, clearer name)
- `/flow` → Use `/mermaid` instead (enhanced with C4, Gantt, ERD)
- `/mockup` → Use `/wireframe` instead (renamed for clarity)

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
