---
description: "[DEPRECATED] Use /research instead - now supports all research types"
---

# Research Command (Unified)

> **DEPRECATED**: This command has been consolidated into `/research`.
>
> The `/research` command now supports all research types with auto-detection:
> - Multi-source synthesis (default)
> - User research (keywords: users, customers, personas, interviews)
> - Evidence assessment (keywords: evidence, validate, confidence)
> - Analytics research (keywords: metrics, analytics, KPI, funnel)
>
> **Please use `/research` instead.**

---

## Migration Guide

| Old Usage | New Usage |
|-----------|-----------|
| `/research-unified "topic"` | `/research "topic"` |
| `/research-unified "topic" --type=user` | `/research "Synthesize user interviews for topic"` |
| `/research-unified "topic" --type=evidence` | `/research "Evaluate evidence for topic"` |
| `/research-unified "topic" --type=analytics` | `/research "Analyze metrics for topic"` |

---

# Legacy Documentation (Below)

You are acting as the **Research Agent** for this task.

## Your Task

Conduct comprehensive research on the following topic:

**Research Topic**: $ARGUMENTS

**Research Type**: auto (detected from input)

---

## Research Type Auto-Detection

If no type is specified, analyze the input to determine the appropriate research type:

**Multi-Source Research** - Use when:
- Input mentions "research", "investigate", "study", "analyze"
- Requires understanding from multiple data sources
- Making significant product decisions
- Need comprehensive evidence synthesis

**User Research** - Use when:
- Input mentions "users", "customers", "personas", "interviews", "surveys"
- Synthesizing qualitative user data
- Understanding user needs, pain points, journeys
- Creating or updating personas

**Evidence Assessment** - Use when:
- Input mentions "evidence", "validate", "confidence", "proof"
- Need to evaluate strength of existing evidence
- Assessing decision readiness
- Identifying research gaps

**Analytics Research** - Use when:
- Input mentions "metrics", "analytics", "data", "KPI", "cohort", "funnel"
- Interpreting quantitative behavioral data
- Understanding usage patterns
- Optimizing conversion or engagement

**Auto-detection Decision Tree**:
```
Input contains "users" OR "customers" OR "interviews"?
  └─ Yes → User Research Mode
  └─ No → Continue

Input contains "evidence" OR "validate" OR "confidence"?
  └─ Yes → Evidence Assessment Mode
  └─ No → Continue

Input contains "metrics" OR "analytics" OR "KPI"?
  └─ Yes → Analytics Research Mode
  └─ No → Continue

Default → Multi-Source Research Mode
```

---

## Workflow to Follow

All research types follow the core methodology in `./.claude/workflows/research-core.md` with type-specific extensions.

---

## Mode-Specific Instructions

### Mode 1: Multi-Source Research (Default)

**When to use**:
- Making significant product decisions requiring comprehensive evidence
- Need to synthesize findings from diverse sources
- Understanding market trends or competitive landscape
- Building consensus around decisions

**Research Process**:

#### Phase 1: Research Planning
1. **Define Research Objectives** (research-core.md Phase 1.1)
   - Clearly state decision to inform
   - Identify 3-5 key questions to answer
   - Set success criteria
   - **Template**: `./.claude/templates/research-matrix.md`

2. **Identify Data Sources** (research-core.md Phase 1.2)
   - Primary research (user interviews, surveys, usability tests)
   - Secondary research (analytics, competitors, market reports)
   - Organizational knowledge (sales, support, past research)
   - Aim for 3+ diverse sources

3. **Create Research Plan** (research-core.md Phase 1.3)
   - Document sources, methods, timeline
   - Set quality criteria
   - **Verification**: Plan comprehensive and realistic?

#### Phase 2: Data Collection
1. **Collect Existing Evidence**
   - Search `./research/` directories
   - Review analytics data
   - Check previous decisions in `./decisions/`
   - Gather competitive intelligence

2. **Evaluate Source Quality** (research-core.md Phase 2.2)
   - Rate each source on Reliability (1-5), Recency (1-5), Relevance (1-5)
   - Document sample sizes
   - Calculate overall quality scores
   - **Output**: `./outputs/evidence-logs/[topic]-source-quality-[date].md`

3. **Create Evidence Log**
   - **Template**: `./.claude/templates/evidence-log.md`
   - Document each source with ID (EV-001, EV-002, etc.)
   - Extract key findings with supporting data
   - **Verification**: All sources documented?

#### Phase 3: Analysis and Synthesis
1. **Analyze Each Source** (research-core.md Phase 3.1)
   - Extract key findings
   - Identify patterns and themes
   - Assess confidence levels

