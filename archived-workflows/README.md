# Archived Workflows

> **Migration Date**: 2024-11-24
> **Version**: 0.3.0

## Why These Are Archived

As part of the Claude Code alignment (v0.3.0), workflows have been **embedded directly into their respective agents**. This follows Claude Code best practices where:

- Agents contain their complete methodology in a single file
- Commands delegate to agents (simple entry points)
- No separate workflow files needed

## What Happened

| Before | After |
|--------|-------|
| Commands → Agents → Workflows (3 files) | Commands → Agents (2 files) |
| Workflows in separate `.md` files | Methodology embedded in agent |

## Migration Mapping

| Workflow File | Now Embedded In |
|---------------|-----------------|
| `prd-framework.md` | `agents/prd-writer.md` |
| `problem-decomposition.md` | `agents/problem-decomposer.md` |
| `research-core.md` | `agents/research-agent.md` |
| `research-synthesis.md` | `agents/research-agent.md` |
| `user-research-synthesis.md` | `agents/user-researcher.md` |
| `consensus-report.md` | `agents/consensus-builder.md` |
| `feature-prioritization.md` | `agents/prioritization-engine.md` |
| `matrix-generation.md` | `agents/matrix-generator.md` |
| `technical-translation.md` | `agents/technical-translator.md` |
| `rapid-prototyping.md` | `agents/rapid-prototyper.md` |
| `metrics-analytics.md` | `agents/analytics-synthesizer.md` |
| `evidence-based-decision.md` | `agents/research-agent.md` |
| `architecture-documentation.md` | `agents/technical-translator.md` |
| `design-handoff.md` | `agents/rapid-prototyper.md` |
| `strategic-planning.md` | `agents/consensus-builder.md` |
| `stakeholder-management.md` | `agents/consensus-builder.md` |
| `cross-functional.md` | `agents/consensus-builder.md` |
| `risk-assessment.md` | `agents/prd-writer.md` |
| `documentation-standards.md` | Reference material |

## Why Keep These?

These files are preserved for:

1. **Historical Reference** - Understanding original methodology
2. **Detailed Documentation** - Some workflows contain extensive detail not fully embedded
3. **Recovery** - If needed for debugging or rollback

## Do Not Use Directly

These workflows are **not designed to be used directly** anymore. Always use the commands and agents in:

- `.claude/commands/` - User entry points
- `.claude/agents/` - Complete agent definitions with embedded workflows
