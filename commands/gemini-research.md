---
description: Research with Gemini grounded search - real-time web results with citations
---

# Gemini Research Command

Conduct research with real-time web search and citations:

**Research Topic**: $ARGUMENTS

## Gemini Grounded Search

First, load the Gemini search capability:

```
Skill("pm:gemini-grounded-search")
```

## Available Tools

Use these MCP tools for research:

| Tool | Purpose |
|------|---------|
| `mcp__gemini-grounding__search_with_grounding` | General web search with citations |
| `mcp__gemini-grounding__search_developer_resources` | Developer docs, APIs, frameworks |
| `mcp__gemini-grounding__search_reddit` | Reddit discussions and community insights |
| `mcp__gemini-grounding__search_documentation` | Official documentation search |

## Instructions

Use the **Research Agent** methodology with Gemini tools:

1. **Research Planning** - Define objectives, identify sources
2. **Data Collection** - Use Gemini tools above (NOT WebSearch)
3. **Analysis & Synthesis** - Cross-source synthesis with citations
4. **Documentation** - Report with source attribution

## Output

Save report to: `./outputs/research-reports/[topic]-gemini-[date].md`

## Report Structure

- Executive Summary with confidence score
- Research Objectives
- Methodology (note: Gemini grounded search)
- Key Findings with **source citations**
- Cross-Source Synthesis
- Recommendations
- Knowledge Gaps
- Next Steps

---

## Next Steps

| Next Action | Command | When to Use |
|-------------|---------|-------------|
| Standard research | `/research` | When citations not needed |
| Build consensus | `/consensus` | Share findings with stakeholders |
| Make decision | `/decide` | Use research to inform choice |
| Create matrix | `/matrix` | Compare options systematically |

---

Begin research using Gemini grounded search.
