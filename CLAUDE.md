# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

---

## Project Overview

ClaudeKit PM is a Product Management framework implementing Long Chain-of-Thought methodology. This is a **framework-only repository** containing markdown files (agents, commands, templates, skills) that are distributed via the separate `pm-kit-cli` installer.

## Repository Structure

```
pm-kit/
├── .claude/                      # Core framework files
│   ├── commands/      (19)       # Slash commands (/prd, /decompose, etc.)
│   ├── agents/        (11)       # Specialized agents with embedded workflows
│   ├── templates/     (4)        # Reusable templates
│   ├── skills/        (4)        # Technical literacy modules
│   └── archived-workflows/ (19)  # Legacy workflows (now embedded in agents)
├── CLAUDE.md                     # This file - primary routing
├── PLAN.md                       # Project knowledge base
├── version.json                  # Version tracking
└── README.md                     # Framework overview
```

**No code to build/test** - This repo contains only markdown framework files.

---

## For Users: Simple Mental Model

PMs should think of this framework as providing two things:

| Type | Purpose | How to Use |
|------|---------|------------|
| **Commands** | Produce deliverables | Type `/command` in Claude |
| **Skills** | Learn concepts | Read files in `.claude/skills/` |

Everything else (agents) happens automatically under the hood.

---

## Core Commands

Commands are defined in `.claude/commands/`. Active commands:

### Discovery
| Command | Purpose |
|---------|---------|
| `/pm` | Help choosing the right command |
| `/decompose` | Systematic problem decomposition |
| `/research` | Comprehensive research (all types) |

### Definition
| Command | Purpose |
|---------|---------|
| `/prd` | Generate comprehensive PRD |
| `/flow` | User flow diagrams (Mermaid) |
| `/mockup` | ASCII wireframes |
| `/diagram` | ASCII diagrams (flows, architecture) |
| `/design-spec` | Design handoff specifications |

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

### Deprecated (Still Work, Point to Replacements)
| Command | Replaced By |
|---------|-------------|
| `/research-unified` | `/research` |
| `/evidence` | `/research` (evidence mode) |
| `/synthesize` | `/research` (user research mode) |

---

## For Contributors: Architecture

### Claude Code Alignment (v0.3.0)

This framework follows Claude Code subagent patterns:

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
- Workflows are embedded directly in agent markdown body

### Component Roles

1. **Commands** (`.claude/commands/`) - Entry points that users invoke
   - Simple markdown with YAML frontmatter
   - Delegate to agents for execution
   - Include "Next Steps" section for follow-up commands

2. **Agents** (`.claude/agents/`) - Complete execution units
   - YAML frontmatter with `name`, `description`, `tools`, `model`
   - Embedded workflow methodology (15+ steps)
   - Verification checkpoints and quality checklists

3. **Templates** (`.claude/templates/`) - Output document formats

4. **Skills** (`.claude/skills/`) - Educational content (separate from execution chain)

### When Creating New Commands
1. Create command file in `.claude/commands/`
2. Add YAML frontmatter with `description` field
3. Use `$ARGUMENTS` for user input placeholder
4. Reference the appropriate agent
5. Include "Next Steps" section at the end
6. Update README.md command tables

### When Creating New Agents
1. Add agent definition to `.claude/agents/`
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

### Deprecation Policy
When consolidating commands/agents:
1. Add deprecation notice at top of file (don't delete)
2. Include migration guide showing old → new usage
3. Keep legacy documentation below the notice
4. Update CLAUDE.md and README.md to reflect changes

---

## Agents

Specialized agents in `.claude/agents/`:

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
| `research-synthesizer.md` | **[DEPRECATED]** Use research-agent.md |

---

## Templates

Pre-built templates in `.claude/templates/`:
- `consensus-template.md` - Stakeholder alignment
- `decision-matrix.md` - Decision framework
- `evidence-log.md` - Evidence tracking
- `research-matrix.md` - Research organization

---

## Skills (Technical Literacy)

Modules in `.claude/skills/` for non-technical PMs:
- `json-fundamentals.md` - JSON basics
- `api-basics.md` - API concepts
- `frontend-prompts.md` - Frontend design specs
- `debug-without-code.md` - Debugging strategies

> **Note:** ASCII diagrams is now a command (`/diagram`), not a skill.

---

## Archived Workflows

The `.claude/archived-workflows/` folder contains legacy workflow files that have been embedded into their respective agents as of v0.3.0. These are preserved for:
- Historical reference
- Detailed documentation not fully embedded
- Potential recovery if needed

**Do not use these directly** - always use commands and agents.
