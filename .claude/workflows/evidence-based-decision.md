# Evidence-Based Decision Workflow

## Systematic Approach to Data-Driven Product Decisions

This workflow ensures product decisions are grounded in evidence, with appropriate confidence levels, clear rationale, and validation mechanisms.

## Overview

**Purpose**: Make product decisions systematically using evidence, reducing bias and increasing success rates

**When to use**:
- Significant product decisions (features, strategy, pivots)
- High-stakes choices with substantial impact
- Controversial decisions requiring justification
- Resource allocation decisions
- Strategic direction setting
- When assumptions need validation

**Outputs**:
- Evidence-based decision document
- Confidence assessment
- Decision rationale
- Validation plan
- Risk mitigation strategy

## Decision-Making Framework

### Decision Types

**Type 1 (Irreversible)**:
- One-way doors, difficult to reverse
- Examples: Platform choice, architecture, strategic pivots
- Approach: Extensive research, high confidence threshold (8+/10)
- Timeline: Take time needed (weeks to months)

**Type 2 (Reversible)**:
- Two-way doors, easy to reverse
- Examples: UI changes, feature experiments, marketing copy
- Approach: Quick research, lower confidence threshold (6+/10)
- Timeline: Make fast, iterate quickly (days to week)

### Evidence Quality Levels

**Level 1: Experimental/Causal** (Highest confidence)
- A/B tests, randomized controlled trials
- Directly tests hypothesis
- Controls for confounds
- Shows causation
- Confidence: 9-10/10

**Level 2: Observational/Correlational**
- Analytics, cohort studies, surveys
- Shows patterns and associations
- Cannot prove causation
- Requires triangulation
- Confidence: 6-8/10

**Level 3: Expert Opinion/Anecdotal**
- Expert judgments, individual stories
- Useful for exploration
- Cannot be relied upon alone
- Needs validation
- Confidence: 3-5/10

## Phase 1: Decision Framing (1-2 hours)

### Step 1.1: Define the Decision
**Goal**: Clearly articulate what needs to be decided

**Decision Statement Template**:
```markdown
# Decision: [Clear, concise statement]

## Context
**Problem**: [What problem are we solving?]
**Why Now**: [Why is this decision needed now?]
**Impact**: [Who/what is affected?]
**Type**: [Type 1 (Irreversible) or Type 2 (Reversible)]

## Decision Owner
**Accountable**: [Person who makes final decision]
**Consulted**: [Who provides input]
**Informed**: [Who needs to know outcome]

## Constraints
**Timeline**: [When must decision be made?]
**Budget**: [Financial constraints]
**Resources**: [People, time, technical constraints]
**Other**: [Regulatory, strategic, market constraints]

## Success Criteria
**How we'll know this was the right decision**:
1. [Criterion 1]
2. [Criterion 2]
3. [Criterion 3]
```

**Verification Checkpoint**:
- [ ] Decision clearly stated
- [ ] Context understood
- [ ] Owner identified
- [ ] Constraints documented
- [ ] Success criteria defined

### Step 1.2: Frame as Hypothesis
**Goal**: Convert decision into testable hypothesis

**Hypothesis Template**:
```markdown
## Hypothesis

**We believe that** [decision/action]
**Will result in** [outcome]
**For** [user segment/stakeholder]
**Because** [underlying theory/assumption]

**We'll know we're right when we see**:
- [Observable metric 1]
- [Observable metric 2]
- [Observable metric 3]

**Key Assumptions**:
1. [Assumption 1]
2. [Assumption 2]
3. [Assumption 3]

**Risks if Wrong**:
- [Risk 1]
- [Risk 2]
```

**Example**:
```markdown
We believe that adding social login
Will result in 20% increase in sign-up conversion
For new users
Because users prefer convenience over creating new passwords

We'll know we're right when we see:
- Sign-up conversion increases from 25% to 30%
- Time to first sign-up decreases by 50%
- Support tickets about password reset decrease by 30%

Key Assumptions:
1. Users trust social login providers
2. Users have active social accounts
3. Implementation won't have privacy concerns

Risks if Wrong:
- Development effort wasted (3 person-months)
- User privacy concerns
- No impact on conversion
```