2. **Cross-Source Synthesis** (research-core.md Phase 3.2)
   - **Create Research Synthesis Matrix**:
     ```
     ┌──────────────┬──────────┬──────────┬──────────┬──────────┬─────┐
     │ Finding      │Source 1  │Source 2  │Source 3  │Source 4  │Conf.│
     ├──────────────┼──────────┼──────────┼──────────┼──────────┼─────┤
     │ Finding 1    │ Evidence │ Evidence │ Evidence │ Evidence │ 9.2 │
     │ Finding 2    │ Evidence │ Evidence │ ---      │ Evidence │ 7.5 │
     └──────────────┴──────────┴──────────┴──────────┴──────────┴─────┘
     ```
   - Identify:
     - **Converging Evidence**: 3+ sources agree (High confidence)
     - **Diverging Evidence**: Sources conflict (Investigate)
     - **Unique Insights**: Single-source findings (Validate)
     - **Knowledge Gaps**: What we still don't know
   - **Output**: `./outputs/research-reports/[topic]-synthesis-matrix-[date].md`

3. **Generate Insights** (research-core.md Phase 3.3)
   - Use Research Agent insight generation capabilities
   - Ensure insights meet quality criteria (surprising, actionable, evidence-based, relevant, specific)
   - Assign confidence scores (1-10)

4. **Prioritize Insights** (research-core.md Phase 3.4)
   - Impact vs. Evidence Matrix
   - **Verification**: Insights prioritized with clear rationale?

#### Phase 4: Documentation
1. **Create Research Report**
   - **Structure**: Executive summary, methodology, key findings, synthesis, recommendations
   - **Output**: `./outputs/research-reports/[topic]-report-[date].md`

2. **Create Stakeholder Presentation**
   - Top 3-5 key insights
   - Evidence and confidence levels
   - Recommended actions

---

### Mode 2: User Research Synthesis

**When to use**:
- Synthesizing user interviews, surveys, usability tests
- Creating or updating personas
- Mapping user journeys
- Identifying product opportunities from user feedback

**Research Process**:

#### Phase 1: Data Preparation
1. **Load Research Data**
   - Interview transcripts from `./research/user-interviews/`
   - Survey results from `./research/surveys/`
   - Usability tests from `./research/usability/`
   - Analytics from `./research/analytics/`
   - Support tickets from `./research/support/`

2. **Clean and Standardize**
   - Process transcripts
   - Normalize survey data
   - Extract metadata
   - **Verification**: Data complete and sanitized?

#### Phase 2: Thematic Analysis
1. **Qualitative Coding** (use Research Agent capabilities)
   - Line-by-line coding
   - Pattern identification
   - Theme development
   - Code frequency analysis

2. **Affinity Mapping**
   - Cluster related insights
   - Build theme hierarchy
   - Identify strategic themes

3. **Sentiment Analysis**
   - Score sentiment per feature
   - Map emotional journey

#### Phase 3: Insight Generation
1. **Pattern Recognition**
   - Cross-method triangulation
   - Validate with multiple sources
   - Assess confidence levels

2. **Persona-Based Insights**
   - Map insights to personas
   - Identify cross-persona patterns
   - **Output**: `./research/personas/[persona-name].md`

3. **Jobs-to-be-Done Analysis**
   - Define user jobs (functional, emotional, social)
   - Identify current struggles
   - Map solution opportunities

4. **Journey Mapping**
   - Current state journeys
   - Pain points and delights
   - Opportunity areas
   - **Output**: `./research/journeys/[journey-name].md`

#### Phase 4: Prioritization
1. **Opportunity Mapping**
   - Problem × Frequency × Dissatisfaction scoring
   - Prioritize opportunities

2. **Recommendations**
   - Immediate, short-term, long-term
   - **Verification**: Insights actionable and evidence-based?

#### Phase 5: Documentation
1. **Research Report**
   - **Output**: `./research/insights/[study-name]-report.md`
   - Executive summary
   - Key findings with evidence
   - Personas and journeys
   - Opportunity map
   - Recommendations

---

### Mode 3: Evidence Quality Assessment

**When to use**:
- Evaluating strength of evidence for critical decisions
- Assessing decision readiness
- Identifying research gaps
- Validating hypotheses with existing data

**Research Process**:

#### Phase 1: Define the Question
1. **Clarify What Needs Evidence**
   - What claim/hypothesis are we evaluating?
   - What decision does this inform?
   - What level of confidence is needed?

2. **Frame as Hypothesis** (if applicable):
   - **We believe that**: [action/decision]
   - **Will result in**: [outcome]
   - **For**: [user segment/stakeholder]
   - **Because**: [underlying theory]
   - **We'll know we're right when**: [observable metrics]

#### Phase 2: Collect Evidence
1. **Search Existing Sources**
   - Check `./research/` for relevant studies
   - Review `./outputs/research-reports/` for past findings
   - Search `./decisions/` for previous decisions
   - Check analytics dashboards
   - Review customer feedback

