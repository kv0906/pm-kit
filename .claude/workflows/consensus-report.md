# Consensus Report Workflow

## Systematic Stakeholder Alignment and Decision Documentation

This workflow provides a structured approach to building stakeholder consensus, resolving conflicts, and documenting decisions with full rationale and buy-in across the organization.

## Overview

**Purpose**: Facilitate alignment among diverse stakeholders and create comprehensive decision documentation

**When to use**:
- High-stakes decisions affecting multiple teams
- Significant disagreement or conflict among stakeholders
- Complex trade-offs requiring negotiation
- Decisions needing cross-functional buy-in
- Strategic direction setting
- Resource allocation decisions

**Outputs**:
- Consensus report with alignment scores
- Stakeholder position matrix
- Decision rationale documentation
- Action plan with owners
- Risk assessment and mitigation plan

## Phase 1: Preparation (1-2 days)

### Step 1.1: Identify the Decision
**Goal**: Clearly define what needs to be decided

**Decision Statement Template**:
```markdown
# Decision: [Clear, concise statement]

**Context**:
[Background information, why this decision is needed now]

**Scope**:
- In scope: [What this decision covers]
- Out of scope: [What this decision does not cover]

**Impact**:
- Teams affected: [List]
- Users affected: [Number/segments]
- Timeline: [When decision needed, when implemented]
- Resources: [Budget, people, time implications]

**Constraints**:
- Technical: [Technical limitations]
- Business: [Budget, timeline, strategic constraints]
- Regulatory: [Compliance requirements]
- Resource: [Team capacity, skill availability]
```

**Verification Checkpoint**:
- [ ] Decision clearly stated
- [ ] Context understood
- [ ] Scope defined
- [ ] Impact assessed
- [ ] Constraints identified

### Step 1.2: Map Stakeholders
**Goal**: Identify all parties who should have input or be informed

**Stakeholder Mapping**:

**Power-Interest Matrix**:
```
High Power  │ KEEP SATISFIED│ MANAGE CLOSELY│
            │ (Inform)      │ (Engage)      │
────────────┼───────────────┼───────────────┤
Low Power   │ MONITOR       │ KEEP INFORMED │
            │               │ (Consult)     │
            │               │               │
           Low Interest   High Interest
```

**Stakeholder List Template**:
| Stakeholder | Role | Interest | Power | Approach |
|-------------|------|----------|-------|----------|
| Engineering Lead | Technical feasibility | High | High | Manage Closely |
| Design Lead | UX implications | High | High | Manage Closely |
| Sales VP | Revenue impact | High | High | Manage Closely |
| Support Manager | User impact | High | Medium | Keep Informed |
| Product team | Strategy | High | High | Manage Closely |

**Verification Checkpoint**:
- [ ] All key stakeholders identified
- [ ] Roles and responsibilities clear
- [ ] Interest levels assessed
- [ ] Power dynamics understood
- [ ] Engagement approach planned

### Step 1.3: Gather Background Evidence
**Goal**: Collect relevant data to inform the decision

**Use Research Synthesizer Agent**: Invoke `./.claude/agents/research-synthesizer.md`

**Evidence to Gather**:
- User research findings
- Analytics and metrics
- Competitive analysis
- Market trends
- Technical constraints
- Business case data
- Previous decisions and outcomes
- Expert opinions

**Evidence Log**: Use `./.claude/templates/evidence-log.md`

**Verification Checkpoint**:
- [ ] Relevant evidence collected
- [ ] Evidence quality assessed
- [ ] Sources documented
- [ ] Evidence synthesis complete
- [ ] Ready to share with stakeholders

## Phase 2: Position Collection (2-3 days)

### Step 2.1: Individual Stakeholder Interviews
**Goal**: Understand each stakeholder's position, interests, and concerns

**Interview Structure** (30-45 minutes each):

**1. Context Setting** (5 min):
- Explain the decision to be made
- Share relevant background and constraints
- Clarify the process and timeline