**Verification Checkpoint**:
- [ ] Hypothesis clearly stated
- [ ] Outcome measurable
- [ ] Assumptions explicit
- [ ] Success metrics defined
- [ ] Risks identified

### Step 1.3: Identify Information Needs
**Goal**: Determine what evidence is needed

**Information Needs Template**:
```markdown
## Questions to Answer

**Primary Questions** (Must answer):
1. [Question 1]
2. [Question 2]
3. [Question 3]

**Secondary Questions** (Nice to answer):
1. [Question 1]
2. [Question 2]

## Evidence Required

**For Confidence Level 8/10, we need**:
- [ ] Evidence type 1 (e.g., user research showing demand)
- [ ] Evidence type 2 (e.g., analytics showing current behavior)
- [ ] Evidence type 3 (e.g., competitive analysis showing standard)

**Current Evidence Gaps**:
- Gap 1: [What we don't know]
- Gap 2: [What we don't know]

**Research Plan**:
[How we'll fill gaps - see Research Synthesis workflow]
```

**Verification Checkpoint**:
- [ ] Key questions identified
- [ ] Evidence needs clear
- [ ] Gaps identified
- [ ] Research plan created
- [ ] Timeline realistic

## Phase 2: Evidence Gathering (1-2 weeks)

### Step 2.1: Collect Existing Evidence
**Goal**: Gather all available relevant data

**Use Research Synthesizer Agent**: Invoke `./.claude/agents/research-synthesizer.md`

**Evidence Sources**:

**Internal Data**:
- Product analytics (user behavior)
- Previous research studies
- Customer feedback (support, sales, success)
- Past decisions and outcomes
- Engineering constraints

**External Data**:
- Market research reports
- Competitive analysis
- Industry benchmarks
- Academic research
- Expert consultations

**User Research**:
- Existing user interviews
- Survey results
- Usability tests
- A/B test results
- User feedback

**Organization**:
- Create evidence log: `./.claude/templates/evidence-log.md`
- Tag by relevance to questions
- Note quality and confidence
- Document sources
- Identify contradictions

**Verification Checkpoint**:
- [ ] All available evidence collected
- [ ] Evidence logged and organized
- [ ] Quality assessed
- [ ] Sources documented
- [ ] Gaps noted

### Step 2.2: Conduct New Research (if needed)
**Goal**: Fill critical evidence gaps

**Research Methods** (by speed and confidence):

**Fast & Moderate Confidence** (1-3 days):
- Analytics deep-dive
- Competitor feature audit
- Internal expert interviews
- Quick user surveys (n=100+)

**Medium & High Confidence** (1-2 weeks):
- User interviews (n=15-20)
- Usability testing
- Comprehensive surveys (n=500+)
- A/B tests (if quick to implement)

**Slow & Highest Confidence** (3-4 weeks+):
- Large-scale A/B tests
- Longitudinal studies
- Comprehensive market research
- Multiple method triangulation

**Decision Rule**:
- Type 1 decisions: Invest in high-confidence research
- Type 2 decisions: Quick research, iterate and learn
- Critical assumptions: Validate with highest confidence methods

**See**: `./.claude/workflows/research-synthesis.md` for full research process

**Verification Checkpoint**:
- [ ] Research plan executed
- [ ] Critical gaps filled
- [ ] New evidence logged
- [ ] Quality verified
- [ ] Ready for analysis

### Step 2.3: Evaluate Evidence Quality
**Goal**: Assess reliability of evidence

**Use Research Synthesizer Agent**: Invoke `./.claude/agents/research-synthesizer.md`

