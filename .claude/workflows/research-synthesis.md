# Research Synthesis Workflow

> **DEPRECATED**: This workflow has been consolidated into `research-core.md`.
>
> The `research-core.md` workflow now serves as the canonical research methodology for all research types.
>
> **Commands should reference `./.claude/workflows/research-core.md` instead.**

---

# Legacy Documentation (Below)

## Comprehensive Multi-Source Research and Evidence-Based Decision Making

This workflow provides a systematic approach to conducting thorough research, synthesizing findings from multiple sources, and generating high-confidence insights that inform product decisions.

## Overview

**Purpose**: Transform diverse research data into actionable insights with clear confidence levels

**When to use**:
- Making significant product decisions requiring evidence
- Validating assumptions or hypotheses
- Understanding market trends or competitive landscape
- Building consensus on controversial decisions
- Justifying strategic direction to stakeholders

**Outputs**:
- Research report with findings and confidence scores
- Evidence quality matrix
- Research synthesis matrix
- Actionable recommendations
- Knowledge gaps identification

## Phase 1: Research Planning (2-4 hours)

### Step 1.1: Define Research Objectives
**Goal**: Clearly articulate what needs to be learned and why

**Activities**:
- **Identify the decision**: What product decision depends on this research?
- **Formulate key questions**: What specific questions must be answered?
- **Set success criteria**: What answers would make this research successful?
- **Define scope**: What's in scope vs. out of scope?
- **Set constraints**: Timeline, budget, resource availability

**Template**: Use `./.claude/templates/research-matrix.md`

**Verification Checkpoint**:
- [ ] Decision clearly stated
- [ ] 3-5 key research questions defined
- [ ] Success criteria measurable
- [ ] Scope boundaries set
- [ ] Stakeholders aligned on objectives

### Step 1.2: Identify Research Sources
**Goal**: Determine what sources will provide the needed information

**Source Categories**:

**Primary Research** (direct from users):
- User interviews (qualitative insights)
- Surveys (quantitative validation)
- Usability testing (behavioral observation)
- Field studies (contextual understanding)
- A/B tests (causal evidence)

**Secondary Research** (existing data):
- Analytics (behavioral patterns)
- Competitor analysis (market landscape)
- Industry reports (market trends)
- Academic research (theoretical foundation)
- Support tickets (pain points)

**Organizational Knowledge**:
- Sales feedback (customer needs)
- Customer success insights (user challenges)
- Engineering constraints (technical feasibility)
- Previous research (historical context)

**Selection Criteria**:
- Relevance to research questions
- Quality and reliability
- Accessibility and cost
- Timeliness
- Sample size/coverage

**Verification Checkpoint**:
- [ ] 3+ diverse sources identified
- [ ] Mix of qualitative and quantitative
- [ ] Sources accessible within timeline
- [ ] Gaps in coverage identified
- [ ] Data collection plan created

### Step 1.3: Create Research Plan
**Goal**: Document the complete research approach

**Research Plan Components**:
```markdown
# Research Plan: [Topic]

## Objective
[Clear statement of what decision needs to be made]

## Key Questions
1. [Question 1]
2. [Question 2]
3. [Question 3]

## Sources & Methods
| Source | Method | Sample | Timeline | Owner |
|--------|--------|--------|----------|-------|
| User Interviews | Semi-structured | n=15 | Week 1 | PM |
| Analytics | Dashboard analysis | All users | Week 1 | Analyst |
| Survey | Online survey | n=500 | Week 1-2 | PM |
| Competitor Analysis | Feature audit | Top 5 | Week 1 | PM |

## Timeline
- Week 1: Data collection
- Week 2: Analysis and synthesis
- Week 3: Report and decision

## Success Criteria
- [Criterion 1]
- [Criterion 2]

## Resources
- Budget: $X
- Team: [Names]
- Tools: [Software/services]
```

**Verification Checkpoint**:
- [ ] Plan documented
- [ ] Timeline realistic
- [ ] Resources secured
- [ ] Stakeholders reviewed plan
- [ ] Ready to execute

## Phase 2: Data Collection (1-2 weeks)

### Step 2.1: Execute Research Activities
**Goal**: Gather data from all planned sources

**Execution Guidelines**:

**For Interviews**:
- Prepare interview guide
- Recruit representative participants
- Record sessions (with permission)
- Take detailed notes
- Capture verbatim quotes
- Note emotional responses

**For Surveys**:
- Design unbiased questions
- Pilot test with 5-10 people
- Deploy to target audience
- Monitor response rate
- Follow up to boost responses

**For Analytics**:
- Define metrics and segments
- Extract relevant data
- Check data quality
- Document methodology
- Export for analysis