**2. Position Gathering** (15-20 min):
- "What's your position on this decision?"
- "What priority would you assign? (P0-P3)"
- "What's driving that position?"
- "What concerns do you have?"
- "What would need to be true for you to support an alternative?"

**3. Interest Exploration** (10-15 min):
- "What's the underlying concern or goal?"
- "What success looks like from your perspective?"
- "What's non-negotiable vs. flexible?"
- "What trade-offs would you be willing to make?"

**4. Evidence Review** (5-10 min):
- Share relevant research/data
- "Does this change your perspective?"
- "What additional information would help?"

**Position Capture Template**:
```markdown
## Stakeholder: [Name/Role]
**Date**: [YYYY-MM-DD]

**Position**: [What they advocate for]

**Priority**: P[0-3]
- P0: Critical, blocking, must-have
- P1: Important, high priority
- P2: Valuable, medium priority
- P3: Nice-to-have, low priority

**Reasoning**:
[Why they hold this position]

**Underlying Interests**:
[What they're really trying to achieve]

**Key Concerns**:
- [Concern 1]
- [Concern 2]
- [Concern 3]

**Evidence Supporting Position**:
- [Data point 1]
- [Data point 2]

**Trade-offs Willing to Make**:
- [What they'd accept as compromise]

**Red Lines** (Non-negotiable):
- [Absolute requirements]

**Success Metrics**:
[How they'd measure success]

**Confidence in Position**: [High/Medium/Low]
```

**Verification Checkpoint**:
- [ ] All key stakeholders interviewed
- [ ] Positions clearly documented
- [ ] Interests understood
- [ ] Concerns captured
- [ ] Trade-offs identified

### Step 2.2: Create Stakeholder Position Matrix
**Goal**: Visualize alignment and misalignment across stakeholders

**Use Matrix Generator Agent**: Invoke `./.claude/agents/matrix-generator.md`

**Position Matrix Format**:
```
┌───────────────┬────────────┬────────────┬──────────┬──────────┐
│ Feature/Issue │ Engineering│   Design   │  Sales   │  Support │
├───────────────┼────────────┼────────────┼──────────┼──────────┤
│ [Decision]    │            │            │          │          │
├───────────────┼────────────┼────────────┼──────────┼──────────┤
│ Position      │ [Position] │ [Position] │[Position]│[Position]│
│ Priority      │ P[0-3]     │ P[0-3]     │ P[0-3]   │ P[0-3]   │
│ Reasoning     │ [Why]      │ [Why]      │ [Why]    │ [Why]    │
│ Key Concern   │ [Concern]  │ [Concern]  │[Concern] │[Concern] │
│ Success Metric│ [Metric]   │ [Metric]   │ [Metric] │ [Metric] │
└───────────────┴────────────┴────────────┴──────────┴──────────┘

Initial Alignment Score: X.X/5.0
- Full alignment (all P0 or all P3): 5.0
- Strong alignment (within 1 P-level): 4.0
- Moderate alignment (within 2 P-levels): 3.0
- Weak alignment (wide spread): 2.0
- No alignment (active conflicts): 1.0
```

**Output**: `./outputs/consensus-reports/[topic]-positions-[date].md`

**Verification Checkpoint**:
- [ ] All positions documented in matrix
- [ ] Alignment/misalignment visible
- [ ] Conflicts identified
- [ ] Consensus opportunities spotted
- [ ] Matrix shared with stakeholders

## Phase 3: Conflict Analysis and Resolution (2-4 days)

### Step 3.1: Identify and Analyze Conflicts
**Goal**: Understand the nature and root cause of disagreements

**Use Consensus Builder Agent**: Invoke `./.claude/agents/consensus-builder.md`

**Conflict Types**:
- **Priority Conflicts**: Different urgency assessments
- **Approach Conflicts**: Different solution preferences
- **Resource Conflicts**: Limited capacity allocation
- **Value Conflicts**: Different success definitions
- **Scope Conflicts**: Different feature requirements
- **Timeline Conflicts**: Different schedule needs