**Evidence Quality Matrix**:
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
│ Weighted Score: 4.4/5.0                                     │
│ Confidence Level: HIGH (good diversity, strong quality)     │
└──────────────────────────────────────────────────────────────┘
```

**Output**: `./outputs/evidence-logs/[decision]-quality-[date].md`

**Verification Checkpoint**:
- [ ] All evidence quality-rated
- [ ] Overall confidence assessed
- [ ] Weak evidence flagged
- [ ] Biases identified
- [ ] Documented in evidence log

## Phase 3: Evidence Analysis (2-3 days)

### Step 3.1: Synthesize Findings
**Goal**: Identify what the evidence tells us

**Use Matrix Generator Agent**: Invoke `./.claude/agents/matrix-generator.md`

**Research Synthesis Matrix**:
```
┌──────────────┬──────────┬──────────┬──────────┬──────────┬─────┐
│ Finding      │Source 1  │Source 2  │Source 3  │Source 4  │Conf.│
├──────────────┼──────────┼──────────┼──────────┼──────────┼─────┤
│ [Finding 1]  │ Evidence │ Evidence │ Evidence │ Evidence │ 9.2 │
│ [Finding 2]  │ Evidence │ Evidence │ ---      │ Evidence │ 7.5 │
│ [Finding 3]  │ Evidence │ ---      │ ---      │ ---      │ 4.1 │
└──────────────┴──────────┴──────────┴──────────┴──────────┴─────┘