2. **Identify Evidence Sources**
   - Source name and type
   - Publication/creation date
   - Relevant findings

#### Phase 3: Evaluate Evidence Quality
1. **Create Evidence Log**
   - **Template**: `./.claude/templates/evidence-log.md`
   - Assign IDs (EV-001, EV-002, etc.)

2. **Rate Each Evidence Source**:
   - **Reliability (1-5)**: Gold standard (5) to Unreliable (1)
   - **Recency (1-5)**: Very recent (5) to Stale (1)
   - **Relevance (1-5)**: Directly addresses (5) to Minimal (1)
   - **Sample Size**: Document and note significance

3. **Create Evidence Quality Matrix**:
   ```
   ┌─────────────┬──────────┬────────┬──────────┬────────┬──────┐
   │ Source      │Reliability│Recency │Relevance │Sample  │Score │
   │             │  (1-5)   │ (1-5)  │  (1-5)   │Size    │(Avg) │
   ├─────────────┼──────────┼────────┼──────────┼────────┼──────┤
   │ User Intrvw │    4     │   5    │    5     │  20    │ 4.7  │
   │ Analytics   │    5     │   5    │    4     │ 10K    │ 4.7  │
   ├─────────────┴──────────┴────────┴──────────┴────────┴──────┤
   │ Weighted Score: X.X/5.0                                     │
   │ Confidence Level: [HIGH/MEDIUM/LOW]                        │
   └──────────────────────────────────────────────────────────────┘
   ```

#### Phase 4: Synthesize Evidence
1. **Identify Patterns**
   - **Converging Evidence**: 3+ sources agree (Confidence: 8-10/10)
   - **Diverging Evidence**: Sources conflict (Confidence: 4-6/10)
   - **Unique Insights**: Single source (Confidence: 3-4/10)
   - **Knowledge Gaps**: What we don't know

#### Phase 5: Assess Overall Confidence
1. **Calculate Confidence Score** (1-10)
   - Evidence quality (source scores)
   - Triangulation (multiple sources)
   - Methodological diversity
   - Sample adequacy

2. **Make Recommendation**
   - ✅ **Proceed with confidence** (≥8/10)
   - ⚠️ **Proceed with caution** (5-7/10)
   - ❌ **Need more research** (<5/10)

#### Phase 6: Document Findings
1. **Complete Evidence Log**
   - **Output**: `./outputs/evidence-logs/[topic]-evidence-[date].md`

2. **Evidence Summary**
   - Overall confidence score
   - Recommendation
   - Key findings
   - Evidence gaps
   - Next steps

---

### Mode 4: Analytics Research

**When to use**:
- Interpreting product analytics and behavioral data
- Understanding user segments and cohorts
- Optimizing funnels and conversion paths
- Tracking KPIs against objectives

**Research Process**:

#### Phase 1: Define Analytics Objectives
1. **Identify Key Questions**
   - What metrics matter for this decision?
   - What user behaviors are we investigating?
   - What benchmarks or targets exist?

2. **Select Analytics Methods**
   - Descriptive analytics (what happened?)
   - Diagnostic analytics (why did it happen?)
   - Predictive analytics (what will happen?)

#### Phase 2: Data Collection & Preparation
1. **Extract Data**
   - Product analytics platforms
   - Event tracking data
   - User behavior logs
   - A/B test results

2. **Clean & Validate**
   - Remove outliers and anomalies
   - Handle missing data
   - Verify data quality

#### Phase 3: Analysis
1. **Descriptive Analysis**
   - Summary statistics
   - Visualizations (trends, distributions)
   - Segment breakdowns

2. **Funnel Analysis**
   - Identify drop-off points
   - Calculate conversion rates
   - Compare segments

3. **Cohort Analysis**
   - Track user groups over time
   - Identify behavior patterns
   - Measure retention

4. **Correlation Analysis**
   - Identify relationships between metrics
   - Distinguish correlation from causation

#### Phase 4: Insight Generation
1. **Pattern Recognition**
   - What behaviors predict outcomes?
   - Which segments perform differently?
   - Where are optimization opportunities?

2. **Recommendations**
   - Data-driven action items
   - A/B test hypotheses
   - Metric goals

#### Phase 5: Documentation
1. **Analytics Report**
   - **Output**: `./outputs/research-reports/[topic]-analytics-[date].md`
   - Executive summary
   - Key metrics and trends
   - Insights and recommendations

---

## Output Locations

All outputs should be saved to:

**Multi-Source Research**:
- Research Report: `./outputs/research-reports/[topic]-report-[date].md`
- Evidence Log: `./outputs/evidence-logs/[topic]-evidence-[date].md`
- Synthesis Matrix: `./outputs/research-reports/[topic]-synthesis-matrix-[date].md`
- Source Quality: `./outputs/evidence-logs/[topic]-source-quality-[date].md`

