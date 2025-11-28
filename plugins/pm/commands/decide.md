---
description: Quick decision framework with systematic analysis and transparent rationale
allowed-tools: [Write]
argument-hint: <decision to make>
---

# Decision Framework Command

You are facilitating a **Structured Decision Process**.

## Your Task

Help make a well-reasoned decision on:

**Decision to Make**: $ARGUMENTS

## Decision Framework

### Step 1: Frame the Decision
1. **Decision Statement**: Clearly articulate what needs to be decided
2. **Decision Type**:
   - Type 1 (Reversible): Easy to change, low risk
   - Type 2 (Hard to reverse): Difficult to change, high impact
3. **Stakeholders**: Who is affected and who should be involved?
4. **Timeline**: When does this need to be decided?
5. **Constraints**: What limitations exist (budget, time, resources, etc.)?

### Step 2: Gather Context
1. **Background**: What led to this decision point?
2. **Data**: What information is available?
   - Quantitative data (metrics, analytics)
   - Qualitative data (user feedback, research)
   - Market data (competitors, trends)
3. **Prior Decisions**: Have we faced similar decisions before?
4. **Assumptions**: What are we assuming to be true?

### Step 3: Generate Options
List at least 3 viable options:
- **Option A**: [Description]
- **Option B**: [Description]
- **Option C**: [Description]
- **Option D**: [Do nothing/status quo]

For each option, identify:
- Prerequisites
- Resources needed
- Timeline
- Reversibility

### Step 4: Evaluate Options

Use a **Decision Matrix**:

| Criteria (Weight) | Option A | Option B | Option C | Option D |
|-------------------|----------|----------|----------|----------|
| User Impact (30%) | Score | Score | Score | Score |
| Business Value (25%) | Score | Score | Score | Score |
| Feasibility (20%) | Score | Score | Score | Score |
| Risk Level (15%) | Score | Score | Score | Score |
| Strategic Fit (10%) | Score | Score | Score | Score |
| **Weighted Total** | **X** | **Y** | **Z** | **W** |

Scoring scale: 1-10 (10 = best)

### Step 5: Analyze Pros and Cons

For top 2 options, list:

**Option [X] Pros**:
- Pro 1
- Pro 2
- Pro 3

**Option [X] Cons**:
- Con 1
- Con 2
- Con 3

**Option [Y] Pros**:
- Pro 1
- Pro 2
- Pro 3

**Option [Y] Cons**:
- Con 1
- Con 2
- Con 3

### Step 6: Risk Assessment

For leading options:
- **Best Case**: What if everything goes right?
- **Expected Case**: What's the most likely outcome?
- **Worst Case**: What if things go wrong?
- **Mitigation**: How can we reduce downside risk?

### Step 7: Make Recommendation

**Recommended Option**: [Letter]

**Rationale**:
1. [Reason 1: Why this option is best]
2. [Reason 2: How it addresses the core need]
3. [Reason 3: Why it beats alternatives]

**Confidence Level**: High/Medium/Low

**Validation Plan**: How will we know if this was the right decision?
- Metric 1: [Success indicator]
- Metric 2: [Success indicator]
- Timeline: [When to evaluate]

### Step 8: Document Decision

Create decision log entry:

## Output Location

Save to: `./decisions/logs/[date]-[decision-topic].md`

## Decision Document Structure

```markdown
# Decision: [Title]

**Date**: [Date]
**Decision Maker(s)**: [Names]
**Type**: Type 1 / Type 2
**Status**: Proposed / Decided / Implemented / Validated

## Context
[Why this decision was needed]

## Options Considered
1. **Option A**: [Description]
   - Pros: [List]
   - Cons: [List]
   - Score: X/10

2. **Option B**: [Description]
   - Pros: [List]
   - Cons: [List]
   - Score: Y/10

[Additional options...]

## Decision
**Chosen**: [Option Letter]

## Rationale
[Detailed reasoning for this choice]

## Implications
- **User Impact**: [How users are affected]
- **Business Impact**: [Revenue, cost, efficiency effects]
- **Technical Impact**: [Architecture, debt, complexity]
- **Resource Impact**: [Team, budget, timeline]

## Risks and Mitigation
| Risk | Probability | Impact | Mitigation |
|------|-------------|--------|------------|
| [Risk 1] | H/M/L | H/M/L | [Strategy] |

## Success Criteria
- [Metric 1]: Target value by [date]
- [Metric 2]: Target value by [date]

## Validation Plan
- **Review Date**: [When to reassess]
- **Pivot Criteria**: [What would make us change course]

## Stakeholder Sign-off
- [Stakeholder 1]: Approved/Pending
- [Stakeholder 2]: Approved/Pending
```

## Decision Quality Checklist

Before finalizing:
- [ ] Decision clearly framed
- [ ] All viable options considered
- [ ] Data gathered and analyzed
- [ ] Pros and cons evaluated
- [ ] Risks identified and mitigated
- [ ] Clear recommendation with rationale
- [ ] Success criteria defined
- [ ] Stakeholders aligned
- [ ] Decision documented

## Quick Decision Heuristics

For fast decisions when time is limited:

1. **Regret Minimization**: Which option will you regret least?
2. **Reversibility**: If reversible, decide quickly and iterate
3. **10-10-10**: How will you feel about this in 10 min, 10 months, 10 years?
4. **WRAP Framework**:
   - **W**iden your options (don't get stuck on just 2)
   - **R**eality-test assumptions (gather data)
   - **A**ttain distance before deciding (avoid emotional bias)
   - **P**repare to be wrong (have a plan B)

## Integration with Other Workflows

Link this decision to:
- Problem decomposition if addressing a problem
- PRD if defining product direction
- Strategic plan if strategic decision
- Risk assessment if high-risk decision

---

## Next Steps

After completing the decision:

| Next Action | Command | When to Use |
|-------------|---------|-------------|
| Build stakeholder buy-in | `/consensus` | Align team on the decision |
| Create comparison matrix | `/matrix` | Deep-dive into option comparison |
| Write requirements | `/prd` | If decision leads to building something |
| Assess feasibility | `/tech-impact` | Validate engineering impact |
| Create strategic plan | `/strategy` | If decision affects product direction |

---

Begin decision analysis now.
