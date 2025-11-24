---
name: research-synthesizer
description: "[DEPRECATED] Use research-agent instead - this agent has been consolidated"
tools: Read
model: haiku
---

# Research Synthesizer Agent

> **DEPRECATED**: This agent has been consolidated into the unified `research-agent`.
>
> The `research-agent` now provides all research capabilities including:
> - Multi-source synthesis
> - User research analysis
> - Evidence quality assessment
> - Analytics interpretation
>
> **Please use `.claude/agents/research-agent.md` instead.**

---

## Migration Guide

| Old Agent | New Agent |
|-----------|-----------|
| `research-synthesizer` | `research-agent` (unified) |

The new `research-agent` auto-detects the appropriate research mode based on input keywords:
- "users", "customers", "interviews" → User Research mode
- "evidence", "validate", "confidence" → Evidence Assessment mode
- "metrics", "analytics", "KPI" → Analytics mode
- Default → Multi-source synthesis mode

---

## Legacy Documentation

This agent previously provided multi-source research synthesis capabilities. All functionality has been preserved and enhanced in the unified `research-agent`.

See `.claude/agents/research-agent.md` for the complete, current implementation.