**For Competitor Analysis**:
- Create evaluation framework
- Audit competitor products
- Document features and pricing
- Capture screenshots
- Note user reviews

**Data Storage**:
- Raw data: `./research/[source-type]/[study-name]/raw/`
- Processed data: `./research/[source-type]/[study-name]/processed/`
- Notes: `./research/[source-type]/[study-name]/notes.md`

**Verification Checkpoint**:
- [ ] All planned data collected
- [ ] Quality checks performed
- [ ] Data properly stored
- [ ] Metadata documented
- [ ] Gaps identified and addressed

### Step 2.2: Evaluate Source Quality
**Goal**: Assess the reliability and relevance of each source

**Use Research Synthesizer Agent**: Invoke `./.claude/agents/research-synthesizer.md`

**Quality Evaluation Matrix**:
```
┌─────────────┬──────────┬────────┬──────────┬────────┬──────┐
│ Source      │Reliability│Recency │Relevance │Sample  │Score │
│             │  (1-5)   │ (1-5)  │  (1-5)   │Size    │(Avg) │
├─────────────┼──────────┼────────┼──────────┼────────┼──────┤
│ User Intrvw │    4     │   5    │    5     │  15    │ 4.7  │
│ Analytics   │    5     │   5    │    4     │ 10K    │ 4.7  │
│ Survey      │    4     │   5    │    5     │  500   │ 4.7  │
│ Competitors │    3     │   4    │    4     │   5    │ 3.7  │
│ Expert Call │    3     │   5    │    5     │   2    │ 4.3  │
├─────────────┴──────────┴────────┴──────────┴────────┴──────┤
│ Weighted Score: 4.4/5.0                                     │
│ Confidence Level: HIGH                                      │
└──────────────────────────────────────────────────────────────┘
```

**Output**: `./outputs/evidence-logs/[topic]-source-quality-[date].md`

**Verification Checkpoint**:
- [ ] All sources evaluated
- [ ] Quality scores assigned
- [ ] Low-quality sources flagged
- [ ] Overall confidence assessed
- [ ] Documented in evidence log

## Phase 3: Analysis and Synthesis (3-5 days)

### Step 3.1: Analyze Each Source
**Goal**: Extract findings from individual sources

**Qualitative Analysis**:
- Read/review all data
- Apply thematic coding
- Identify patterns and themes
- Extract representative quotes
- Note frequency of mentions
- Assess sentiment

**Quantitative Analysis**:
- Calculate descriptive statistics
- Create visualizations
- Identify significant patterns
- Segment analysis
- Trend identification
- Statistical testing

**Document Findings per Source**:
```markdown
## Source: [Name]
**Method**: [Description]
**Sample**: n=X, [demographics]
**Date**: [Collection date]

### Key Findings
1. **Finding**: [Description]
   - Evidence: [Quote or stat]
   - Confidence: High/Medium/Low
   - Impact: Critical/Major/Minor

2. **Finding**: [Description]
   - Evidence: [Quote or stat]
   - Confidence: High/Medium/Low
   - Impact: Critical/Major/Minor

### Limitations
- [Limitation 1]
- [Limitation 2]
```

**Verification Checkpoint**:
- [ ] Each source analyzed
- [ ] Findings documented
- [ ] Evidence extracted
- [ ] Confidence assessed
- [ ] Limitations noted

### Step 3.2: Cross-Source Synthesis
**Goal**: Identify patterns and conflicts across sources

**Use Matrix Generator Agent**: Invoke `./.claude/agents/matrix-generator.md`

**Synthesis Activities**:

**1. Pattern Recognition**:
- **Converging Evidence**: Where 3+ sources agree
- **Diverging Evidence**: Where sources conflict
- **Unique Insights**: Single-source findings
- **Knowledge Gaps**: What we still don't know

**2. Research Synthesis Matrix**:
```
┌──────────────┬──────────┬──────────┬──────────┬────────┬─────┐
│ Finding      │Source 1  │Source 2  │Source 3  │Source 4│Conf.│
│              │(n=X)     │(n=Y)     │(n=Z)     │(n=W)   │Score│
├──────────────┼──────────┼──────────┼──────────┼────────┼─────┤
│ Finding 1    │ Evidence │ Evidence │ Evidence │Evidence│ 9.2 │
│ Finding 2    │ Evidence │ Evidence │ ---      │Evidence│ 7.5 │
│ Finding 3    │ Evidence │ ---      │ ---      │---     │ 5.1 │
└──────────────┴──────────┴──────────┴──────────┴────────┴─────┘

Confidence Score Calculation:
- 4 sources agree: 9-10 (Very High)
- 3 sources agree: 7-8 (High)
- 2 sources agree: 5-6 (Medium)
- 1 source only: 3-4 (Low)
```

