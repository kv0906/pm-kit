# Matrix Generation Workflow

## Visual Decision Frameworks and Comparison Analysis

This workflow provides systematic approaches for creating comparison matrices, decision frameworks, and analytical tables that transform complex information into clear, actionable visual formats.

## Overview

**Purpose**: Create visual tools that simplify complex comparisons and facilitate data-driven decisions

**When to use**:
- Comparing multiple options, features, or competitors
- Making multi-criteria decisions
- Synthesizing research from multiple sources
- Building stakeholder alignment through visualization
- Prioritizing features or initiatives
- Assessing and communicating risks
- Tracking metrics and progress

**Outputs**:
- Feature comparison matrices
- Multi-criteria decision matrices (MCDA)
- Research synthesis matrices
- Stakeholder alignment matrices
- Prioritization matrices
- Risk assessment matrices

## Matrix Type Selection Guide

**Choose your matrix type based on your need**:

| Need | Matrix Type | Best For |
|------|-------------|----------|
| Compare features across products | Feature Comparison | Competitive analysis, gap identification |
| Evaluate solution options | MCDA Decision Matrix | Build vs. buy, vendor selection |
| Synthesize research | Research Synthesis | Multi-source findings, confidence scoring |
| Align stakeholders | Stakeholder Position | Consensus building, conflict resolution |
| Prioritize work | Prioritization Matrix | Backlog management, roadmap planning |
| Assess risks | Risk Assessment | Risk management, mitigation planning |
| Track progress | Metrics Dashboard | KPI monitoring, status reporting |

## Workflow 1: Feature Comparison Matrix

### Use Case
Comparing features across your product and competitors to identify gaps and opportunities.

### Step 1: Define Comparison Scope
**Goal**: Identify what features to compare and against whom

**Inputs Needed**:
- Your product feature list
- Competitor list (typically 3-5)
- Feature categories to evaluate
- Market expectations/trends

**Template**:
```markdown
## Feature Comparison Scope
**Products to Compare**:
- Us: [Your product]
- Competitor 1: [Name]
- Competitor 2: [Name]
- Competitor 3: [Name]

**Feature Categories**:
1. [Category 1] - e.g., Authentication
2. [Category 2] - e.g., Integrations
3. [Category 3] - e.g., Analytics

**Evaluation Criteria**:
- ✓ = Full support (complete implementation)
- ⚠️ = Partial support (limited or basic)
- ❌ = Not available
- 🔜 = Emerging trend (not yet standard)
```

### Step 2: Research Feature Availability
**Goal**: Gather accurate data on feature availability

**Research Methods**:
- Product documentation review
- Competitor website audits
- Free trial testing
- User reviews and feedback
- Industry reports
- Sales team intelligence

**Documentation**:
- Screenshot evidence
- Feature descriptions
- Limitations noted
- Pricing tiers (if applicable)
- Last updated date

### Step 3: Generate Comparison Matrix
**Goal**: Create visual comparison

**Use Matrix Generator Agent**: Invoke `./.claude/agents/matrix-generator.md`

**Matrix Format**:
```
┌─────────────────┬─────┬──────┬──────┬──────┬───────┬────────┐
│ Feature         │ Us  │Comp1 │Comp2 │Comp3 │Market │Priority│
│                 │     │      │      │      │Expect │        │
├─────────────────┼─────┼──────┼──────┼──────┼───────┼────────┤
│ Social Login    │ ❌  │ ✓    │ ✓    │ ✓    │ ✓     │ P0     │
│ 2FA             │ ⚠️  │ ✓    │ ✓    │ ❌   │ ✓     │ P1     │
│ SSO/SAML        │ ❌  │ ✓    │ ❌   │ ✓    │ ⚠️    │ P1     │
│ API Access      │ ✓   │ ✓    │ ⚠️   │ ✓    │ ✓     │ ✓      │
│ Webhooks        │ ⚠️  │ ✓    │ ❌   │ ✓    │ ⚠️    │ P2     │
│ Mobile App      │ ✓   │ ✓    │ ✓    │ ✓    │ ✓     │ ✓      │
│ AI Features     │ ❌  │ ❌   │ ⚠️   │ ✓    │ 🔜    │ P0     │
├─────────────────┴─────┴──────┴──────┴──────┴───────┴────────┤
│ Legend: ✓ Full  ⚠️ Partial  ❌ None  🔜 Emerging             │
│ Gap Analysis: 3 Critical, 2 Important, 1 Nice-to-have       │
└────────────────────────────────────────────────────────────────┘
```

