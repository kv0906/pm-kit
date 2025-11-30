# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

---

## Project Overview

PM-Kit is a Product Management framework plugin for Claude Code implementing Long Chain-of-Thought methodology. This is a **Claude Code plugin** containing markdown files (commands, agents, skills, templates) that users install via the plugin system.

## Repository Structure

```
cc-pmkt/                             # Marketplace root
├── .claude/
│   └── commands/                    # Interactive lessons (/start-mkt, /help-mkt)
├── .claude-plugin/
│   └── marketplace.json             # Marketplace definition (points to plugins)
├── plugins/
│   ├── pm/                          # Product Management plugin
│   │   ├── .claude-plugin/
│   │   │   └── plugin.json          # Plugin manifest
│   │   ├── commands/     (23)       # Slash commands (/prd, /decompose, /mermaid, etc.)
│   │   ├── agents/       (14)       # Specialized agents with embedded workflows
│   │   ├── skills/       (7)        # Technical literacy modules (SKILL.md format)
│   │   └── templates/    (4)        # Reusable output templates
│   ├── cm/                          # Compounding Marketing plugin
│   │   ├── plugin.json
│   │   ├── commands/     (1)        # /cm:plan
│   │   ├── agents/       (6)        # Brand, conversion, SEO, persona reviewers
│   │   └── templates/    (3)        # Campaign brief, email sequence, content calendar
│   └── cf/                          # Content Factory plugin
│       ├── plugin.json
│       ├── commands/     (3)        # /cf:generate, /cf:repurpose, /cf:schedule
│       └── templates/    (3)        # Blog, social media, video script templates
├── exercises/
│   └── markit/                      # Marketing practice workspace
│       ├── campaigns/               # Campaign briefs
│       ├── content/                 # Generated content
│       ├── brand/                   # Brand guidelines
│       └── templates/               # Reusable templates
├── CLAUDE.md                        # This file - primary routing
├── PLAN.md                          # Project knowledge base
└── README.md                        # Marketplace overview
```

**No code to build/test** - This repo contains only markdown framework files.

---

## Philosophy: PO-OS (Product Operating System)

PM-Kit implements the **Product Operating System (PO-OS)** philosophy. This is not a tool collection—it's an identity transformation system.

**Core Identity**: PM → CEO with engineering superpowers

**Operating Principles** (see `MANIFESTO.md` for full philosophy):
1. **PMs think, not administrate** - Systematic work is automated
2. **Decisions are evidence-based** - Every choice grounded in data
3. **Repetitive work is beneath creativity** - Automate mechanics, amplify insight
4. **Every PM becomes technical** - Engineering literacy is a superpower
5. **AI amplifies judgment** - System provides structure, human provides strategy
6. **Flow state is sacred** - One command = complete execution

**Language Patterns for All Agents:**
- ❌ NOT: "help you write", "assist with", "support", "generate for"
- ✅ YES: "execute your vision through", "command systematic", "orchestrate multi-phase"
- ❌ NOT: Service tone ("I will help you...")
- ✅ YES: CEO enablement tone ("You are not writing—you are **commanding**...")

**Agent Tone Requirement:**
- Agents should empower users as **CEOs commanding systems**, not serve them as assistants completing tasks
- Users **architect and direct**, agents **execute and validate**
- Language emphasizes **scaling expertise**, not providing assistance

**All agents MUST include** a philosophy preamble after YAML frontmatter:
```markdown
> **Operating under PO-OS principles** (see `MANIFESTO.md` for philosophy):
> [Agent-specific empowerment statement]
```

---

## For Users: Simple Mental Model

PMs should think of this framework as providing two things:

| Type | Purpose | How to Use |
|------|---------|------------|
| **Commands** | Produce deliverables | Type `/command` in Claude |
| **Skills** | Learn concepts | Automatically loaded by plugin |

Everything else (agents) happens automatically under the hood.

---

## Core Commands

Commands are defined in `plugins/pm/commands/`. Active commands:

### Discovery & Help
| Command | Purpose |
|---------|---------|
| `/pm:start` | Help choosing the right command |
| `/template` | Browse and apply PM-Kit templates |
| `/learn` | Interactive skill browser |
| `/decompose` | Systematic problem decomposition |
| `/research` | Comprehensive research (all types) |

### Definition
| Command | Purpose |
|---------|---------|
| `/prd` | Generate comprehensive PRD |
| `/mermaid` | Visual diagrams (flows, architecture, Gantt, ERD) |
| `/ascii` | Text-based diagrams (universal compatibility) |
| `/wireframe` | ASCII wireframes for UI screens |
| `/excalidraw` | Hand-drawn style diagrams (presentations) |
| `/design-spec` | Design handoff specifications |
| `/northstar` | North Star framework from raw ideas |

### Decision
| Command | Purpose |
|---------|---------|
| `/prioritize` | Apply RICE, ICE, Kano frameworks |
| `/decide` | Quick decision framework |
| `/matrix` | Generate comparison matrices |
| `/consensus` | Build stakeholder alignment |

