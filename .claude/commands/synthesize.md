---
description: "[DEPRECATED] Use /research with user research keywords instead"
---

# Research Synthesis Command

> **DEPRECATED**: This command has been consolidated into `/research`.
>
> The `/research` command now auto-detects user research mode when your input contains keywords like "users", "customers", "personas", "interviews", or "surveys".
>
> **Please use `/research` instead.**

---

## Migration Guide

| Old Usage | New Usage |
|-----------|-----------|
| `/synthesize "Q3 interviews"` | `/research "Synthesize Q3 user interviews"` |
| `/synthesize "survey results"` | `/research "Analyze customer survey results"` |
| `/synthesize "usability tests"` | `/research "Synthesize user usability tests"` |

---

# Legacy Documentation (Below)

You are acting as the **User Researcher Agent** for this task.

## Your Task

Synthesize the following user research data into actionable insights:

**Research Data/Study**: $ARGUMENTS

## Workflow to Follow

Refer to `./.claude/workflows/user-research-synthesis.md` for the complete methodology.

## Your Process

### Phase 1: Data Preparation
1. **Load Research Data**:
   - Interview transcripts from `./research/user-interviews/`
   - Survey results from `./research/surveys/`
   - Usability test recordings from `./research/usability/`
   - Analytics data from `./research/analytics/`
   - Support tickets from `./research/support/`

2. **Clean and Standardize**:
   - Process transcripts (remove filler, tag emotions)
   - Normalize survey data
   - Extract metadata
   - **Verification**: Data complete and sanitized?

### Phase 2: Thematic Analysis
1. **Qualitative Coding**:
   - Line-by-line coding
   - Pattern identification
   - Theme development
   - Code frequency analysis

2. **Affinity Mapping**:
   - Cluster related insights
   - Build theme hierarchy
   - Identify strategic themes

3. **Sentiment Analysis**:
   - Score sentiment per feature
   - Map emotional journey
   - Identify sentiment trends

### Phase 3: Insight Generation
1. **Pattern Recognition**:
   - Cross-method triangulation
   - Validate with multiple sources
   - Assess confidence levels

2. **Persona-Based Insights**:
   - Map insights to personas
   - Identify cross-persona patterns

3. **Jobs-to-be-Done Analysis**:
   - Define user jobs
   - Identify current struggles
   - Map solution opportunities

### Phase 4: Prioritization
1. Use Impact-Evidence Matrix
2. Generate recommendations
3. Define success metrics
4. **Verification**: Insights actionable and evidence-based?

### Phase 5: Communication
1. Create executive summary
2. Generate detailed report
3. Build insight library
4. Plan stakeholder presentations

## Output Locations

- Research Report: `./research/insights/[study-name]-report.md`
- Insight Library: `./research/insights/[study-name]-insights.md`
- Personas: `./research/personas/[persona-name].md`
- Recommendations: `./research/insights/[study-name]-recommendations.md`

## Research Report Structure

Your report must include:
- Executive Summary (key insights, recommendations)
- Research Objectives
- Methodology (methods, participants, timeline)
- Key Findings (with evidence and quotes)
- User Personas (if created/updated)
- Opportunities (product implications)
- Recommendations (immediate, short-term, long-term)
- Limitations (sample size, biases, constraints)
- Appendix (raw data location, methodology details)

## Quality Checklist

Before finalizing, verify:
- [ ] Sufficient sample size for method
- [ ] Themes emerge from data (not imposed)
- [ ] Multiple data sources triangulated
- [ ] Insights meet quality criteria (surprising, actionable, evidence-based)
- [ ] Alternative explanations considered
- [ ] Recommendations specific and feasible
- [ ] Limitations acknowledged

## Insight Quality Criteria

Each insight must be:
- **Surprising**: Not obvious or already known
- **Actionable**: Suggests clear product opportunities
- **Evidence-based**: Grounded in data, not opinion
- **Relevant**: Matters to business and users
- **Specific**: Concrete and detailed

## Agent Capabilities

Refer to `./.claude/agents/user-researcher.md` for detailed capabilities including:
- Interview transcript analysis
- Survey data synthesis
- Persona development
- Journey mapping
- Pain point identification
- Opportunity discovery

Begin research synthesis now.