### Step 4: Analyze and Interpret
**Goal**: Extract insights from comparison

**Gap Analysis**:
- **Critical Gaps**: We lack, all competitors have, market expects
- **Important Gaps**: We lack, some competitors have
- **Nice-to-have**: Emerging features, not yet standard
- **Differentiators**: We have, competitors lack

**Priority Assignment**:
- P0: Critical gaps (competitive disadvantage)
- P1: Important gaps (falling behind)
- P2: Nice-to-have (future consideration)
- ✓: Parity achieved (maintain)

**Insights**:
- Market positioning implications
- User acquisition/retention impact
- Competitive advantages/disadvantages
- Strategic recommendations

**Output**: `./outputs/decision-matrices/[topic]-feature-comparison-[date].md`

## Workflow 2: Multi-Criteria Decision Matrix (MCDA)

### Use Case
Evaluating multiple options against weighted criteria to identify the best choice.

### Step 1: Define Decision and Options
**Goal**: Clearly state what's being decided and what options exist

**Decision Statement**:
```markdown
## Decision: [Clear statement]
**Context**: [Why this decision is needed]
**Timeline**: [When decision must be made]

## Options
1. **Option A**: [Description]
2. **Option B**: [Description]
3. **Option C**: [Description]
```

### Step 2: Identify Evaluation Criteria
**Goal**: Determine what factors matter for this decision

**Common Criteria Categories**:
- **User Impact**: Does it solve real user problems?
- **Business Value**: Revenue, retention, strategic alignment
- **Feasibility**: Technical complexity, resource availability
- **Cost**: Development, maintenance, opportunity cost
- **Time**: Speed to market, time to value
- **Risk**: Technical, market, execution risk
- **Strategic Fit**: Aligns with vision and roadmap

**Criteria Selection**:
- Choose 5-7 criteria (not too many)
- Make criteria independent (no overlap)
- Define each criterion clearly
- Include both benefits and costs

**Example**:
```markdown
## Evaluation Criteria

1. **User Impact** (Does it solve a key user problem?)
   - 10/10: Solves critical pain point for all users
   - 5/10: Solves moderate problem for some users
   - 1/10: Minimal user benefit

2. **Feasibility** (Can we build it with current resources?)
   - 10/10: Easy, low complexity, clear path
   - 5/10: Moderate complexity, some unknowns
   - 1/10: Very complex, high uncertainty

[Define all criteria similarly]
```

### Step 3: Assign Weights
**Goal**: Reflect relative importance of each criterion

**Weighting Approaches**:
- **Equal Weights**: All criteria matter equally (use when uncertain)
- **Strategic Weights**: Align with company priorities
- **Stakeholder Weights**: Reflect stakeholder consensus
- **Data-Driven Weights**: Based on historical decisions

**Example Weights**:
```markdown
## Criteria Weights
| Criterion | Weight | Rationale |
|-----------|--------|-----------|
| User Impact | 30% | Primary goal is user satisfaction |
| Feasibility | 25% | Resource constrained |
| Business Value | 20% | Revenue important but secondary |
| Risk | 15% | Must manage downside |
| Time to Market | 10% | Some urgency but not critical |
| **Total** | **100%** | |
```

**Important**: Set weights BEFORE scoring options (avoid bias).

### Step 4: Score Options
**Goal**: Evaluate each option against each criterion

