---
description: Conduct comprehensive multi-source research synthesis with evidence-based insights and confidence scoring
---

# Research Synthesis Command

You are acting as the **Research Synthesizer Agent** for this task.

## Your Task

Conduct comprehensive research synthesis on the following topic:

**Research Topic**: {{input}}

## Workflow to Follow

Refer to `./.claude/workflows/research-synthesis.md` for the complete methodology.

## Your Process

### Phase 1: Research Planning (Complete First)

1. **Define Research Objectives**:
   - Clearly state what decision this research informs
   - Identify 3-5 key questions that must be answered
   - Set success criteria for the research
   - **Use template**: `./.claude/templates/research-matrix.md`

2. **Identify Data Sources**:
   - Primary research (user interviews, surveys, usability tests)
   - Secondary research (analytics, competitors, market reports)
   - Organizational knowledge (sales, support, past research)
   - Document which sources are available and accessible

3. **Create Research Plan**:
   - Source list with methods and timeline
   - Quality criteria for each source
   - Success metrics
   - **Verification**: Is the plan comprehensive and realistic?

### Phase 2: Data Collection

1. **Collect Existing Evidence**:
   - Search for relevant research in `./research/` directories
   - Review analytics data
   - Check previous decision documents in `./decisions/`
   - Gather competitive intelligence
   - Review support tickets and customer feedback

2. **Evaluate Source Quality**:
   - Use source evaluation matrix from research-matrix template
   - Rate each source on Reliability (1-5), Recency (1-5), Relevance (1-5)
   - Document sample sizes
   - Calculate overall quality scores
   - **Output**: `./outputs/evidence-logs/[topic]-source-quality-[date].md`

3. **Create Evidence Log**:
   - **Use template**: `./.claude/templates/evidence-log.md`
   - Document each source with ID (EV-001, EV-002, etc.)
   - Extract key findings with supporting quotes/data
   - Note limitations and biases
   - **Verification**: All sources documented with quality ratings?

### Phase 3: Analysis and Synthesis

1. **Analyze Each Source**:
   - Extract key findings
   - Identify patterns and themes
   - Note sentiment and frequency
   - Document evidence quality
   - Assess confidence levels

2. **Cross-Source Synthesis**:
   - **Create Research Synthesis Matrix** (use Matrix Generator capabilities):
     ```
     ┌──────────────┬──────────┬──────────┬──────────┬──────────┬─────┐
     │ Finding      │Source 1  │Source 2  │Source 3  │Source 4  │Conf.│
     ├──────────────┼──────────┼──────────┼──────────┼──────────┼─────┤
     │ Finding 1    │ Evidence │ Evidence │ Evidence │ Evidence │ 9.2 │
     │ Finding 2    │ Evidence │ Evidence │ ---      │ Evidence │ 7.5 │
     │ Finding 3    │ Evidence │ ---      │ ---      │ ---      │ 4.1 │
     └──────────────┴──────────┴──────────┴──────────┴──────────┴─────┘
     ```
   - **Identify patterns**:
     - Converging Evidence: Where 3+ sources agree (High confidence)
     - Diverging Evidence: Where sources conflict (Investigate)
     - Unique Insights: Single-source findings (Validate)
     - Knowledge Gaps: What we still don't know
   - **Output**: `./outputs/research-reports/[topic]-synthesis-matrix-[date].md`

3. **Generate Insights**:
   - For each major finding, create an insight with:
     - Clear statement of what we learned
     - Supporting evidence from multiple sources
     - Confidence score (1-10)
     - Why it matters (business and user impact)
     - Actionable implications
     - Related insights
   - **Quality criteria**: Insights must be surprising, actionable, evidence-based, relevant, and specific

4. **Prioritize Insights**:
   - Use Impact vs. Evidence Matrix:
     ```
     High Impact + Strong Evidence = PRIORITY 1 (Act immediately)
     High Impact + Weak Evidence = INVESTIGATE (More research)
     Low Impact + Strong Evidence = DOCUMENT (Track for future)
     Low Impact + Weak Evidence = IGNORE (Deprioritize)
     ```
   - **Verification**: All insights prioritized with clear rationale?

### Phase 4: Documentation and Communication

1. **Create Research Report**:
   - **Structure**:
     - Executive Summary (key findings, recommendations, confidence)
     - Research Objectives & Questions
     - Methodology (sources, methods, timeline)
     - Source Evaluation Matrix
     - Key Findings (with evidence and confidence scores)
     - Research Synthesis Matrix
     - Insights Prioritization
     - Recommendations (immediate, short-term, long-term)
     - Knowledge Gaps
     - Limitations & Caveats
     - Appendices
   - **Output**: `./outputs/research-reports/[topic]-report-[date].md`
   - **Verification**: Report is comprehensive and actionable?

2. **Create Stakeholder Presentation Summary**:
   - Top 3-5 key insights
   - Evidence supporting each
   - Confidence levels
   - Recommended actions
   - Next steps

3. **Document Knowledge Gaps**:
   - What we still don't know
   - Why it matters for the decision
   - Suggested follow-up research
   - Priority level

### Phase 5: Decision Support (If Applicable)

If this research informs a specific decision:

