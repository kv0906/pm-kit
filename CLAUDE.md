# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

---

## Project Overview

ClaudeKit PM is a Product Management framework implementing Long Chain-of-Thought methodology. This is a **framework-only repository** containing markdown files (workflows, agents, commands, templates, skills) that are distributed via the separate `pm-kit-cli` installer.

## Repository Structure

```
pm-kit/
├── .claude/                      # Core framework files
│   ├── commands/      (19)       # Slash commands (/prd, /decompose, etc.)
│   ├── workflows/     (21)       # Long-form workflow implementations
│   ├── agents/        (11)       # Specialized agent definitions
│   ├── templates/     (4)        # Reusable templates
│   └── skills/        (4)        # Technical literacy modules
├── CLAUDE.md                     # This file - primary routing
├── PLAN.md                       # Optimization roadmap
├── version.json                  # Version tracking and file counts
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

Everything else (agents, workflows) happens automatically under the hood.

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

### How Commands, Agents, and Workflows Relate

```
User types:         Command loads:         Which follows:
┌────────┐         ┌────────────┐         ┌──────────────┐
│ /prd   │ ──────> │ Agent      │ ──────> │ Workflow     │ ──> Output
└────────┘         │ Persona    │         │ Methodology  │
                   └────────────┘         └──────────────┘
```

1. **Commands** (`.claude/commands/`) - Entry points that users invoke
2. **Agents** (`.claude/agents/`) - Persona definitions with capabilities and validation rules
3. **Workflows** (`.claude/workflows/`) - Detailed 15+ step methodologies
4. **Templates** (`.claude/templates/`) - Output document formats
5. **Skills** (`.claude/skills/`) - Educational content (separate from the above chain)

### When Modifying Workflows
1. Edit markdown files in `.claude/workflows/`
2. Maintain 15+ step reasoning chains with verification checkpoints
3. Include backtracking triggers for returning to previous phases
4. Add a "Next Steps" section suggesting follow-up commands

### When Creating New Agents
1. Add agent definitions to `.claude/agents/`
2. Define responsibilities, capabilities, and invocation triggers
3. Include validation and error correction protocols

### When Adding Slash Commands
1. Create command file in `.claude/commands/`
2. Add YAML frontmatter with `description` field
3. Reference appropriate workflow or agent
4. Include "Next Steps" section at the end
5. Update README.md command tables

### Deprecation Policy
When consolidating commands/agents/workflows:
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