**Conflict Analysis Template**:
```markdown
## Conflict: [Description]

**Type**: [Priority/Approach/Resource/Value/Scope/Timeline]

**Severity**: [1-5]
- 5: Fundamental disagreement blocking progress
- 4: Major conflict requiring leadership escalation
- 3: Moderate conflict needing facilitation
- 2: Minor disagreement, easily resolved
- 1: Slight difference in preference

**Parties**:
- Position A: [Stakeholder(s)] want [X]
- Position B: [Stakeholder(s)] want [Y]

**Root Cause Analysis**:
- **Surface positions**: What stakeholders are saying
- **Underlying interests**: What they really need
- **Real issue**: Information gap, value difference, or misunderstanding?

**Impact if Unresolved**:
[What happens if we don't resolve this]

**Resolution Approaches**:
1. [Potential resolution 1]
2. [Potential resolution 2]
3. [Potential resolution 3]
```

**Verification Checkpoint**:
- [ ] All conflicts identified
- [ ] Severity assessed
- [ ] Root causes understood
- [ ] Resolution approaches explored
- [ ] Ready for facilitation

### Step 3.2: Facilitate Group Discussion
**Goal**: Bring stakeholders together to build shared understanding

**Discussion Session Structure** (90-120 minutes):

**1. Opening** (10 min):
- Review decision context
- Share stakeholder position matrix
- Present evidence summary
- Set ground rules for discussion

**2. Evidence Presentation** (20 min):
- Share research findings
- Present data and analytics
- Show competitive landscape
- Clarify constraints

**3. Position Sharing** (30 min):
- Each stakeholder presents their position (5 min each)
- Questions for clarification only
- No debate yet
- Identify commonalities

**4. Conflict Exploration** (30 min):
- Address each major conflict
- Focus on interests, not positions
- Ask "Why?" to understand concerns
- Explore creative alternatives

**5. Option Generation** (20 min):
- Brainstorm alternative solutions
- Challenge assumptions
- Combine elements from different proposals
- Consider phased approaches

**6. Consensus Building** (20 min):
- Evaluate options against criteria
- Assess trade-offs
- Test for agreement
- Document decisions or next steps

**Facilitation Techniques**:
- **Active Listening**: Reflect back what you hear
- **Neutral Summarizing**: Restate without judgment
- **Time-boxing**: Keep discussions on track
- **Parking Lot**: Capture tangents for later
- **Building**: "Yes, and..." not "Yes, but..."

**Verification Checkpoint**:
- [ ] All stakeholders heard
- [ ] Evidence considered
- [ ] Alternatives explored
- [ ] Movement toward consensus
- [ ] Next steps clear

### Step 3.3: Negotiate Compromises
**Goal**: Find win-win solutions or acceptable trade-offs

**Negotiation Strategies**:

**Interest-Based Approach**:
1. Separate people from the problem
2. Focus on interests, not positions
3. Generate options for mutual gain
4. Use objective criteria

**Creative Solutions**:
- **Expand the pie**: Find additional resources
- **Phase the solution**: Do both, sequentially
- **Hybrid approach**: Combine elements
- **Experiment**: Run a test to learn
- **Trade across issues**: Give on X, get on Y

**Trade-off Framework**:
```
┌───────────────────────────────────────────────────────┐
│ CONFLICT: Engineering wants 3 sprints, Sales needs 1  │
├───────────────────────────────────────────────────────┤
│ POSITIONS             │ INTERESTS                     │
├───────────────────────┼───────────────────────────────┤
│ Eng: "Need 3 sprints" │ Eng: Ensure security & quality│
│ Sales: "Need 1 sprint"│ Sales: Close Q1 deals         │
├───────────────────────┴───────────────────────────────┤
│ OPTIONS FOR MUTUAL GAIN                               │
├───────────────────────────────────────────────────────┤
│ 1. MVP in 1 sprint (basic) + Full in 3 sprints       │
│ 2. Beta for enterprise while building                │
│ 3. Partner integration as temporary solution         │
│ 4. Dedicated engineer to accelerate                  │
├───────────────────────────────────────────────────────┤
│ CONSENSUS DECISION                                    │
│ Option 1: MVP for demos, full implementation by Q2   │
│ Eng: ✓ Quality  Sales: ✓ Demos  Design: ✓ Iterate  │
└───────────────────────────────────────────────────────┘
```