### Communication
| Command | Purpose |
|---------|---------|
| `/strategy` | Strategic planning documents |
| `/architecture` | PM-friendly architecture docs |
| `/explain-code` | Translate code for PMs |
| `/tech-impact` | Technical feasibility assessment |

### Daily Operations
| Command | Purpose |
|---------|---------|
| `/retro` | Meeting notes to structured retrospectives |
| `/today` | Daily work suggestions |
| `/handover` | Vacation handover documentation |

---

## Marketing Plugins (v0.8.0+)

PM-Kit now includes **marketing workflow plugins** with compounding intelligence. Each campaign makes the next one faster through accumulated patterns, templates, and insights.

### Available Plugins

| Plugin | Commands | Purpose |
|--------|----------|---------|
| **CM** | `/cm:plan` | Compounding Marketing - Campaign planning |
| **CF** | `/cf:generate`, `/cf:repurpose`, `/cf:schedule` | Content Factory - Batch content generation |

### Marketing Commands

#### CM: Compounding Marketing
| Command | Purpose |
|---------|---------|
| `/cm:plan` | Create comprehensive campaign briefs with compounding intelligence |

#### CF: Content Factory
| Command | Purpose |
|---------|---------|
| `/cf:generate` | Batch content creation across blog, email, social, video |
| `/cf:repurpose` | Transform one piece into many formats |
| `/cf:schedule` | Create and organize content calendars |

### Marketing Agents

Specialized reviewers in `plugins/cm/agents/`:

| Agent | Purpose | Model | Parallelizable |
|-------|---------|-------|----------------|
| `brand-voice-guardian` | Brand consistency validation | sonnet | ✅ |
| `conversion-optimizer` | Conversion rate optimization | sonnet | ✅ |
| `seo-specialist` | SEO optimization | sonnet | ✅ |
| `startup-sam-reviewer` | Founder persona feedback | sonnet | ✅ |
| `manager-maria-reviewer` | Manager persona feedback | sonnet | ✅ |
| `solo-steve-reviewer` | Solopreneur persona feedback | sonnet | ✅ |

**All marketing agents** follow PO-OS principles and can run in parallel for multi-perspective feedback.

### Marketing Workspace

Practice workspace: `exercises/markit/` (Markit agency working for client Planerio)

```
markit/
├── campaigns/          # Campaign briefs (/cm:plan)
├── content/           # Generated content (/cf:generate)
│   ├── blog/
│   ├── email/
│   ├── social/
│   └── ads/
├── brand/             # Brand guidelines, personas
├── research/          # Competitive analysis
├── analytics/         # Performance data, patterns
└── templates/         # Reusable templates (compounding!)
```

### Compounding Intelligence

The marketing plugins implement **compounding efficiency**:
- **Campaign 1**: 40 hours - Build foundation
- **Campaign 5**: 15 hours - Leverage patterns (62% faster)
- **Campaign 10**: 10 hours - Systematized (75% faster)

Each campaign accumulates:
- ✅ Templates that evolve
- ✅ Patterns from successful campaigns
- ✅ Performance insights
- ✅ Automated workflows

### Quick Start

```bash
# 1. Start marketing course
/start-mkt

# 2. Plan campaign
/cm:plan "Q1 Product Launch" --budget 50000 --duration "6 weeks"

# 3. Generate content
/cf:generate "Q1 Launch" --formats "blog,email,social"

# 4. Review with agents
@brand-voice-guardian Review this content
@seo-specialist Optimize for "team productivity"
```

**Help**: Type `/help-mkt` for full marketing command reference.

---

## Agent Design Principles (v0.7.0+)

**Important:** All agents follow strict design principles for optimal performance:

1. **Input-First Execution**: Agents work from `$ARGUMENTS` user input, not file exploration
2. **Tool Minimalism**: Most agents use `Write` only (exceptions: research-agent)
3. **No Speculative File Search**: Agents never search files without explicit user request
4. **Explicit Over Implicit**: When context missing, agents prompt user instead of searching
5. **Subagent Architecture**: All agents now include standardized YAML fields (mode, parallelizable, context_isolation, tool_rationale)
6. **Model Optimization**: Haiku model for fast, deterministic tasks (daily-planner, rapid-prototyper)

**Performance Impact:**
- 50-60% reduction in token usage
- 40-50% faster execution time
- Predictable, consistent behavior
- Clear tool usage justification

**New YAML Fields:**
- `mode`: Execution pattern (sequential/parallel/iterative)
- `parallelizable`: Can run in parallel with other agents (true/false)
- `context_isolation`: Context preservation needs (low/medium/high)
- `tool_rationale`: Explicit justification for tool choices

See `AGENT-DESIGN-PRINCIPLES.md` for complete guidelines.

---

## For Contributors: Architecture

### Claude Code Plugin Pattern (v0.4.0)

This is a standard Claude Code plugin:

```
User types:         Command delegates to:
┌────────┐         ┌────────────────────────────────┐
│ /prd   │ ──────> │ Agent (with embedded workflow) │ ──> Output
└────────┘         └────────────────────────────────┘
```