**3. Conflict Resolution**:
When sources disagree:
- Assess relative source quality
- Look for context differences
- Consider sampling differences
- Investigate methodological issues
- Document the uncertainty

**Output**: `./outputs/research-reports/[topic]-synthesis-matrix-[date].md`

**Verification Checkpoint**:
- [ ] All findings cross-referenced
- [ ] Patterns identified
- [ ] Conflicts analyzed
- [ ] Confidence scores calculated
- [ ] Matrix documented

### Step 3.3: Insight Generation
**Goal**: Transform findings into actionable insights

**Insight Quality Criteria**:
- **Surprising**: Not obvious or already known
- **Actionable**: Suggests clear product opportunities
- **Evidence-based**: Supported by data, not opinion
- **Relevant**: Matters to business and users
- **Specific**: Concrete and detailed

**Insight Template**:
```markdown
## Insight: [Descriptive Title]

**What we learned**:
[Clear, concise statement of the insight]

**Evidence**:
- [Finding from Source 1]
- [Finding from Source 2]
- [Quantitative data point]
- [Representative quote]

**Confidence Level**: X/10
- Sources: [Number] independent sources
- Sample: [Total sample size]
- Quality: [Average source quality score]

**Why it matters**:
[Business impact and user impact]

**Implications**:
- Product: [What to build/change]
- Strategy: [How this affects direction]
- Operations: [Process/org implications]

**Next Steps**:
1. [Immediate action]
2. [Short-term action]
3. [Long-term consideration]

**Related Insights**: [Links to connected insights]
```

**Verification Checkpoint**:
- [ ] Insights meet quality criteria
- [ ] Evidence clearly supports insights
- [ ] Confidence appropriately calibrated
- [ ] Implications actionable
- [ ] Next steps defined

### Step 3.4: Prioritize Insights
**Goal**: Rank insights by importance and confidence

**Use Impact vs. Evidence Matrix**:
```
            Strong Evidence
           │
High Impact│ PRIORITY 1    │ INVESTIGATE
           │ Act Now       │ More Research
───────────┼───────────────┼─────────────
Low Impact │ DOCUMENT      │ IGNORE
           │ Track         │ Deprioritize
           │
          High Impact     Low Impact
```

**Prioritization Criteria**:
- **Impact**: Effect on users and business (1-10)
- **Evidence**: Strength and convergence (1-10)
- **Urgency**: Time sensitivity (1-10)
- **Feasibility**: Ease of action (1-10)

**Priority Levels**:
- **P0 (Critical)**: High impact + strong evidence + urgent
- **P1 (Important)**: High impact + good evidence
- **P2 (Valuable)**: Medium impact or medium evidence
- **P3 (Nice-to-have)**: Low impact or weak evidence

**Verification Checkpoint**:
- [ ] All insights prioritized
- [ ] Prioritization criteria applied
- [ ] Priorities defensible
- [ ] Stakeholder input gathered
- [ ] Priority matrix documented

## Phase 4: Documentation and Communication (2-3 days)

### Step 4.1: Create Research Report
**Goal**: Document findings in comprehensive report

**Use Template**: `./.claude/templates/research-report.md`

**Report Structure**:
```markdown
# Research Report: [Topic]
Date: [YYYY-MM-DD]
Researcher: [Name]

## Executive Summary
**Key Findings** (3-5 bullets):
- Finding 1 (Confidence: X/10)
- Finding 2 (Confidence: X/10)
- Finding 3 (Confidence: X/10)

**Recommendations**:
1. [Immediate action]
2. [Short-term initiative]
3. [Long-term consideration]

**Confidence Level**: [HIGH/MEDIUM/LOW]

## Research Objectives
- Decision to inform: [Description]
- Key questions: [List]
- Success criteria: [List]

## Methodology
### Sources
[Source quality matrix]

### Methods
[Description of each method used]

### Timeline
[Data collection dates]

### Participants/Sample
[Demographics and size]

## Key Findings

### Finding 1: [Title]
[Use insight template from Step 3.3]

### Finding 2: [Title]
[Use insight template from Step 3.3]

[Repeat for each priority finding]

## Research Synthesis
[Include synthesis matrix from Step 3.2]

## Insights Prioritization
[Include impact/evidence matrix from Step 3.4]

## Recommendations
### Immediate Actions (This Sprint)
- [ ] Action 1
- [ ] Action 2

### Short-term Initiatives (This Quarter)
- [ ] Initiative 1
- [ ] Initiative 2

### Long-term Considerations (This Year)
- [ ] Consideration 1
- [ ] Consideration 2

## Knowledge Gaps
**What we still don't know**:
- Gap 1: [Description]
- Gap 2: [Description]

**Suggested follow-up research**:
- Study 1: [Description]
- Study 2: [Description]

## Limitations
- Sample size: [If applicable]
- Bias concerns: [If applicable]
- Methodology limitations: [If applicable]
- Generalizability: [If applicable]

## Appendices
- A: Detailed Methodology
- B: Raw Data Location
- C: Interview Guide/Survey Questions
- D: Participant Screening Criteria
- E: Additional Analysis
```