**Verification Checkpoint**:
- [ ] Compromises identified
- [ ] Win-win elements found
- [ ] Trade-offs explicit
- [ ] All parties can live with solution
- [ ] Commitments documented

## Phase 4: Decision Documentation (1-2 days)

### Step 4.1: Calculate Final Alignment Score
**Goal**: Quantify the level of consensus achieved

**Alignment Scoring**:
```
Alignment Score Calculation:

1. Priority Alignment:
   - Calculate average priority across stakeholders
   - Assess spread (standard deviation)
   - P0 ≈ 0, P1 ≈ 1, P2 ≈ 2, P3 ≈ 3

2. Position Alignment:
   - Support: +2 points
   - Neutral / Can live with it: +1 point
   - Disagree but commit: 0 points
   - Active opposition: -1 point

3. Overall Alignment Score (0-5):
   5.0: Full consensus, enthusiastic agreement
   4.0: Strong alignment, minor concerns addressed
   3.0: Moderate alignment, can commit despite reservations
   2.0: Weak alignment, significant concerns remain
   1.0: No alignment, fundamental disagreement

Example:
4 stakeholders: 2 Support (+2), 1 Neutral (+1), 1 Disagree-but-commit (0)
Score: (2+2+1+0)/4 = 1.25 × 4 = 4.2/5.0
```

**Verification Checkpoint**:
- [ ] Alignment score calculated
- [ ] Methodology documented
- [ ] Score reflects reality
- [ ] Confidence level assessed

### Step 4.2: Create Comprehensive Consensus Report
**Goal**: Document the full decision-making process and outcome

**Use Template**: `./.claude/templates/consensus-template.md`