Key Patterns:
✓ Converging Evidence: [Where sources agree - high confidence]
⚠ Diverging Evidence: [Where sources conflict - investigate]
? Knowledge Gaps: [What we still don't know]
```

**Findings Summary**:
```markdown
## What the Evidence Says

### Supporting Evidence
**Finding 1**: [Summary]
- Sources: [List]
- Confidence: 9/10
- How this informs decision: [Explanation]

**Finding 2**: [Summary]
- Sources: [List]
- Confidence: 7/10
- How this informs decision: [Explanation]

### Conflicting Evidence
**Conflict 1**: [Description]
- Source A says: [Position]
- Source B says: [Different position]
- Likely reason: [Analysis]
- Resolution: [How we reconciled]

### Remaining Unknowns
- Unknown 1: [What we still don't know]
- Unknown 2: [What we still don't know]
```

**Verification Checkpoint**:
- [ ] All evidence synthesized
- [ ] Patterns identified
- [ ] Conflicts analyzed
- [ ] Unknowns documented
- [ ] Confidence assessed

### Step 3.2: Validate Assumptions
**Goal**: Test critical assumptions underlying the decision

**Assumption Testing**:
```markdown
## Assumption Validation

### Assumption 1: [Statement]
**Critical?**: [Yes/No - would invalidate decision if wrong]
**Evidence**:
- Supporting: [What supports this]
- Contradicting: [What contradicts this]
**Confidence**: [High/Medium/Low]
**Validated?**: ✓/⚠/❌

### Assumption 2: [Statement]
**Critical?**: [Yes/No]
**Evidence**:
- Supporting: [What supports this]
- Contradicting: [What contradicts this]
**Confidence**: [High/Medium/Low]
**Validated?**: ✓/⚠/❌

[Repeat for all assumptions]

## Summary
**Critical assumptions validated**: X/Y
**Risk level**: [If critical assumptions not validated]
**Recommendation**: [Proceed/More research/Reconsider]
```

**Verification Checkpoint**:
- [ ] All assumptions tested
- [ ] Critical assumptions validated
- [ ] Risks understood
- [ ] Confidence appropriate
- [ ] Go/no-go clear

### Step 3.3: Assess Decision Confidence
**Goal**: Calculate overall confidence in decision

**Confidence Scoring**:
```markdown
## Decision Confidence Assessment

### Evidence Quality
- Number of sources: X
- Average quality score: Y/5
- Source diversity: [High/Medium/Low]
- Triangulation: [Strong/Moderate/Weak]
**Score**: X/10

### Assumption Validation
- Critical assumptions validated: X/Y
- Confidence in assumptions: [High/Medium/Low]
**Score**: X/10

### Alignment with Strategy
- Strategic fit: [Strong/Moderate/Weak]
- Resource availability: [Yes/Constrained/No]
**Score**: X/10

### Risk Assessment
- Reversibility: [Easy/Moderate/Difficult]
- Downside risk: [Low/Medium/High]
- Unknowns: [Few/Some/Many]
**Score**: X/10

## Overall Confidence
**Total Score**: (Sum of above)/4 = X.X/10

**Interpretation**:
- 9-10: Very High - Strong evidence, proceed confidently
- 7-8: High - Good evidence, proceed with monitoring
- 5-6: Medium - Some gaps, proceed with caution or more research
- 3-4: Low - Significant gaps, need more research
- 1-2: Very Low - Insufficient evidence, do not proceed

**Decision**:
- Confidence ≥7 AND Type 2 decision: Proceed
- Confidence ≥8 AND Type 1 decision: Proceed
- Confidence <7 AND Type 2 decision: Proceed with monitoring
- Confidence <8 AND Type 1 decision: More research or reconsider
```

**Verification Checkpoint**:
- [ ] Confidence calculated
- [ ] Scoring rationale clear
- [ ] Appropriate for decision type
- [ ] Gaps vs. confidence trade-off assessed
- [ ] Clear go/no-go recommendation

## Phase 4: Decision Making (1-2 days)

### Step 4.1: Evaluate Options
**Goal**: Compare alternatives systematically

**Use Matrix Generator Agent**: Invoke `./.claude/agents/matrix-generator.md`

**If multiple options exist**:
- Create MCDA matrix (see `./.claude/workflows/matrix-generation.md`)
- Weight criteria
- Score options
- Calculate totals
- Sensitivity analysis

**If single option (yes/no decision)**:
```markdown
## Go/No-Go Analysis

### Benefits (Why Yes)
1. [Benefit 1] - Evidence: [Source]
2. [Benefit 2] - Evidence: [Source]
3. [Benefit 3] - Evidence: [Source]

### Costs (Why No)
1. [Cost 1] - Evidence: [Source]
2. [Cost 2] - Evidence: [Source]
3. [Cost 3] - Evidence: [Source]

### Net Assessment
**Benefits outweigh costs?**: [Yes/No]
**Confidence in assessment**: [X/10]
**Recommendation**: [Go/No-Go]
```

**Verification Checkpoint**:
- [ ] Options evaluated systematically
- [ ] Evidence-based scoring
- [ ] Trade-offs explicit
- [ ] Recommendation clear
- [ ] Rationale documented

### Step 4.2: Build Consensus
**Goal**: Align stakeholders on decision

**Use Consensus Builder Agent**: Invoke `./.claude/agents/consensus-builder.md`

**See**: `./.claude/workflows/consensus-report.md` for full process

**Quick Consensus Check**:
- Share evidence synthesis
- Present recommendation
- Discuss concerns
- Address objections
- Document alignment
- Assign action items

**Consensus Documentation**:
```markdown
## Stakeholder Alignment

**Alignment Score**: X.X/5.0
**Support Level**:
- Strong support: [Names]
- Support with reservations: [Names]
- Neutral: [Names]
- Disagree but commit: [Names]
- Oppose: [Names]

**Key Concerns Raised**:
1. [Concern 1] - Resolution: [How addressed]
2. [Concern 2] - Resolution: [How addressed]

**Decision Status**: [Consensus reached / Escalation needed]
```

**Verification Checkpoint**:
- [ ] Stakeholders consulted
- [ ] Evidence shared
- [ ] Concerns addressed
- [ ] Alignment achieved
- [ ] Consensus documented

### Step 4.3: Make and Document Decision
**Goal**: Formally decide and record rationale

**Decision Document Template**:
```markdown
# Decision: [Name]
**Date**: [YYYY-MM-DD]
**Owner**: [Name]
**Status**: [Proposed/Accepted/Implemented]

## Executive Summary
**Decision**: [One sentence]
**Confidence**: X/10
**Expected Impact**: [Brief description]

## Context
[Background and why decision was needed]

## Evidence Summary
**Supporting evidence**:
- [Key finding 1] (Confidence: X/10)
- [Key finding 2] (Confidence: X/10)
- [Key finding 3] (Confidence: X/10)

**Overall confidence**: X/10 based on:
- X sources, average quality Y/5
- Z critical assumptions validated
- [Strong/Moderate/Weak] triangulation

## Options Considered
1. **[Chosen option]** ← Selected
2. [Alternative 1]
3. [Alternative 2]

## Decision Rationale
**Why we chose [option]**:
1. [Reason 1] - Evidence: [Source]
2. [Reason 2] - Evidence: [Source]
3. [Reason 3] - Evidence: [Source]

**Why we didn't choose alternatives**:
- [Alternative 1]: [Why not]
- [Alternative 2]: [Why not]

## Trade-offs Accepted
- We're accepting: [Trade-off 1]
- In exchange for: [Benefit 1]
- We're accepting: [Trade-off 2]
- In exchange for: [Benefit 2]

## Assumptions
**Critical assumptions** (if wrong, decision fails):
1. [Assumption 1] - Validated: [Yes/No]
2. [Assumption 2] - Validated: [Yes/No]

**Secondary assumptions**:
1. [Assumption 3]
2. [Assumption 4]

## Stakeholder Alignment
**Alignment score**: X/5
[See stakeholder section above]

## Risks and Mitigation
| Risk | Probability | Impact | Mitigation |
|------|-------------|--------|------------|
|Risk 1| H/M/L       | H/M/L  |[Strategy]  |
|Risk 2| H/M/L       | H/M/L  |[Strategy]  |

## Success Metrics
**We'll know this was the right decision when**:
| Metric | Baseline | Target | Timeline |
|--------|----------|--------|----------|
|Metric 1| X        | Y      | Date     |
|Metric 2| A        | B      | Date     |

## Implementation Plan
- [ ] Action 1 - Owner: [Name], Due: [Date]
- [ ] Action 2 - Owner: [Name], Due: [Date]
- [ ] Action 3 - Owner: [Name], Due: [Date]

## Validation Plan
**How we'll validate**:
- [Validation method 1]
- [Validation method 2]

**Review schedule**:
- Check-in 1: [Date]
- Check-in 2: [Date]
- Full review: [Date]

## Links
- Evidence log: [Link]
- Research synthesis: [Link]
- Consensus report: [Link]
- Related decisions: [Links]

## Review/Update Log
| Date | Change | Reason |
|------|--------|--------|
|[Date]|[Change]|[Reason]|
```

**Output**: `./decisions/[decision]-[date].md`

**Verification Checkpoint**:
- [ ] Decision clearly stated
- [ ] Rationale evidence-based
- [ ] Trade-offs explicit
- [ ] Risks identified
- [ ] Success metrics defined
- [ ] Validation plan created

## Phase 5: Validation and Learning (Ongoing)

### Step 5.1: Implement with Monitoring
**Goal**: Execute decision while tracking early signals

**Implementation Monitoring**:
```markdown
## Implementation Tracker

### Week 1
- Action items status: [Progress]
- Early signals: [What we're seeing]
- Unexpected issues: [Any surprises]
- Adjustments made: [Any changes]

### Week 2
- Action items status: [Progress]
- Early signals: [What we're seeing]
- Unexpected issues: [Any surprises]
- Adjustments made: [Any changes]

[Continue weekly]
```

**Early Warning Indicators**:
- Leading metrics trending wrong direction
- Implementation harder than expected
- User/stakeholder negative feedback
- Assumptions proving incorrect
- New information contradicts decision

**If warnings emerge**:
- Investigate immediately
- Reassess confidence
- Consider pivoting/reversing
- Document learnings

**Verification Checkpoint**:
- [ ] Implementation tracking active
- [ ] Metrics monitored
- [ ] Issues documented
- [ ] Course corrections made
- [ ] Communication ongoing

### Step 5.2: Measure Outcomes
**Goal**: Assess whether decision achieved expected results

**Outcome Measurement**:
```markdown
## Outcome Assessment
**Decision date**: [Original date]
**Assessment date**: [Current date]
**Time elapsed**: [Duration]

### Success Metrics Results
| Metric | Baseline | Target | Actual | Status |
|--------|----------|--------|--------|--------|
|Metric 1| X        | Y      | Z      | ✓/⚠/❌  |
|Metric 2| A        | B      | C      | ✓/⚠/❌  |

### Predicted vs. Reality
| Prediction | Confidence | Outcome | Accuracy |
|------------|------------|---------|----------|
|Prediction 1| X/10       | [Result]| ✓/⚠/❌    |
|Prediction 2| X/10       | [Result]| ✓/⚠/❌    |

### Overall Assessment
**Success level**: [Complete/Partial/Failure]
**Confidence calibration**: [Were we appropriately confident?]
**What we got right**: [List]
**What we got wrong**: [List]
```

**Verification Checkpoint**:
- [ ] Metrics measured
- [ ] Outcomes assessed
- [ ] Success/failure determined
- [ ] Confidence calibration checked
- [ ] Results documented

### Step 5.3: Extract Learnings
**Goal**: Improve future decision-making

**Learning Template**:
```markdown
# Decision Retrospective: [Decision Name]

## What We Learned

### About the Decision
- **What worked**: [What aspects were successful]
- **What didn't**: [What aspects failed]
- **Surprises**: [Unexpected outcomes]

### About the Process
- **Evidence quality**: [Was evidence sufficient?]
- **Research methods**: [What methods were most valuable?]
- **Confidence calibration**: [Were we over/under confident?]
- **Stakeholder alignment**: [Was consensus process effective?]

### About the Product/Market
- **User behavior**: [What we learned about users]
- **Market dynamics**: [What we learned about market]
- **Technical**: [What we learned about implementation]

## Process Improvements
**For next time**:
1. [Improvement 1]
2. [Improvement 2]
3. [Improvement 3]

## Knowledge Captured
- Updated assumptions: [New understanding]
- New evidence: [What we learned]
- Better questions: [What to ask next time]
- Refined methods: [Better research approaches]

## Related Decisions
This learning informs:
- [Related decision 1]
- [Related decision 2]
```

**Output**: `./decisions/learnings/[decision]-retrospective-[date].md`

**Verification Checkpoint**:
- [ ] Retrospective completed
- [ ] Learnings documented
- [ ] Process improvements identified
- [ ] Knowledge shared
- [ ] Applied to future decisions

## Quality Assurance Checklist

### Decision Framing
- [ ] Decision clearly defined
- [ ] Framed as testable hypothesis
- [ ] Success metrics defined
- [ ] Constraints understood
- [ ] Decision type identified

### Evidence Quality
- [ ] Multiple sources used
- [ ] Quality assessed
- [ ] Sources documented
- [ ] Biases identified
- [ ] Confidence appropriate

### Analysis Rigor
- [ ] Evidence synthesized
- [ ] Assumptions validated
- [ ] Confidence calculated
- [ ] Options compared systematically
- [ ] Limitations acknowledged

### Decision Documentation
- [ ] Rationale clear and evidence-based
- [ ] Trade-offs explicit
- [ ] Risks identified with mitigation
- [ ] Success metrics defined
- [ ] Validation plan created

### Validation
- [ ] Implementation monitored
- [ ] Outcomes measured
- [ ] Learnings extracted
- [ ] Process improved
- [ ] Knowledge captured

## Integration Points

**Receives input from**:
- Research Synthesizer (evidence gathering and synthesis)
- Matrix Generator (option evaluation)
- Consensus Builder (stakeholder alignment)
- Risk Assessment (risk identification)

**Feeds into**:
- PRD Framework (validated requirements)
- Strategic Planning (strategic decisions)
- Problem Decomposition (problem validation)
- Feature Prioritization (prioritization decisions)
- Organizational learning (decision library)

## Success Criteria

Evidence-based decision-making is successful when:
- [ ] Decisions grounded in evidence (not opinion)
- [ ] Confidence levels appropriate
- [ ] Stakeholder buy-in achieved
- [ ] Implementation successful
- [ ] Outcomes match predictions ≥70% of time
- [ ] Learnings captured and applied
- [ ] Process continuously improving

## Tools and Templates

- Evidence Log: `./.claude/templates/evidence-log.md`
- Decision Template: `./.claude/templates/decision-template.md`
- Research Synthesizer Agent: `./.claude/agents/research-synthesizer.md`
- Consensus Builder Agent: `./.claude/agents/consensus-builder.md`
- Matrix Generator Agent: `./.claude/agents/matrix-generator.md`

## Related Workflows

- Research Synthesis: `./.claude/workflows/research-synthesis.md`
- Consensus Building: `./.claude/workflows/consensus-report.md`
- Matrix Generation: `./.claude/workflows/matrix-generation.md`
- Problem Decomposition: `./.claude/workflows/problem-decomposition.md`
- Feature Prioritization: `./.claude/workflows/feature-prioritization.md`