**Output Location**: `./outputs/research-reports/[topic]-report-[date].md`

**Verification Checkpoint**:
- [ ] Report complete and comprehensive
- [ ] Findings clearly stated
- [ ] Evidence provided
- [ ] Limitations acknowledged
- [ ] Recommendations actionable

### Step 4.2: Create Stakeholder Presentation
**Goal**: Communicate findings effectively to stakeholders

**Presentation Structure** (10-15 slides):
1. **Title**: Research topic and date
2. **Objectives**: What we aimed to learn
3. **Methodology**: How we conducted research (1 slide)
4. **Key Findings**: Top 3-5 insights (1 slide each)
5. **Synthesis**: Patterns across sources (1 slide)
6. **Recommendations**: Prioritized actions (1-2 slides)
7. **Next Steps**: Action items with owners
8. **Q&A**

**Presentation Guidelines**:
- Lead with insights, not methods
- Use visuals (charts, quotes, matrices)
- Tell a story
- Focus on "so what?" not just "what?"
- Be clear about confidence levels
- End with clear asks/decisions

**Verification Checkpoint**:
- [ ] Presentation created
- [ ] Key insights highlighted
- [ ] Visuals effective
- [ ] Story clear
- [ ] Recommendations actionable

### Step 4.3: Distribute and Discuss
**Goal**: Share findings and build consensus on actions

**Distribution**:
- **Research Report**: Share full report with interested parties
- **Executive Summary**: Email to leadership
- **Team Presentation**: Present to product, eng, design
- **Wiki/Knowledge Base**: Add to searchable repository
- **PRD Integration**: Link insights to relevant PRDs

**Discussion Format**:
- **Presentation**: Share findings (15-20 min)
- **Q&A**: Answer questions and clarify (10-15 min)
- **Implications**: Discuss product implications (15-20 min)
- **Next Steps**: Agree on actions and owners (10 min)

**Capture**:
- Questions raised
- Objections or concerns
- Additional context
- Agreed actions
- Dissenting opinions

**Verification Checkpoint**:
- [ ] Report distributed
- [ ] Presentation delivered
- [ ] Discussion facilitated
- [ ] Actions agreed
- [ ] Feedback captured

## Phase 5: Decision Making and Action (1-2 weeks)

### Step 5.1: Build Consensus on Actions
**Goal**: Align stakeholders on recommended actions

**Use Consensus Builder Agent**: Invoke `./.claude/agents/consensus-builder.md`

**Consensus Building Process**:
1. **Review Evidence**: Ensure all stakeholders see the data
2. **Discuss Implications**: Explore what findings mean
3. **Evaluate Options**: Consider alternative responses
4. **Assess Trade-offs**: Make costs/benefits clear
5. **Reach Agreement**: Build consensus or escalate
6. **Document Decision**: Record rationale

**Output**: `./outputs/consensus-reports/[topic]-consensus-[date].md`

**Verification Checkpoint**:
- [ ] Stakeholders aligned
- [ ] Decisions made
- [ ] Actions agreed
- [ ] Owners assigned
- [ ] Timeline set

### Step 5.2: Create Action Plan
**Goal**: Define specific actions with owners and timelines

**Action Plan Template**:
```markdown
# Action Plan: [Topic]
Based on research completed: [Date]

## Immediate Actions (This Sprint)
| Action | Owner | Deadline | Status |
|--------|-------|----------|--------|
| Action 1 | Name | Date | 🟢 |
| Action 2 | Name | Date | 🟡 |

## Short-term Initiatives (This Quarter)
| Initiative | Owner | Target Quarter | Status |
|------------|-------|----------------|--------|
| Initiative 1 | Name | Q2 | 🟢 |
| Initiative 2 | Name | Q2 | 🔴 |

## Long-term Considerations (This Year+)
| Consideration | Owner | Timeline | Status |
|---------------|-------|----------|--------|
| Item 1 | Name | 2024 H2 | 🟡 |

## Success Metrics
| Metric | Current | Target | Timeline |
|--------|---------|--------|----------|
| Metric 1 | X | Y | Q2 |
| Metric 2 | A | B | Q3 |

## Review Schedule
- Weekly: Action item status updates
- Monthly: Metric tracking
- Quarterly: Impact assessment
```