**User Research**:
- Research Report: `./research/insights/[study-name]-report.md`
- Personas: `./research/personas/[persona-name].md`
- Journey Maps: `./research/journeys/[journey-name].md`
- Opportunity Map: `./research/opportunities/[topic]-opportunities.md`

**Evidence Assessment**:
- Evidence Log: `./outputs/evidence-logs/[topic]-evidence-[date].md`
- Evidence Quality Matrix: `./outputs/evidence-logs/[topic]-quality-[date].md`
- Evidence Summary: Included in decision documents

**Analytics Research**:
- Analytics Report: `./outputs/research-reports/[topic]-analytics-[date].md`
- Dashboards and visualizations: As appropriate

---

## Quality Checklist

Before finalizing any research, verify:

### Research Quality
- [ ] Clear research objectives aligned with decision needs
- [ ] Multiple sources used (3+ for multi-source, appropriate for type)
- [ ] Mix of qualitative and quantitative data (when applicable)
- [ ] Source quality assessed systematically
- [ ] Appropriate sample sizes for methods used
- [ ] Bias mitigation considered and documented

### Evidence Quality
- [ ] Evidence log created with all sources documented
- [ ] Source quality scores calculated
- [ ] Overall confidence level appropriate
- [ ] Limitations acknowledged
- [ ] Contradictions addressed

### Synthesis Quality
- [ ] Cross-source synthesis performed (for multi-source)
- [ ] Patterns identified (converging, diverging, unique)
- [ ] Themes emerged from data (not imposed)
- [ ] Alternative explanations considered
- [ ] Confidence scores calibrated appropriately

### Insight Quality
- [ ] Insights meet quality criteria (surprising, actionable, evidence-based, relevant, specific)
- [ ] Strong evidence supports each insight (multiple sources when possible)
- [ ] Confidence levels clearly stated and justified
- [ ] Business and user impact explained
- [ ] Actionable implications identified
- [ ] Insights prioritized by impact and evidence

### Communication Quality
- [ ] Executive summary clear and concise
- [ ] Report structure logical and complete
- [ ] Findings presented with supporting evidence
- [ ] Visual aids (matrices, charts) used effectively
- [ ] Recommendations specific and actionable
- [ ] Next steps clear with owners (if known)

---

## Integration with Other Tools

After completing research:

- **If consensus needed**: Use `/consensus` to build stakeholder alignment on findings
- **If decision needed**: Use `/decide` to evaluate options based on research findings
- **If comparison needed**: Use `/matrix` to create feature comparisons or evaluation matrices
- **For ongoing tracking**: Create decision record in `./decisions/` directory

---

## Agent Capabilities

As the Research Agent, you have access to:

**All Research Types**:
- Research planning frameworks (research-core.md)
- Evidence quality assessment (source evaluation matrix)
- Cross-source synthesis (synthesis matrix generation)
- Insight generation (pattern recognition, confidence scoring)
- Prioritization frameworks (impact vs. evidence matrix)
- Documentation templates (evidence log, research report)

**User Research Specific**:
- Thematic coding and affinity mapping
- Persona development from data
- Journey mapping frameworks
- Jobs-to-be-Done analysis
- Pain point prioritization

**Analytics Specific**:
- Funnel analysis
- Cohort analysis
- Statistical testing
- Segmentation analysis
- Correlation vs. causation assessment

Refer to `./.claude/agents/research-agent.md` for detailed capabilities.

---

## Success Criteria

Research is successful when:
- [ ] Research objectives fully addressed
- [ ] Confidence level ≥7/10 on key findings
- [ ] Clear, actionable insights generated
- [ ] Evidence from multiple sources triangulated (when applicable)
- [ ] Patterns and conflicts identified and explained
- [ ] Recommendations specific and prioritized
- [ ] Knowledge gaps identified
- [ ] Limitations acknowledged
- [ ] Stakeholders can make informed decision based on findings

---

## Command Usage Examples

**Multi-Source Research**:
```
/research "Should we build a mobile app for our product?"
/research "Market opportunity for enterprise features" --type=multi-source
```

**User Research**:
```
/research "Synthesize Q3 user interview findings" --type=user
/research "Update personas based on latest surveys" --type=user
```

**Evidence Assessment**:
```
/research "Evaluate evidence for redesign hypothesis" --type=evidence
/research "Assess confidence in our pricing assumptions" --type=evidence
```

**Analytics Research**:
```
/research "Analyze onboarding funnel drop-off" --type=analytics
/research "Understand power user behavior patterns" --type=analytics
```

---

Begin research now based on the detected or specified research type.
