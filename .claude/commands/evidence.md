---
description: Gather and assess evidence quality for data-driven product decisions with confidence scoring
---

# Evidence Gathering and Assessment Command

You are acting as the **Research Synthesizer Agent** with focus on evidence evaluation.

## Your Task

Gather and assess evidence quality for:

**Topic/Claim**: {{input}}

## Workflow to Follow

Refer to `./.claude/workflows/evidence-based-decision.md` for the complete methodology.

## Your Process

### Phase 1: Define the Question

1. **Clarify What Needs Evidence**:
   - What claim or hypothesis are we evaluating?
   - What decision does this evidence inform?
   - What specific questions must be answered?
   - What level of confidence is needed?

2. **Frame as Hypothesis** (if applicable):
   - **We believe that**: [action/decision]
   - **Will result in**: [outcome]
   - **For**: [user segment/stakeholder]
   - **Because**: [underlying theory]
   - **We'll know we're right when**: [observable metrics]

3. **Identify Information Needs**:
   - Primary questions (must answer)
   - Secondary questions (nice to answer)
   - Evidence types required
   - Current evidence gaps
   - **Minimum confidence threshold**: X/10

### Phase 2: Collect Evidence

1. **Search Existing Sources**:
   - Check `./research/` for relevant studies
   - Review `./outputs/research-reports/` for past findings
   - Search `./decisions/` for previous decisions
   - Check analytics dashboards
   - Review support tickets and customer feedback
   - Look for competitive intelligence
   - Search for market reports or industry data

2. **Identify Evidence Sources**:
   For each piece of evidence found, note:
   - Source name and type
   - Publication/creation date
   - Author/organization
   - How to access it
   - Relevant findings

3. **Assess Need for New Research**:
   - Are there critical gaps in existing evidence?
   - Is existing evidence too old or low quality?
   - Do we need to validate assumptions?
   - Should we use `/research` command for comprehensive study?

### Phase 3: Evaluate Evidence Quality

1. **Create Evidence Log**:
   - **Use template**: `./.claude/templates/evidence-log.md`
   - Assign ID to each piece of evidence (EV-001, EV-002, etc.)
   - Document systematically

2. **Rate Each Evidence Source**:

   **Reliability (1-5)**:
   - 5: Gold standard (peer-reviewed, controlled experiments, A/B tests)
   - 4: High quality (reputable sources, good methodology)
   - 3: Moderate (acceptable methodology, some limitations)
   - 2: Low (questionable methodology, significant biases)
   - 1: Unreliable (anecdotal, unverified, highly biased)

   **Recency (1-5)**:
   - 5: Very recent (< 1 month old)
   - 4: Recent (1-3 months)
   - 3: Acceptable (3-6 months)
   - 2: Aging (6-12 months)
   - 1: Stale (> 12 months)

   **Relevance (1-5)**:
   - 5: Directly addresses question
   - 4: Highly relevant with minor gaps
   - 3: Moderately relevant
   - 2: Tangentially relevant
   - 1: Minimally relevant

   **Sample Size**:
   - Document sample size for context
   - Note if statistically significant
   - Consider in overall assessment

3. **Create Evidence Quality Matrix**:
   ```
   ┌─────────────┬──────────┬────────┬──────────┬────────┬──────┐
   │ Source      │Reliability│Recency │Relevance │Sample  │Score │
   │             │  (1-5)   │ (1-5)  │  (1-5)   │Size    │(Avg) │
   ├─────────────┼──────────┼────────┼──────────┼────────┼──────┤
   │ User Intrvw │    4     │   5    │    5     │  20    │ 4.7  │
   │ Analytics   │    5     │   5    │    4     │ 10K    │ 4.7  │
   │ Survey      │    4     │   5    │    5     │  500   │ 4.7  │
   │ Competitors │    3     │   4    │    4     │   5    │ 3.7  │
   │ Expert      │    3     │   5    │    5     │   3    │ 4.3  │
   ├─────────────┴──────────┴────────┴──────────┴────────┴──────┤
   │ Weighted Score: X.X/5.0                                     │
   │ Confidence Level: [HIGH/MEDIUM/LOW]                        │
   └──────────────────────────────────────────────────────────────┘
   ```

4. **Extract Key Findings**:
   For each evidence source:
   - Main finding/conclusion
   - Supporting data (quotes, statistics)
   - Statistical significance (if applicable)
   - Context and limitations
   - Potential biases
   - How it informs the decision

### Phase 4: Synthesize Evidence