**Key patterns:**
- Commands use `$ARGUMENTS` placeholder for user input
- Agents have YAML frontmatter: `name`, `description`, `tools`, `model`
- Agent descriptions include "Use PROACTIVELY" for auto-delegation
- Skills use `SKILL.md` format in subdirectories

### Component Roles

1. **Commands** (`plugins/pm/commands/`) - Entry points that users invoke
   - Simple markdown with YAML frontmatter
   - Delegate to agents for execution
   - Include "Next Steps" section for follow-up commands

2. **Agents** (`plugins/pm/agents/`) - Complete execution units
   - YAML frontmatter with `name`, `description`, `tools`, `model`
   - Embedded workflow methodology (15+ steps)
   - Verification checkpoints and quality checklists

3. **Skills** (`plugins/pm/skills/`) - Educational content
   - Each skill in its own subdirectory
   - `SKILL.md` file format for plugin discovery

4. **Templates** (`plugins/pm/templates/`) - Output document formats

### When Creating New Commands
1. Create command file in `plugins/pm/commands/`
2. Add YAML frontmatter with `description` field
3. Use `$ARGUMENTS` for user input placeholder
4. Reference the appropriate agent
5. Include "Next Steps" section at the end
6. Update README.md command tables

### When Creating New Agents
1. Add agent definition to `plugins/pm/agents/`
2. Use YAML frontmatter:
   ```yaml
   ---
   name: agent-name
   description: Description. Use PROACTIVELY when [trigger condition].
   tools: Read, Write, Glob, Grep
   model: sonnet
   ---
   ```
3. Embed the complete workflow methodology in the agent body
4. Include verification checkpoints at each phase
5. Add quality checklist before completion

### When Creating New Skills
1. Create subdirectory in `plugins/pm/skills/` with skill name
2. Create `SKILL.md` file inside
3. Skills are auto-discovered by the plugin system

### Deprecation Policy
When consolidating commands/agents:
1. Add deprecation notice at top of file (don't delete)
2. Include migration guide showing old → new usage
3. Keep legacy documentation below the notice
4. Update CLAUDE.md and README.md to reflect changes

---

## Agents

Specialized agents in `plugins/pm/agents/`:

| Agent | Purpose | Model | Mode | Context Isolation |
|-------|---------|-------|------|-------------------|
| `problem-decomposer.md` | Root cause analysis | sonnet | sequential | medium |
| `prd-writer.md` | Requirements documents | sonnet | sequential | medium |
| `research-agent.md` | Unified research (canonical) | sonnet | parallel | medium |
| `consensus-builder.md` | Stakeholder alignment | sonnet | iterative | medium |
| `prioritization-engine.md` | RICE, ICE, Kano frameworks | sonnet | sequential | medium |
| `matrix-generator.md` | Decision matrices | sonnet | sequential | low |
| `analytics-synthesizer.md` | Data insights | sonnet | sequential | medium |
| `technical-translator.md` | Code translation for PMs | sonnet | sequential | high |
| `rapid-prototyper.md` | ASCII wireframes, Mermaid diagrams | **haiku** | sequential | low |
| `user-researcher.md` | User research synthesis | sonnet | sequential | medium |
| `northstar-architect.md` | North Star framework generation | sonnet | sequential | medium |
| `retro-facilitator.md` | Retrospective facilitation | sonnet | sequential | low |
| `daily-planner.md` | Daily work planning | **haiku** | sequential | low |
| `handover-generator.md` | Handover documentation | sonnet | sequential | low |

**Agent Classifications:**
- **Group A (Input-Focused)**: 12 agents using `Write` only - work from user-provided context
- **Group B (Research)**: 2 agents (`research-agent`, uses Read/Write/Glob/Grep/WebFetch) - exploration allowed when explicitly requested
- **Haiku-optimized**: 2 agents (`rapid-prototyper`, `daily-planner`) - fast, deterministic outputs

---

## Skills

Educational modules in `plugins/pm/skills/`:

| Skill | Purpose |
|-------|---------|
| `api-basics/` | API concepts for PMs |
| `json-fundamentals/` | JSON basics |
| `frontend-prompts/` | Frontend design specs |
| `debug-without-code/` | Debugging strategies |
| `ascii-diagrams/` | ASCII diagram reference |
| `mermaid-diagrams/` | Mermaid syntax, optimization rules, rendering best practices |
| `gemini-grounded-search/` | Real-time web search, code execution via Gemini API |

---

## Templates

Pre-built templates in `plugins/pm/templates/`:
- `consensus-template.md` - Stakeholder alignment
- `decision-matrix.md` - Decision framework
- `evidence-log.md` - Evidence tracking
- `research-matrix.md` - Research organization

---

## Plugin Files

The `.claude-plugin/` directory contains:
- `plugin.json` - Plugin manifest with metadata
- `marketplace.json` - Marketplace definition for distribution

These follow Claude Code plugin specifications and enable installation via `/plugin install`.
- let's update Changelog.md and plan.nd as well always after new feature or update in pm kit
- always update corresponding PLAN.md for appropriate plugins and CHANGELOG.MD as well