**Verification Checkpoint**:
- [ ] All actions documented
- [ ] Clear owners assigned
- [ ] Realistic timelines
- [ ] Success metrics defined
- [ ] Review schedule set

### Step 5.3: Track and Validate
**Goal**: Monitor action implementation and validate predictions

**Tracking Activities**:
- Weekly action item status updates
- Monthly metric reviews
- Quarterly impact assessments
- Learning documentation (what worked, what didn't)

**Validation Questions**:
- Did predictions hold true?
- Did actions have expected impact?
- What surprised us?
- What would we do differently?
- What new questions emerged?

**Learning Capture**:
```markdown
# Research Validation: [Topic]
Original research: [Date]
Validation date: [Date]

## Predictions vs. Reality
| Prediction | Confidence | Outcome | Notes |
|------------|------------|---------|-------|
| Prediction 1 | 9/10 | ✓ Validated | Exactly as expected |
| Prediction 2 | 7/10 | ⚠ Partially | Impact smaller than expected |
| Prediction 3 | 6/10 | ❌ Invalidated | Context changed |

## Lessons Learned
- What we got right: [List]
- What we got wrong: [List]
- What we'd do differently: [List]
- New questions raised: [List]

## Process Improvements
- Methodology refinements: [List]
- Better questions to ask: [List]
- Additional sources to use: [List]
```

**Output**: `./research/validation/[topic]-validation-[date].md`

**Verification Checkpoint**:
- [ ] Tracking system in place
- [ ] Metrics monitored
- [ ] Validation ongoing
- [ ] Learnings documented
- [ ] Process improvements identified

## Quality Assurance Checklist

### Research Design Quality
- [ ] Objectives clearly defined
- [ ] Appropriate methods selected
- [ ] Adequate sample sizes
- [ ] Multiple sources used
- [ ] Bias mitigation planned

### Data Quality
- [ ] Data complete and accurate
- [ ] Sources reliable
- [ ] Methodology sound
- [ ] Proper documentation
- [ ] Privacy/ethics maintained

### Analysis Quality
- [ ] Appropriate techniques used
- [ ] Patterns validated across sources
- [ ] Alternative explanations considered
- [ ] Confidence levels calibrated
- [ ] Limitations acknowledged

### Insight Quality
- [ ] Insights surprising and non-obvious
- [ ] Evidence clearly supports conclusions
- [ ] Actionable implications
- [ ] Relevant to strategy
- [ ] Specific and concrete

### Communication Quality
- [ ] Report clear and comprehensive
- [ ] Findings accessible to non-researchers
- [ ] Visual aids effective
- [ ] Recommendations actionable
- [ ] Stakeholder buy-in achieved

## Integration Points

**Feeds into**:
- **Consensus Building**: Evidence for decision-making
- **Problem Decomposition**: Validated problem definition
- **PRD Framework**: Requirements validation
- **Feature Prioritization**: Evidence-based prioritization
- **Strategic Planning**: Market insights
- **Metrics & Analytics**: Baseline and tracking

**Receives input from**:
- **User Research**: Interviews, surveys, tests
- **Analytics Systems**: Behavioral data
- **Market Research**: Competitive and market analysis
- **Customer Feedback**: Support, sales, success teams

## Success Criteria

Research synthesis is successful when:
- [ ] Research objectives fully addressed
- [ ] Confidence level ≥7/10 on key findings
- [ ] Clear, actionable insights generated
- [ ] Stakeholders trust and use findings
- [ ] Insights influence product decisions
- [ ] Actions implemented successfully
- [ ] Predictions validated post-launch

## Tools and Templates

- Research Planning Canvas: `./.claude/templates/research-matrix.md`
- Evidence Log: `./.claude/templates/evidence-log.md`
- Research Report: `./.claude/templates/research-report.md`
- Research Synthesizer Agent: `./.claude/agents/research-synthesizer.md`
- Matrix Generator Agent: `./.claude/agents/matrix-generator.md`
- Consensus Builder Agent: `./.claude/agents/consensus-builder.md`

## Related Workflows

- User Research Synthesis: `./.claude/workflows/user-research-synthesis.md`
- Feature Prioritization: `./.claude/workflows/feature-prioritization.md`
- Problem Decomposition: `./.claude/workflows/problem-decomposition.md`
- Strategic Planning: `./.claude/workflows/strategic-planning.md`