1. **Decision Confidence Assessment**:
   - Overall confidence score (1-10)
   - Based on: evidence quality, source diversity, triangulation
   - Recommendation: Proceed / More research needed / Reconsider

2. **Next Steps**:
   - If consensus needed: Prepare for consensus-building process
   - If decision needed: Prepare decision matrix with options
   - If gaps exist: Plan follow-up research

## Output Locations

All outputs should be saved to:

- **Research Report**: `./outputs/research-reports/[topic]-report-[date].md`
- **Evidence Log**: `./outputs/evidence-logs/[topic]-evidence-[date].md`
- **Synthesis Matrix**: `./outputs/research-reports/[topic]-synthesis-matrix-[date].md`
- **Source Quality Assessment**: `./outputs/evidence-logs/[topic]-source-quality-[date].md`

## Research Report Structure

Your report must include:

### 1. Executive Summary
- Key findings (3-5 bullets with confidence scores)
- Overall confidence level
- Recommendations (prioritized)
- Next steps

### 2. Research Objectives
- Decision to inform
- Key questions to answer
- Success criteria

### 3. Methodology
- Sources used (with quality matrix)
- Methods applied
- Timeline
- Participant/sample details

### 4. Key Findings
For each priority finding:
- **Finding**: [Clear statement]
- **Evidence**: [Quotes, data from multiple sources]
- **Confidence**: X/10 (with justification)
- **Why it matters**: [Impact]
- **Implications**: [What to do about it]
- **Related insights**: [Connections]

### 5. Research Synthesis
- Cross-source synthesis matrix
- Converging evidence (patterns across sources)
- Diverging evidence (conflicts and how resolved)
- Unique insights (single-source findings)

### 6. Insights Prioritization
- Impact vs. Evidence Matrix
- Priority 1 (Act Now) insights
- Priority 2 (Plan) insights
- Priority 3 (Monitor) insights

### 7. Recommendations
- **Immediate Actions** (This sprint)
- **Short-term Initiatives** (This quarter)
- **Long-term Considerations** (This year)

### 8. Knowledge Gaps
- What we still don't know
- Why it matters
- Suggested follow-up research
- Priority

### 9. Limitations
- Sample size limitations
- Methodological constraints
- Bias concerns
- Generalizability
- Data freshness

### 10. Appendices
- Detailed methodology
- Raw data locations
- Interview guides / survey questions
- Participant screening criteria
- Additional analysis

## Quality Checklist

Before finalizing, verify:

### Research Quality
- [ ] Clear research objectives aligned with decision needs
- [ ] Multiple sources used (3+ sources)
- [ ] Mix of qualitative and quantitative data
- [ ] Source quality assessed systematically
- [ ] Appropriate sample sizes for methods used
- [ ] Bias mitigation considered

### Evidence Quality
- [ ] Evidence log created with all sources documented
- [ ] Source quality scores calculated
- [ ] Overall confidence level appropriate
- [ ] Limitations acknowledged
- [ ] Contradictions addressed

### Synthesis Quality
- [ ] Cross-source synthesis matrix created
- [ ] Patterns identified (converging, diverging, unique)
- [ ] Themes emerged from data (not imposed)
- [ ] Alternative explanations considered
- [ ] Confidence scores calibrated appropriately

### Insight Quality
- [ ] Insights meet quality criteria (surprising, actionable, evidence-based, relevant, specific)
- [ ] Strong evidence supports each insight (multiple sources)
- [ ] Confidence levels clearly stated and justified
- [ ] Business and user impact explained
- [ ] Actionable implications identified
- [ ] Insights prioritized by impact and evidence

### Communication Quality
- [ ] Executive summary is clear and concise
- [ ] Report structure is logical and complete
- [ ] Findings presented with supporting evidence
- [ ] Visual aids (matrices, charts) used effectively
- [ ] Recommendations are specific and actionable
- [ ] Next steps clear with owners (if known)

## Integration with Other Tools

After completing research:

- **If consensus needed**: Use `/consensus` command to build stakeholder alignment on findings and recommendations

- **If decision needed**: Use decision matrix workflow to evaluate options based on research findings

- **If comparison needed**: Use `/matrix` command to create feature comparisons or evaluation matrices

- **For ongoing tracking**: Create decision record in `./decisions/` directory

## Agent Capabilities

As the Research Synthesizer Agent, you have access to:

- **Research planning frameworks** (research-matrix template)
- **Evidence quality assessment** (source evaluation matrix)
- **Cross-source synthesis** (synthesis matrix generation)
- **Insight generation** (pattern recognition, confidence scoring)
- **Prioritization frameworks** (impact vs. evidence matrix)
- **Documentation templates** (evidence log, research report)

Refer to `./.claude/agents/research-synthesizer.md` for detailed capabilities.

## Success Criteria

Research synthesis is successful when:
- [ ] Research objectives fully addressed
- [ ] Confidence level ≥7/10 on key findings
- [ ] Clear, actionable insights generated
- [ ] Evidence from multiple sources triangulated
- [ ] Patterns and conflicts identified and explained
- [ ] Recommendations specific and prioritized
- [ ] Knowledge gaps identified
- [ ] Limitations acknowledged
- [ ] Stakeholders can make informed decision based on findings

Begin research synthesis now.
