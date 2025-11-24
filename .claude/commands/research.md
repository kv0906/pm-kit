---
description: Comprehensive research - multi-source synthesis, user research, evidence assessment, and analytics
---

# Research Command

You are acting as the **Research Agent** for this task.

## Your Task

Conduct comprehensive research on:

**Research Topic**: {{input}}

---

## Research Mode Auto-Detection

Analyze the input to determine the appropriate research mode:

| Keywords in Input | Mode |
|-------------------|------|
| "users", "customers", "personas", "interviews", "surveys" | **User Research** |
| "evidence", "validate", "confidence", "proof", "hypothesis" | **Evidence Assessment** |
| "metrics", "analytics", "data", "KPI", "cohort", "funnel" | **Analytics Research** |
| Default (or "research", "investigate", "study") | **Multi-Source Synthesis** |

---

## Mode 1: Multi-Source Synthesis (Default)

**Use when**: Making significant decisions requiring comprehensive evidence from diverse sources.

### Phase 1: Research Planning
1. **Define Research Objectives**
   - State what decision this informs
   - Identify 3-5 key questions to answer
   - Set success criteria
   - **Template**: `./.claude/templates/research-matrix.md`

2. **Identify Data Sources**
   - Primary: user interviews, surveys, usability tests
   - Secondary: analytics, competitors, market reports
   - Organizational: sales, support, past research
   - Aim for 3+ diverse sources

3. **Create Research Plan**
   - Sources, methods, timeline
   - Quality criteria for each source

### Phase 2: Data Collection
1. **Collect Evidence**
   - Search `./research/` directories
   - Review analytics and `./decisions/` history
   - Gather competitive intelligence

2. **Evaluate Source Quality**
   - Rate: Reliability (1-5), Recency (1-5), Relevance (1-5)
   - Document sample sizes
   - **Output**: `./outputs/evidence-logs/[topic]-source-quality-[date].md`

3. **Create Evidence Log**
   - **Template**: `./.claude/templates/evidence-log.md`
   - Assign IDs (EV-001, EV-002, etc.)

### Phase 3: Analysis & Synthesis
1. **Create Research Synthesis Matrix**:
   ```
   ┌──────────────┬──────────┬──────────┬──────────┬─────┐
   │ Finding      │Source 1  │Source 2  │Source 3  │Conf.│
   ├──────────────┼──────────┼──────────┼──────────┼─────┤
   │ Finding 1    │ Evidence │ Evidence │ Evidence │ 9.2 │
   │ Finding 2    │ Evidence │ Evidence │ ---      │ 7.5 │
   └──────────────┴──────────┴──────────┴──────────┴─────┘
   ```

2. **Identify Patterns**:
   - **Converging**: 3+ sources agree (High confidence)
   - **Diverging**: Sources conflict (Investigate)
   - **Unique**: Single-source findings (Validate)
   - **Gaps**: What we don't know

3. **Generate Insights**
   - Confidence scores (1-10)
   - Quality criteria: surprising, actionable, evidence-based, relevant, specific

4. **Prioritize** using Impact vs. Evidence Matrix

### Phase 4: Documentation
- **Output**: `./outputs/research-reports/[topic]-report-[date].md`
- Executive summary, methodology, findings, synthesis, recommendations

---

## Mode 2: User Research Synthesis

**Use when**: Synthesizing interviews, surveys, usability tests; creating personas; mapping journeys.

### Phase 1: Data Preparation
1. **Load Research Data**
   - Interview transcripts: `./research/user-interviews/`
   - Survey results: `./research/surveys/`
   - Usability tests: `./research/usability/`
   - Support tickets: `./research/support/`

2. **Clean and Standardize**

### Phase 2: Thematic Analysis
1. **Qualitative Coding**
   - Line-by-line coding
   - Pattern identification
   - Theme development

2. **Affinity Mapping**
   - Cluster related insights
   - Build theme hierarchy

3. **Sentiment Analysis**
   - Score sentiment per feature
   - Map emotional journey

### Phase 3: Insight Generation
1. **Pattern Recognition** with cross-method triangulation

2. **Persona-Based Insights**
   - Map to personas
   - **Output**: `./research/personas/[persona-name].md`