**Consensus Report Structure**:
```markdown
# Consensus Report: [Decision Name]
**Date**: [YYYY-MM-DD]
**Facilitator**: [PM Name]
**Participants**: [List of stakeholders]

## Executive Summary
**Decision**: [One-sentence summary of what was decided]

**Alignment Score**: X.X/5.0
- Interpretation: [Strong/Moderate/Weak consensus]

**Confidence Level**: [HIGH/MEDIUM/LOW]
- Evidence quality: [Assessment]
- Stakeholder buy-in: [Assessment]
- Risk level: [Assessment]

**Implementation Status**: [Ready/Needs Work/Blocked]

## Context
**Background**:
[Why this decision was needed]

**Scope**:
- In scope: [What this covers]
- Out of scope: [What this doesn't cover]

**Constraints**:
[Technical, business, resource, timeline constraints]

## Stakeholder Positions

### Initial Positions
[Stakeholder position matrix from Phase 2]

### Position Evolution
[How positions changed through discussion]

### Final Positions
┌────────────┬──────────────┬──────────┬────────────┬─────────┐
│Stakeholder │Final Position│Priority  │ Level of   │Comments │
│            │              │          │ Support    │         │
├────────────┼──────────────┼──────────┼────────────┼─────────┤
│Engineering │[Position]    │P[0-3]    │Support/    │[Notes]  │
│            │              │          │Neutral/    │         │
│            │              │          │Commit      │         │
├────────────┼──────────────┼──────────┼────────────┼─────────┤
│Design      │[Position]    │P[0-3]    │[Level]     │[Notes]  │
├────────────┼──────────────┼──────────┼────────────┼─────────┤
│Sales       │[Position]    │P[0-3]    │[Level]     │[Notes]  │
├────────────┼──────────────┼──────────┼────────────┼─────────┤
│Support     │[Position]    │P[0-3]    │[Level]     │[Notes]  │
└────────────┴──────────────┴──────────┴────────────┴─────────┘

## Evidence Review

### Supporting Evidence (X sources)
1. **Finding 1**: [Description]
   - Source: [Name]
   - Confidence: X/10
   - How it informed decision: [Explanation]

2. **Finding 2**: [Description]
   - Source: [Name]
   - Confidence: X/10
   - How it informed decision: [Explanation]

### Conflicting Evidence (Y sources)
1. **Conflict 1**: [Description]
   - How resolved: [Explanation]

[Research synthesis matrix if helpful]

## Consensus Building Process

### Phase 1: Initial Assessment
- Starting alignment: X.X/5.0
- Key disagreements: [List]
- Level of conflict: [High/Medium/Low]

### Phase 2: Discussion and Negotiation
**Key Discussion Points**:
1. [Discussion point 1]
   - Impact: [What changed]

2. [Discussion point 2]
   - Impact: [What changed]

**Compromises Negotiated**:
- Engineering agreed to: [Compromise]
- Sales agreed to: [Compromise]
- Design agreed to: [Compromise]

### Phase 3: Final Agreement
- Final alignment: X.X/5.0
- Improvement: +X.X points
- Remaining concerns: [List if any]

## Decision Analysis

### Options Considered
1. **Option A**: [Description]
2. **Option B**: [Description]
3. **Option C**: [Description]

### Decision Matrix
[Use Matrix Generator for multi-criteria analysis]
┌─────────────┬────────┬────────┬────────┬────────┬────────┐
│ Criteria    │ Weight │Option A│Option B│Option C│ Chosen │
├─────────────┼────────┼────────┼────────┼────────┼────────┤
│User Impact  │  30%   │ 8/10   │ 6/10   │ 9/10   │        │
│Feasibility  │  25%   │ 6/10   │ 9/10   │ 5/10   │        │
│Cost         │  20%   │ 7/10   │ 5/10   │ 8/10   │        │
│Risk         │  15%   │ 8/10   │ 6/10   │ 4/10   │        │
│Speed        │  10%   │ 5/10   │ 9/10   │ 3/10   │        │
├─────────────┼────────┼────────┼────────┼────────┼────────┤
│Total Score  │        │  6.9   │  6.8   │  6.5   │  6.9 🏆│
└─────────────┴────────┴────────┴────────┴────────┴────────┘

### Decision Rationale
**Why we chose [Decision]**:
1. [Reason 1]
2. [Reason 2]
3. [Reason 3]

**Trade-offs Accepted**:
- We're accepting: [Trade-off 1]
- In exchange for: [Benefit 1]

### Minority Opinions
[If any stakeholders dissent, document their view]

## Implementation Plan

### Action Items
| ID | Action | Owner | Deadline | Status | Dependencies |
|----|--------|-------|----------|--------|--------------|
| 1  |[Action]| Name  | Date     | 🟢     | None         |
| 2  |[Action]| Name  | Date     | 🟡     | ID 1         |
| 3  |[Action]| Name  | Date     | 🔴     | ID 1, 2      |

### Success Criteria
| Metric | Current | Target | Timeline | Owner |
|--------|---------|--------|----------|-------|
|Metric 1| X       | Y      | Date     | Name  |
|Metric 2| A       | B      | Date     | Name  |

### Timeline
```
Week 1: [Milestones]
Week 2: [Milestones]
Week 3: [Milestones]
```

## Risk Assessment

### Risks and Mitigation
| Risk | Probability | Impact | Mitigation | Owner |
|------|-------------|--------|------------|-------|
|Risk 1| High/Med/Low| H/M/L  |[Strategy]  | Name  |
|Risk 2| High/Med/Low| H/M/L  |[Strategy]  | Name  |

### Monitoring Plan
- **Review frequency**: [Weekly/Bi-weekly/Monthly]
- **Key metrics**: [What to track]
- **Escalation triggers**: [When to escalate]

## Review and Follow-up

### Review Schedule
- **Check-in 1**: [Date] - Action item progress
- **Check-in 2**: [Date] - Early results
- **Full Review**: [Date] - Assess decision outcomes

### Decision Validation
- **How we'll know if this was the right decision**: [Criteria]
- **What would cause us to revisit**: [Triggers]

## Appendices

### A. Meeting Notes
[Detailed notes from consensus-building sessions]

### B. Research Supporting Decision
[Links to research reports, data analysis]

### C. Alternative Options Explored
[Detailed analysis of options not chosen]

### D. Stakeholder Feedback
[Post-decision feedback from participants]
```