**Scoring Guidelines**:
- Use consistent scale (e.g., 1-10)
- Score independently (don't compare during scoring)
- Use evidence/data where possible
- Document reasoning
- Consider multiple perspectives

**Scoring Session**:
- Involve relevant experts
- Score one criterion at a time across all options
- Discuss and align on scores
- Document assumptions

### Step 5: Create Decision Matrix
**Goal**: Calculate weighted scores and identify winner

**Use Matrix Generator Agent**: Invoke `./.claude/agents/matrix-generator.md`

**Matrix Format**:
```
┌───────────────┬────────┬─────────┬─────────┬─────────┬──────┐
│ Solution      │ Cost   │ Time    │ Risk    │ Impact  │Total │
│               │ (20%)  │ (25%)   │ (25%)   │ (30%)   │Score │
├───────────────┼────────┼─────────┼─────────┼─────────┼──────┤
│ Build In-House│ 3/10   │ 2/10    │ 8/10    │ 10/10   │ 6.4  │
│               │ $200K  │ 6 months│ Low risk│ Full ctl│      │
├───────────────┼────────┼─────────┼─────────┼─────────┼──────┤
│ Buy Solution  │ 7/10   │ 9/10    │ 5/10    │ 7/10    │ 7.0  │
│               │ $50K   │ 1 month │ Med risk│ 80% fit │      │
├───────────────┼────────┼─────────┼─────────┼─────────┼──────┤
│ Partner/Integ │ 9/10   │ 7/10    │ 3/10    │ 6/10    │ 6.2  │
│               │ $10K   │ 2 months│High risk│ 60% fit │      │
├───────────────┼────────┼─────────┼─────────┼─────────┼──────┤
│ Hybrid        │ 6/10   │ 5/10    │ 6/10    │ 9/10    │ 7.1🏆│
│               │ $75K   │ 3 months│ Med risk│ 90% fit │      │
└───────────────┴────────┴─────────┴─────────┴─────────┴──────┘

Calculation: Score = Σ(Criterion Weight × Option Score)
Recommendation: Hybrid Approach (Score: 7.1)
Rationale: Best balance of control, speed, and impact
```

### Step 6: Sensitivity Analysis
**Goal**: Test robustness of decision

**Questions to Ask**:
- What if weights were different?
- What if scores changed by ±1 point?
- What assumptions is this sensitive to?
- Is there a clear winner or is it close?

**Sensitivity Test**:
- Adjust weights ±10%
- Adjust scores ±1 point
- Rerun calculation
- If winner changes → decision is fragile
- If winner stays same → decision is robust

### Step 7: Document Decision
**Goal**: Record rationale and recommendation

**Decision Documentation**:
```markdown
## Decision Matrix Analysis: [Topic]

**Recommendation**: [Winning option]
**Score**: X.X/10
**Confidence**: [High/Medium/Low]

**Why This Option**:
1. [Strength 1]
2. [Strength 2]
3. [Strength 3]

**Trade-offs Accepted**:
- [Trade-off 1]
- [Trade-off 2]

**Sensitivity**: [Robust/Fragile]
- Tested with weight variations: [Result]
- Tested with score variations: [Result]

**Assumptions**:
- [Assumption 1]
- [Assumption 2]

**Next Steps**:
- [ ] Action 1
- [ ] Action 2
```

**Output**: `./outputs/decision-matrices/[topic]-mcda-[date].md`

## Workflow 3: Research Synthesis Matrix

### Use Case
Synthesizing findings from multiple research sources to assess confidence.

### Step 1: Identify Research Sources
**Goal**: List all sources that inform the finding

**Source Types**:
- User interviews (qualitative)
- Surveys (quantitative)
- Analytics (behavioral)
- Competitor analysis (market)
- Expert opinions (consultation)
- Support tickets (voice of customer)

### Step 2: Extract Findings per Source
**Goal**: Document what each source says about key topics

**Extraction Template**:
```markdown
## Source: [Name]
**Type**: [Qualitative/Quantitative/Mixed]
**Sample**: n=X
**Date**: [YYYY-MM-DD]

### Finding on [Topic]
**Evidence**: [Quote, stat, or observation]
**Strength**: [Strong/Medium/Weak]
**Context**: [Important context]
```

### Step 3: Create Synthesis Matrix
**Goal**: Compare findings across sources

**Use Matrix Generator Agent**: Invoke `./.claude/agents/matrix-generator.md`

**Matrix Format**:
```
┌──────────────┬──────────┬──────────┬──────────┬────────┬─────┐
│ Finding      │Interview │Analytics │Competitor│ Survey │Conf.│
│              │ (n=20)   │ (n=10K)  │ Analysis │ (n=500)│Score│
├──────────────┼──────────┼──────────┼──────────┼────────┼─────┤
│ Need faster  │ 18/20    │ 3s avg   │ All <2s  │78% agree│ 9.2 │
│ load times   │ mentioned│ load time│          │         │     │
├──────────────┼──────────┼──────────┼──────────┼────────┼─────┤
│ Want dark    │ 5/20     │ 22% night│ 3/5 have │45% want│ 5.8 │
│ mode         │mentioned │ usage    │          │         │     │
├──────────────┼──────────┼──────────┼──────────┼────────┼─────┤
│ Mobile first │ 15/20    │ 67%      │ All mobile│71%    │ 8.9 │
│ priority     │ mobile   │ traffic  │optimized │mobile   │     │
└──────────────┴──────────┴──────────┴──────────┴────────┴─────┘

Confidence Score Calculation:
- 4 converging sources: 9-10 (Very High)
- 3 converging sources: 7-8 (High)
- 2 converging sources: 5-6 (Medium)
- 1 source only: 3-4 (Low)

Action Thresholds:
9-10: Very High → Act immediately
7-8: High → Plan for next quarter
5-6: Medium → Further research needed
<5: Low → Monitor only
```

### Step 4: Analyze Patterns
**Goal**: Identify convergence, divergence, and gaps

**Pattern Analysis**:
- **Converging Evidence**: 3+ sources agree → High confidence
- **Diverging Evidence**: Sources conflict → Investigate why
- **Unique Insights**: Single source → Validate or explore
- **Knowledge Gaps**: No data available → Research needed

### Step 5: Prioritize Insights
**Goal**: Rank findings by confidence and impact

**Impact vs. Evidence Matrix**:
```
         Strong Evidence (7-10)
         │
High     │ PRIORITY 1    │
Impact   │ ACT NOW       │
─────────┼───────────────┼──────────
Low      │ DOCUMENT      │ IGNORE
Impact   │               │
         │               │
        High Impact     Low Impact
```

**Output**: `./outputs/decision-matrices/[topic]-research-synthesis-[date].md`

## Workflow 4: Stakeholder Position Matrix

### Use Case
Visualizing stakeholder alignment for consensus building.

**See**: `./.claude/workflows/consensus-report.md` for full workflow

**Quick Matrix**:
```
┌───────────────┬────────────┬────────────┬──────────┬──────────┐
│ Issue         │ Engineering│   Design   │  Sales   │Consensus │
├───────────────┼────────────┼────────────┼──────────┼──────────┤
│ Priority      │ P1         │ P0         │ P0       │ P0       │
│ Position      │ Need time  │ Critical UX│ Deals    │ MVP Q1   │
│ Concern       │ Security   │ Consistency│ Pipeline │ Security │
│ Support Level │ Commit     │ Support    │ Support  │ Strong   │
└───────────────┴────────────┴────────────┴──────────┴──────────┘

Alignment Score: 4.2/5.0 (Strong alignment)
```

## Workflow 5: Prioritization Matrices

### Option A: Impact vs. Effort (2x2)
**Use Case**: Quick prioritization of features/initiatives

**Matrix**:
```
         High Impact
         │
Quick    │  Quick    │  Major
Wins     │  Wins     │  Projects
─────────┼───────────┼──────────
Fill-Ins │  Thankless│
         │  Tasks    │
         │           Low Impact
        Low Effort    High Effort

Instructions:
1. Plot each feature in appropriate quadrant
2. Prioritize: Quick Wins → Major Projects → Fill-Ins
3. Avoid or defer: Thankless Tasks
```

### Option B: RICE Scoring
**Use Case**: Quantitative prioritization with confidence

**RICE Formula**:
```
RICE Score = (Reach × Impact × Confidence) / Effort

Where:
- Reach: Number of users affected per time period
- Impact: Degree of impact (0.25 = Minimal, 0.5 = Low, 1 = Medium, 2 = High, 3 = Massive)
- Confidence: Certainty level (50% = Low, 80% = Medium, 100% = High)
- Effort: Person-months required
```

**Matrix**:
```
┌─────────────┬──────┬────────┬────────┬──────┬──────┐
│ Feature     │Reach │ Impact │Confidence│Effort│Score │
│             │(users)│(0-3)  │  (%)   │(pers-│(RICE)│
│             │       │       │        │mos)  │      │
├─────────────┼──────┼────────┼────────┼──────┼──────┤
│ AI Assistant│10000 │   3    │  80%   │  3   │ 8000 │
│ Dark Mode   │ 5000 │   1    │  90%   │  1   │ 4500 │
│ API v2      │ 2000 │   2    │  60%   │  2   │ 1200 │
│ Mobile App  │ 8000 │   2    │  70%   │  4   │ 2800 │
└─────────────┴──────┴────────┴────────┴──────┴──────┘

Priority Order: AI Assistant → Dark Mode → Mobile App → API v2
```

### Option C: Value vs. Complexity
**Use Case**: Strategic prioritization considering strategic value

**Matrix**:
```
High Value │ Table Stakes │ High Value  │
           │ (Do)         │ (Prioritize)│
───────────┼──────────────┼─────────────┤
Low Value  │ Don't Do     │ Low-Hanging │
           │              │ Fruit (Do)  │
           │              │             │
          Low Complexity  High Complexity
```

## Best Practices

### General Matrix Creation
1. **Define purpose first**: What decision is this matrix supporting?
2. **Choose appropriate type**: Match matrix to decision type
3. **Keep it simple**: 5-7 criteria/dimensions maximum
4. **Use consistent scales**: Don't mix 1-5 and 1-10 scales
5. **Document methodology**: How you scored/rated
6. **Add context**: Legends, notes, caveats
7. **Make actionable**: Clear recommendations
8. **Update regularly**: Matrices become stale

### Visual Design
- Use clear visual separators (lines, spacing)
- Add color coding when possible (🟢🟡🔴)
- Include legends and keys
- Highlight winners/priorities
- Make scannable (bold important numbers)
- Use icons/symbols (✓/⚠/❌)

### Data Quality
- Verify data accuracy
- Document sources
- Note confidence levels
- Acknowledge gaps
- Update when stale
- Version control

### Stakeholder Communication
- Lead with insights, not the matrix
- Explain methodology clearly
- Show sensitivity analysis
- Address concerns proactively
- Make recommendation explicit
- Provide next steps

## Validation Checklist

### Structure
- [ ] Purpose clearly stated
- [ ] Appropriate type selected
- [ ] Dimensions logically organized
- [ ] All cells populated
- [ ] Formatting consistent

### Data
- [ ] Data accurate and current
- [ ] Sources documented
- [ ] Scoring/rating consistent
- [ ] No obvious errors
- [ ] Gaps acknowledged

### Analysis
- [ ] Calculations correct
- [ ] Weights justified
- [ ] Scores defensible
- [ ] Patterns accurate
- [ ] Conclusions supported

### Usability
- [ ] Easy to understand quickly
- [ ] Key insights visible
- [ ] Legend/key provided
- [ ] Actionable recommendations
- [ ] Appropriate for audience

## Integration Points

**Receives input from**:
- Research Synthesizer (data for matrices)
- Consensus Builder (stakeholder positions)
- Prioritization Engine (scoring criteria)
- Analytics Synthesizer (metrics, trends)

**Feeds into**:
- Consensus Reports (visual frameworks)
- PRDs (requirements prioritization)
- Strategic Planning (competitive positioning)
- Stakeholder Communication (decision artifacts)

## Tools and Templates

- Matrix Generator Agent: `./.claude/agents/matrix-generator.md`
- Feature Comparison Template: `./.claude/templates/feature-comparison-matrix.md`
- MCDA Template: `./.claude/templates/decision-matrix.md`
- Research Synthesis Template: `./.claude/templates/research-matrix.md`

## Related Workflows

- Research Synthesis: `./.claude/workflows/research-synthesis.md`
- Consensus Building: `./.claude/workflows/consensus-report.md`
- Feature Prioritization: `./.claude/workflows/feature-prioritization.md`
- Problem Decomposition: `./.claude/workflows/problem-decomposition.md`