3. **Jobs-to-be-Done Analysis**
   - Functional, emotional, social jobs
   - Current struggles
   - Solution opportunities

4. **Journey Mapping**
   - **Output**: `./research/journeys/[journey-name].md`

### Phase 4: Prioritization
- Problem x Frequency x Dissatisfaction scoring
- Opportunity mapping

### Phase 5: Documentation
- **Output**: `./research/insights/[study-name]-report.md`

---

## Mode 3: Evidence Assessment

**Use when**: Evaluating strength of evidence for decisions; assessing readiness; identifying gaps.

### Phase 1: Define the Question
1. **Clarify What Needs Evidence**
   - What claim/hypothesis?
   - What decision does this inform?
   - What confidence level is needed?

2. **Frame as Hypothesis**:
   - **We believe that**: [action/decision]
   - **Will result in**: [outcome]
   - **We'll know we're right when**: [metrics]

### Phase 2: Collect Evidence
- Search `./research/`, `./outputs/research-reports/`, `./decisions/`
- Check analytics and customer feedback

### Phase 3: Evaluate Quality
**Create Evidence Quality Matrix**:
```
┌─────────────┬──────────┬────────┬──────────┬────────┬──────┐
│ Source      │Reliability│Recency │Relevance │Sample  │Score │
│             │  (1-5)   │ (1-5)  │  (1-5)   │Size    │(Avg) │
├─────────────┼──────────┼────────┼──────────┼────────┼──────┤
│ User Intrvw │    4     │   5    │    5     │  20    │ 4.7  │
│ Analytics   │    5     │   5    │    4     │ 10K    │ 4.7  │
└─────────────┴──────────┴────────┴──────────┴────────┴──────┘
```

### Phase 4: Synthesize
- **Converging Evidence**: 3+ sources (Confidence: 8-10)
- **Diverging Evidence**: Conflicts (Confidence: 4-6)
- **Unique Insights**: Single source (Confidence: 3-4)

### Phase 5: Assess Overall Confidence
**Calculate Score (1-10)** based on:
- Evidence quality
- Triangulation
- Methodological diversity
- Sample adequacy

**Recommendation**:
- ✅ **Proceed with confidence** (≥8/10)
- ⚠️ **Proceed with caution** (5-7/10)
- ❌ **Need more research** (<5/10)

### Phase 6: Document
- **Output**: `./outputs/evidence-logs/[topic]-evidence-[date].md`

---

## Mode 4: Analytics Research

**Use when**: Interpreting product analytics; understanding segments/cohorts; optimizing funnels.

### Phase 1: Define Objectives
- What metrics matter?
- What behaviors to investigate?
- What benchmarks exist?

### Phase 2: Data Collection
- Product analytics platforms
- Event tracking data
- A/B test results

### Phase 3: Analysis
1. **Descriptive**: Summary stats, trends, segment breakdowns
2. **Funnel Analysis**: Drop-off points, conversion rates
3. **Cohort Analysis**: Behavior over time, retention
4. **Correlation Analysis**: Relationships between metrics

### Phase 4: Insights
- Behavioral predictors
- Segment differences
- Optimization opportunities

### Phase 5: Documentation
- **Output**: `./outputs/research-reports/[topic]-analytics-[date].md`

---

## Quality Checklist

Before finalizing:

- [ ] Clear objectives aligned with decision needs
- [ ] Multiple sources used (3+ when applicable)
- [ ] Source quality assessed systematically
- [ ] Confidence levels stated and justified
- [ ] Limitations acknowledged
- [ ] Insights are actionable and evidence-based
- [ ] Recommendations specific and prioritized

---

## Next Steps

After completing research, consider:

- `/consensus` - Build stakeholder alignment on findings
- `/decide` - Make decision based on research
- `/matrix` - Compare options from research
- `/prd` - Write requirements based on insights

---

## Usage Examples

```
# Multi-source (default)
/research "Should we build a mobile app?"

# User research
/research "Synthesize Q3 user interview findings"

# Evidence assessment
/research "Evaluate evidence for redesign hypothesis"

# Analytics
/research "Analyze onboarding funnel drop-off"
```

---

Begin research now based on detected mode.
