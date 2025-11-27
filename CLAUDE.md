# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

---

## Project Overview

PM-Kit is a Product Management framework plugin for Claude Code implementing Long Chain-of-Thought methodology. This is a **Claude Code plugin** containing markdown files (commands, agents, skills, templates) that users install via the plugin system.

## Repository Structure

```
pm-kit/
├── .claude-plugin/
│   ├── plugin.json          # Plugin manifest (required)
│   └── marketplace.json     # Marketplace definition
├── commands/      (23)      # Slash commands (/prd, /decompose, /mermaid, etc.)
├── agents/        (14)      # Specialized agents with embedded workflows
├── skills/        (7)       # Technical literacy modules (SKILL.md format)
├── templates/     (4)       # Reusable output templates
├── CLAUDE.md                # This file - primary routing
├── PLAN.md                  # Project knowledge base
└── README.md                # Plugin overview
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

Commands are defined in `commands/`. Active commands:

### Discovery & Help
| Command | Purpose |
|---------|---------|
| `/pm` | Help choosing the right command |
| `/template` | Browse and apply PM-Kit templates |
| `/skill` | Interactive skill browser |
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

## Agent Design Principles (v0.6.0+)

**Important:** All agents follow strict design principles for optimal performance:

1. **Input-First Execution**: Agents work from `$ARGUMENTS` user input, not file exploration
2. **Tool Minimalism**: Most agents use `Write` only (exceptions: research-agent)
3. **No Speculative File Search**: Agents never search files without explicit user request
4. **Explicit Over Implicit**: When context missing, agents prompt user instead of searching

**Performance Impact:**
- 50-60% reduction in token usage
- 40-50% faster execution time
- Predictable, consistent behavior

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

1. **Commands** (`commands/`) - Entry points that users invoke
   - Simple markdown with YAML frontmatter
   - Delegate to agents for execution
   - Include "Next Steps" section for follow-up commands

2. **Agents** (`agents/`) - Complete execution units
   - YAML frontmatter with `name`, `description`, `tools`, `model`
   - Embedded workflow methodology (15+ steps)
   - Verification checkpoints and quality checklists

3. **Skills** (`skills/`) - Educational content
   - Each skill in its own subdirectory
   - `SKILL.md` file format for plugin discovery

4. **Templates** (`templates/`) - Output document formats

### When Creating New Commands
1. Create command file in `commands/`
2. Add YAML frontmatter with `description` field
3. Use `$ARGUMENTS` for user input placeholder
4. Reference the appropriate agent
5. Include "Next Steps" section at the end
6. Update README.md command tables

### When Creating New Agents
1. Add agent definition to `agents/`
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
1. Create subdirectory in `skills/` with skill name
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

Specialized agents in `agents/`:

| Agent | Purpose |
|-------|---------|
| `problem-decomposer.md` | Root cause analysis |
| `prd-writer.md` | Requirements documents |
| `research-agent.md` | Unified research (canonical) |
| `consensus-builder.md` | Stakeholder alignment |
| `prioritization-engine.md` | RICE, ICE, Kano frameworks |
| `matrix-generator.md` | Decision matrices |
| `analytics-synthesizer.md` | Data insights |
| `technical-translator.md` | Code translation for PMs |
| `rapid-prototyper.md` | ASCII wireframes, Mermaid diagrams |
| `user-researcher.md` | User research synthesis |
| `northstar-architect.md` | North Star framework generation |
| `retro-facilitator.md` | Retrospective facilitation |
| `daily-planner.md` | Daily work planning |
| `handover-generator.md` | Handover documentation |

---

## Skills

Educational modules in `skills/`:

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

Pre-built templates in `templates/`:
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