**Output**: `./outputs/consensus-reports/[topic]-consensus-[date].md`

**Verification Checkpoint**:
- [ ] Report comprehensive
- [ ] Decision clearly stated
- [ ] Rationale documented
- [ ] Actions defined
- [ ] Risks identified

### Step 4.3: Create Decision Record
**Goal**: Add to decision log for future reference

**Decision Record Template**:
```markdown
# Decision Record: [Decision Name]
**Date**: [YYYY-MM-DD]
**Status**: [Proposed/Accepted/Superseded]
**Decision Maker**: [Name or "Consensus"]

## Decision
[Clear statement of what was decided]

## Context
[Background that led to this decision]

## Options Considered
1. [Option A]
2. [Option B]
3. [Option C]

## Decision Rationale
[Why this option was chosen]

## Consequences
**Positive**:
- [Benefit 1]
- [Benefit 2]

**Negative**:
- [Trade-off 1]
- [Trade-off 2]

## Stakeholder Positions
- Support: [Names]
- Neutral: [Names]
- Opposed: [Names]

## Links
- Consensus Report: [Link]
- Supporting Research: [Link]
- Related Decisions: [Links]

## Review Date
[When this decision should be revisited]
```

**Output**: `./decisions/[topic]-[date].md`

**Verification Checkpoint**:
- [ ] Decision recorded
- [ ] Added to decision log
- [ ] Linked to supporting docs
- [ ] Accessible to future reference

## Phase 5: Communication and Follow-up (Ongoing)

### Step 5.1: Communicate Decision
**Goal**: Ensure all stakeholders and affected parties understand the decision

**Communication Plan**:

**To Decision Participants**:
- Share full consensus report
- Thank for participation
- Confirm action item ownership
- Schedule check-in meetings

**To Broader Team**:
- Executive summary email
- Team meeting announcement
- Update roadmap/documentation
- Answer questions

**To Leadership**:
- Decision summary memo
- Highlight alignment score
- Note any risks or concerns
- Confirm resource commitments

**Communication Template**:
```markdown
Subject: Decision Made: [Decision Name]

Team,

We've reached consensus on [decision topic]. Here's what you need to know:

**The Decision**: [One-sentence summary]

**Why**: [Brief rationale]

**Impact**: [How this affects different groups]

**Next Steps**:
1. [Action 1] - Owner: [Name], By: [Date]
2. [Action 2] - Owner: [Name], By: [Date]

**Questions?** [Contact info]

Full consensus report: [Link]
```

**Verification Checkpoint**:
- [ ] All participants notified
- [ ] Broader team informed
- [ ] Leadership updated
- [ ] Documentation updated
- [ ] Questions addressed

### Step 5.2: Track Action Items
**Goal**: Ensure commitments are followed through

**Tracking System**:
- Weekly status updates from owners
- Bi-weekly PM check-ins
- Dashboard/tracker for visibility
- Blockers escalated promptly

**Status Update Template**:
```markdown
## Action Item Status Update
**Week of**: [Date]

| Action | Owner | Status | Progress | Blockers | Next Steps |
|--------|-------|--------|----------|----------|------------|
|Action 1| Name  | 🟢     | 80% done | None     |Complete by Friday|
|Action 2| Name  | 🟡     | 50% done |Resource  |Need 1 more dev|
|Action 3| Name  | 🔴     | 10% done |Dependency|Blocked by Action 1|
```

