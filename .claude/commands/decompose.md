---
description: Systematically decompose complex product problems into manageable components
---

# Problem Decomposition Command

Break down the following problem using first principles thinking:

**Problem Statement**: $ARGUMENTS

## Instructions

Use the **Problem Decomposer Agent** (`.claude/agents/problem-decomposer.md`) to complete this task.

The agent will guide you through:
1. **Initial Analysis** - Clarify problem, map stakeholders, identify constraints
2. **Systematic Decomposition** - First principles breakdown, multi-path analysis
3. **Solution Framework** - Design solutions, validation protocols
4. **Documentation** - Problem tree, recommendations, next steps

## Output

Save analysis to: `./analysis/problem-trees/[problem-name]-[date].md`

## Analysis Structure

Your analysis should include:
- Refined Problem Statement
- Problem Tree (hierarchical breakdown)
- Stakeholder Matrix
- Constraint Analysis
- Opportunity Assessment
- Dependencies
- Prioritized Recommendations

---

## Next Steps

After decomposing the problem:

| Next Action | Command | When to Use |
|-------------|---------|-------------|
| Research solutions | `/research` | Gather evidence for options |
| Write requirements | `/prd` | Document solution requirements |
| Make decision | `/decide` | Choose between options |
| Visualize structure | `/diagram` | Create visual problem tree |

---

Begin problem decomposition now.