1. **Identify Patterns**:

   **Converging Evidence** (High Confidence):
   - Where 3+ sources agree
   - Strong, consistent pattern
   - High confidence (8-10/10)
   - **Action**: Trust and act on this

   **Diverging Evidence** (Requires Investigation):
   - Where sources conflict
   - Need to understand why
   - Medium to low confidence (4-6/10)
   - **Action**: Investigate or get more data

   **Unique Insights** (Single Source):
   - Only one source says this
   - Low confidence (3-4/10)
   - **Action**: Validate with additional research

   **Knowledge Gaps**:
   - What we still don't know
   - Critical vs. nice-to-know
   - **Action**: Plan follow-up research

2. **Create Evidence Synthesis**:
   ```markdown
   ## What the Evidence Says

   ### Strong Evidence (Confidence: 8-10/10)
   **Finding 1**: [Statement]
   - Sources: EV-001, EV-003, EV-005 (3+ agree)
   - Confidence: 9/10
   - Implication: [What this means]

   ### Moderate Evidence (Confidence: 5-7/10)
   **Finding 2**: [Statement]
   - Sources: EV-002, EV-004 (2 agree)
   - Confidence: 6/10
   - Implication: [What this means]
   - Action: [Consider validation]

   ### Weak Evidence (Confidence: 1-4/10)
   **Finding 3**: [Statement]
   - Source: EV-006 only
   - Confidence: 3/10
   - Action: [Needs validation]

   ### Conflicting Evidence
   **Conflict**: [Description]
   - Source A says: [X]
   - Source B says: [Y]
   - Possible reasons: [Analysis]
   - Resolution: [How to interpret]

   ### Knowledge Gaps
   **Gap 1**: [What we don't know]
   - Why it matters: [Impact on decision]
   - How to fill: [Suggested method]
   - Priority: [High/Medium/Low]
   ```

### Phase 5: Assess Overall Confidence

1. **Calculate Confidence Score** (1-10 scale):

   **Evidence Quality** (weighted average of source scores):
   - Average source quality × sample diversity
   - Adjust for source independence
   - **Score**: X/10

   **Triangulation** (multiple sources converge):
   - 4+ sources agree: 10/10
   - 3 sources agree: 8/10
   - 2 sources agree: 6/10
   - 1 source only: 4/10
   - **Score**: X/10

   **Methodological Diversity**:
   - Multiple methods (qual + quant + observational): 10/10
   - Two methods: 7/10
   - One method: 4/10
   - **Score**: X/10

   **Sample Adequacy**:
   - Large, representative samples: 10/10
   - Moderate samples: 7/10
   - Small or biased samples: 4/10
   - **Score**: X/10

   **Overall Confidence** = Average of above scores

2. **Interpret Confidence Level**:
   - **9-10 (Very High)**: Strong evidence, multiple quality sources, clear patterns
   - **7-8 (High)**: Good evidence, some triangulation, minor gaps
   - **5-6 (Medium)**: Moderate evidence, some gaps or conflicts
   - **3-4 (Low)**: Limited evidence, significant gaps, weak sources
   - **1-2 (Very Low)**: Insufficient evidence, unreliable sources

3. **Make Recommendation**:
   - ✅ **Proceed with confidence** (≥8/10): Evidence strongly supports decision
   - ⚠️ **Proceed with caution** (5-7/10): Evidence supports but with gaps
   - ❌ **Need more research** (<5/10): Evidence insufficient for confident decision

### Phase 6: Document Findings

1. **Complete Evidence Log**:
   - All sources documented
   - Quality scores assigned
   - Findings extracted
   - Patterns identified
   - Confidence assessed
   - **Output**: `./outputs/evidence-logs/[topic]-evidence-[date].md`

2. **Create Evidence Summary**:
   ```markdown
   # Evidence Assessment: [Topic]
   **Date**: [YYYY-MM-DD]
   **Assessed by**: [Name]

   ## Summary
   **Overall Confidence**: X.X/10 ([Very High/High/Medium/Low])
   **Recommendation**: [Proceed/Caution/More Research]

   ## Evidence Quality
   - Total sources: X
   - Average quality: X.X/5
   - Source diversity: [Strong/Moderate/Weak]
   - Triangulation: [Strong/Moderate/Weak]

   ## Key Findings
   1. [Finding 1] - Confidence: X/10
   2. [Finding 2] - Confidence: X/10
   3. [Finding 3] - Confidence: X/10

   ## Evidence Gaps
   - [Gap 1] - Priority: [High/Medium/Low]
   - [Gap 2] - Priority: [High/Medium/Low]

   ## Next Steps
   - [ ] [Action 1]
   - [ ] [Action 2]
   ```

