---
description: Comprehensive research - multi-source synthesis, user research, evidence assessment, and analytics
---

# Research Command

Conduct comprehensive research on:

**Research Topic**: $ARGUMENTS

## Instructions

Use the **Research Agent** (`.claude/agents/research-agent.md`) to complete this task.

## Research Mode Auto-Detection

The agent will auto-detect the appropriate mode based on your input:

| Keywords in Input | Mode |
|-------------------|------|
| "users", "customers", "personas", "interviews", "surveys" | **User Research** |
| "evidence", "validate", "confidence", "proof", "hypothesis" | **Evidence Assessment** |
| "metrics", "analytics", "KPI", "funnel", "cohort" | **Analytics Research** |
| Default | **Multi-Source Synthesis** |

## Process

The agent will guide you through:
1. **Research Planning** - Define objectives, identify sources, create plan
2. **Data Collection** - Gather and evaluate evidence quality
3. **Analysis & Synthesis** - Cross-source synthesis, pattern recognition
4. **Documentation** - Research report with confidence scores

## Output

Save report to: `./outputs/research-reports/[topic]-report-[date].md`

## Report Structure

Your report should include:
- Executive Summary with confidence score
- Research Objectives
- Methodology and Sources
- Key Findings with evidence
- Cross-Source Synthesis
- Recommendations (prioritized)
- Knowledge Gaps
- Next Steps

---

## Next Steps

After completing research:

| Next Action | Command | When to Use |
|-------------|---------|-------------|
| Build consensus | `/consensus` | Share findings with stakeholders |
| Make decision | `/decide` | Use research to inform choice |
| Create matrix | `/matrix` | Compare options systematically |
| Write PRD | `/prd` | Document requirements from insights |

---

Begin research now.