**Verification Checkpoint**:
- [ ] Tracking system in place
- [ ] Regular updates happening
- [ ] Progress visible
- [ ] Blockers addressed
- [ ] Accountability maintained

### Step 5.3: Monitor and Validate
**Goal**: Assess whether the decision is working as expected

**Monitoring Activities**:
- Track success metrics
- Gather feedback
- Watch for risks materializing
- Document learnings

**Validation Questions**:
- Are we achieving the expected outcomes?
- Did stakeholders follow through on commitments?
- Are there unexpected consequences?
- Would we make the same decision again?
- What would we do differently next time?

**Learning Capture**:
```markdown
# Decision Retrospective: [Decision Name]
**Original decision date**: [Date]
**Retrospective date**: [Date]
**Time elapsed**: [Duration]

## Outcomes vs. Expectations
| Expected Outcome | Result | Notes |
|------------------|--------|-------|
| Outcome 1 | ✓ Met | [Details] |
| Outcome 2 | ⚠ Partial | [Details] |
| Outcome 3 | ❌ Missed | [Details] |

## What Worked Well
- [Success 1]
- [Success 2]

## What Didn't Work
- [Challenge 1]
- [Challenge 2]

## Surprises
- [Unexpected outcome 1]
- [Unexpected outcome 2]

## Lessons Learned
- About the decision: [Learnings]
- About the process: [Learnings]
- About the team: [Learnings]

## Process Improvements
- For next time: [Changes to make]
```

**Verification Checkpoint**:
- [ ] Metrics tracked
- [ ] Outcomes assessed
- [ ] Learnings documented
- [ ] Process improved
- [ ] Knowledge captured

## Quality Assurance Checklist

### Process Quality
- [ ] All key stakeholders engaged
- [ ] Positions fully documented
- [ ] Evidence shared transparently
- [ ] Conflicts addressed constructively
- [ ] Creative solutions explored

### Decision Quality
- [ ] Decision clearly stated
- [ ] Rationale well-documented
- [ ] Trade-offs explicit
- [ ] Risks identified
- [ ] Success criteria defined

### Consensus Quality
- [ ] Genuine buy-in achieved
- [ ] Not just "loudest voice wins"
- [ ] Minority views respected
- [ ] Alignment score ≥3.0/5.0
- [ ] Commitments secured

### Documentation Quality
- [ ] Report comprehensive
- [ ] Easy to understand
- [ ] Action items clear
- [ ] Decision traceable
- [ ] Referenceable for future

## Integration Points

**Receives input from**:
- Research Synthesizer (evidence for decision)
- Stakeholder Management (stakeholder mapping)
- Risk Assessment (risk identification)
- Strategic Planning (strategic context)

**Feeds into**:
- PRD Framework (validated requirements)
- Problem Decomposition (aligned problem definition)
- Feature Prioritization (consensus priorities)
- Cross-functional Coordination (implementation alignment)
- Decision log (organizational memory)

## Success Criteria

Consensus building is successful when:
- [ ] Alignment score ≥4.0/5.0 achieved
- [ ] All key stakeholders support decision
- [ ] Action items have clear owners
- [ ] Decision implemented as planned
- [ ] Minimal rework or reopening
- [ ] Stakeholders satisfied with process
- [ ] Decision validated by outcomes

## Tools and Templates

- Consensus Report Template: `./.claude/templates/consensus-template.md`
- Stakeholder Position Matrix: Use Matrix Generator Agent
- Evidence Log: `./.claude/templates/evidence-log.md`
- Consensus Builder Agent: `./.claude/agents/consensus-builder.md`
- Matrix Generator Agent: `./.claude/agents/matrix-generator.md`

## Related Workflows

- Research Synthesis: `./.claude/workflows/research-synthesis.md`
- Stakeholder Management: `./.claude/workflows/stakeholder-management.md`
- Problem Decomposition: `./.claude/workflows/problem-decomposition.md`
- Cross-functional Coordination: `./.claude/workflows/cross-functional.md`
- Decision Making: `./.claude/workflows/evidence-based-decision.md`