3. **Link to Decision** (if applicable):
   - Create or update decision document in `./decisions/`
   - Reference evidence log
   - Document confidence level
   - Note any assumptions

## Evidence Hierarchy

Use this hierarchy to prioritize evidence types:

```
Evidence Quality Pyramid:
         ▲
        /═\        Level 1: Meta-Analysis
       /═══\       Multiple studies, systematic review
      /═════\      [Confidence: 9-10/10]
     /═══════\
    /═════════\    Level 2: Controlled Experiments
   /═══════════\   A/B tests, RCTs
  /═════════════\  [Confidence: 8-9/10]
 /═══════════════\
/═════════════════\ Level 3: Observational Studies
═══════════════════ Analytics, cohort studies, surveys
                   [Confidence: 6-8/10]

═══════════════════ Level 4: Expert Opinion
                   Industry leaders, advisors
                   [Confidence: 4-6/10]

═══════════════════ Level 5: Anecdotal Evidence
                   Individual cases, stories
                   [Confidence: 1-3/10]
```

**Higher levels = Stronger evidence for decisions**

## Common Evidence Types

### Quantitative Evidence
- **A/B test results**: Causal evidence (High confidence)
- **Analytics data**: Behavioral patterns (Medium-High confidence)
- **Survey results**: Attitudes at scale (Medium confidence)
- **Market research**: Industry trends (Medium confidence)

### Qualitative Evidence
- **User interviews**: In-depth insights (Medium-High confidence if n≥15)
- **Usability tests**: Behavioral observation (Medium-High confidence)
- **Customer feedback**: Voice of customer (Medium confidence if synthesized)
- **Expert opinions**: Domain expertise (Medium confidence if multiple experts)

### Secondary Evidence
- **Competitor analysis**: Market landscape (Medium confidence)
- **Industry reports**: Market trends (Medium confidence from reputable sources)
- **Academic research**: Theoretical foundation (High confidence if peer-reviewed)
- **Case studies**: Examples and patterns (Low-Medium confidence)

## Quality Checklist

Before finalizing, verify:

### Evidence Collection
- [ ] All relevant existing sources identified
- [ ] Evidence from multiple types (qual + quant)
- [ ] Recent evidence prioritized
- [ ] Gaps identified
- [ ] Need for new research assessed

### Quality Assessment
- [ ] Each source rated on reliability, recency, relevance
- [ ] Sample sizes documented
- [ ] Overall quality score calculated
- [ ] Limitations noted
- [ ] Biases identified

### Synthesis
- [ ] Patterns identified (converging, diverging, unique)
- [ ] Conflicts analyzed and resolved
- [ ] Confidence scores assigned
- [ ] Gaps documented with priority
- [ ] Overall confidence appropriate

### Documentation
- [ ] Evidence log complete and organized
- [ ] All sources properly cited
- [ ] Findings clearly stated
- [ ] Confidence levels justified
- [ ] Recommendations actionable

## Integration with Other Tools

Use in combination with:

- **Research synthesis**: Use `/research` for comprehensive multi-source research
- **Decision making**: Feed evidence into decision matrices and frameworks
- **Consensus building**: Share evidence to build stakeholder alignment
- **Matrix generation**: Create evidence quality matrices

## Output Locations

All outputs should be saved to:

- **Evidence Log**: `./outputs/evidence-logs/[topic]-evidence-[date].md`
- **Evidence Quality Matrix**: `./outputs/evidence-logs/[topic]-quality-[date].md`
- **Evidence Summary**: Include in research reports or decision documents

## Agent Capabilities

As the Research Synthesizer Agent (evidence focus), you have access to:

- **Evidence evaluation frameworks** (quality criteria, hierarchies)
- **Source assessment methodologies** (reliability, recency, relevance)
- **Confidence scoring** (triangulation, quality weighting)
- **Pattern recognition** (convergence, divergence, gaps)
- **Documentation templates** (evidence log)

Refer to `./.claude/agents/research-synthesizer.md` for detailed capabilities.

## Success Criteria

Evidence assessment is successful when:
- [ ] All available relevant evidence identified and evaluated
- [ ] Quality scores assigned systematically
- [ ] Overall confidence level appropriate
- [ ] Patterns and conflicts clearly identified
- [ ] Gaps documented with action plans
- [ ] Decision makers can proceed with appropriate confidence
- [ ] Evidence well-documented for future reference

Begin evidence gathering and assessment now.
