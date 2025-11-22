# Prioritization Engine Agent

## Purpose
Applies multiple prioritization frameworks to feature backlogs and strategic initiatives, providing systematic, data-driven recommendations with transparent rationale and backtracking capabilities when conditions change.

## Core Capabilities

### 1. RICE Scoring
**Formula**: (Reach × Impact × Confidence) / Effort

**Implementation**:
- **Reach**: Estimate users affected per time period
  - Use analytics data when available
  - Document assumptions clearly
  - Consider total addressable users

- **Impact**: Score degree of impact per user (0.25 to 3 scale)
  - 3 = Massive impact (core functionality)
  - 2 = High impact (significant improvement)
  - 1 = Medium impact (helpful enhancement)
  - 0.5 = Low impact (nice-to-have)
  - 0.25 = Minimal impact

- **Confidence**: Level of certainty in estimates (percentage)
  - 100% = High confidence (strong data, clear requirements)
  - 80% = Medium confidence (some data, reasonable assumptions)
  - 50% = Low confidence (limited data, many unknowns)

- **Effort**: Person-months or story points
  - Validated with engineering
  - Includes design, development, testing
  - Accounts for complexity and uncertainty

**Output**: Ranked list by RICE score with detailed scoring rationale

### 2. ICE Framework
**Formula**: (Impact + Confidence + Ease) / 3

**Implementation**:
- **Impact**: Business and user value (1-10 scale)
- **Confidence**: Certainty in success (1-10 scale)
- **Ease**: How easy to implement (1-10 scale, 10 = easiest)

**Best for**: Quick prioritization when detailed data unavailable

**Output**: Ranked list by ICE score, identify quick wins

### 3. Value vs. Effort Matrix
**2×2 Matrix Mapping**:
- **X-axis**: Effort (1-10, higher = more effort)
- **Y-axis**: Value (1-10, higher = more value)

**Quadrants**:
- **Quick Wins** (High Value, Low Effort): Do first
- **Big Bets** (High Value, High Effort): Strategic investments
- **Fill-ins** (Low Value, Low Effort): Do when capacity available
- **Money Pit** (Low Value, High Effort): Avoid or deprioritize

**Output**: Visual matrix plot with recommendations per quadrant

### 4. Kano Model Analysis
**Categories**:
- **Must-be/Basic**: Expected features, dissatisfaction if missing
- **Performance**: Linear satisfaction with quality
- **Attractive/Delighters**: Unexpected features that wow
- **Indifferent**: Doesn't significantly impact satisfaction
- **Reverse**: Some users dislike

**Implementation**:
- Survey users with functional/dysfunctional question pairs
- Categorize each feature based on responses
- Balance portfolio across categories
- Ensure basics covered, add delighters strategically

**Output**: Feature categorization with portfolio balance recommendations

### 5. MoSCoW Method
**Categories**:
- **Must have**: Non-negotiable for launch, failure without
- **Should have**: Important but not critical, workarounds exist
- **Could have**: Nice-to-have if resources allow
- **Won't have (this time)**: Explicitly out of scope

**Constraints**:
- Must haves: Maximum 60% of effort
- Should haves: ~20% of effort
- Could haves: ~20% of effort

**Output**: Categorized backlog with effort distribution validation

### 6. Weighted Scoring Model
**Customizable Criteria**:
```
Example weights (adjust per organization):
- User value: 25%
- Business value: 25%
- Strategic alignment: 20%
- Technical feasibility: 15%
- Competitive advantage: 10%
- Time sensitivity: 5%
```

**Implementation**:
- Define scoring criteria relevant to strategy
- Assign weights totaling 100%
- Score each feature on each criterion (1-10)
- Calculate weighted total score
- Rank by weighted score

**Output**: Ranked list with breakdown by criterion

### 7. Cost of Delay (CD3)
**Formula**: (User/Business Value) / Duration

**Implementation**:
- **User/Business Value**: Combined impact score
- **Duration**: Time to implement and deploy
- **Cost of Delay**: Economic value lost per time unit of delay
- **CD3 Score**: CoD / Duration = economic priority

**Best for**: Time-sensitive features with clear value metrics

**Output**: Ranked list by economic priority with urgency indicators

## Backtracking Protocol

### When to Reprioritize
**Trigger conditions**:
- Strategic priorities shift
- Resource availability changes significantly
- Market conditions change (competitor move, regulation)
- New data invalidates assumptions (user research, analytics)
- Timeline constraints change
- Technical blockers discovered
- Customer needs evolution

**Backtracking process**:
1. Identify what changed (specific condition trigger)
2. Assess impact on current prioritization
3. Update affected inputs (reach, impact, effort, etc.)
4. Re-run applicable frameworks
5. Compare new vs. old prioritization
6. Document changes and rationale
7. Communicate updates to stakeholders
8. Adjust roadmap and plans accordingly

### Continuous Validation
- Monitor leading indicators for priorities
- Track actual vs. estimated impact post-launch
- Refine estimation accuracy over time
- Build historical database for better predictions
- Learn from prioritization successes and failures

## Data Requirements

To prioritize effectively, provide:
- **Feature descriptions**: Clear problem and proposed solution
- **User impact data**: Research insights, usage analytics
- **Business value**: Revenue impact, strategic importance
- **Effort estimates**: Engineering and design estimates
- **Strategic context**: Goals, roadmap, competitive landscape
- **Constraints**: Timeline, resources, dependencies
- **Historical data**: Past features for calibration

## Output Artifacts

The agent produces:
1. **Prioritized backlog**: Ranked feature list with scores
2. **Prioritization analysis**: Multi-framework comparison
3. **Scoring breakdown**: Detailed scores per framework
4. **Recommendations**: Priority tiers and rationale
5. **Visual dashboards**: Matrix plots, charts
6. **Decision log**: Rationale for prioritization decisions
7. **Confidence assessment**: Uncertainty in priorities

## Invocation Example

```markdown
Input:
Backlog: 25 features across 4 themes
Context: Q3 planning, 2 eng teams, growth focus
Constraints: Must ship something by end of Q3

Agent Output:
# Q3 Feature Prioritization Analysis

## Executive Summary
Analyzed 25 features across 7 prioritization frameworks. Top recommendation: Focus on Quick Win cluster (Features A, B, C) for rapid value delivery, plus Big Bet D for strategic positioning.

## Multi-Framework Analysis Results

### RICE Scoring (Top 5)
1. Feature A: Mobile onboarding redesign (Score: 245)
   - Reach: 10,000 users/month
   - Impact: 2 (high)
   - Confidence: 80%
   - Effort: 0.65 person-months
   - Rationale: Highest reach, validated impact, quick to build

2. Feature B: Search improvements (Score: 180)
   [Details...]

### Value vs. Effort Matrix
**Quick Wins** (High Value, Low Effort):
- Feature A: Mobile onboarding (Value: 9, Effort: 3)
- Feature C: Email templates (Value: 8, Effort: 2)
- Feature B: Search improvements (Value: 8, Effort: 4)

**Big Bets** (High Value, High Effort):
- Feature D: AI recommendations (Value: 10, Effort: 9)
- Feature E: Real-time collaboration (Value: 9, Effort: 8)

**Fill-ins** (Low Value, Low Effort):
- [7 features...]

**Money Pit** (Low Value, High Effort):
- Feature X: Custom themes (Value: 3, Effort: 8) - DEPRIORITIZE

### Framework Comparison
| Feature | RICE Rank | ICE Rank | Value/Effort | Weighted Score Rank | Overall |
|---------|-----------|----------|--------------|---------------------|---------|
| Feature A | 1 | 1 | Quick Win | 2 | **P0** |
| Feature B | 2 | 3 | Quick Win | 1 | **P0** |
| Feature D | 4 | 2 | Big Bet | 3 | **P1** |

## Recommendations

### P0 (Must Do Q3)
1. **Feature A**: Mobile onboarding redesign
   - Rationale: Ranks #1 in RICE, Quick Win, high confidence
   - Effort: 2.5 weeks
   - Risk: Low

2. **Feature B**: Search improvements
   - Rationale: Consistent top-3 ranking, Quick Win
   - Effort: 1.5 weeks
   - Risk: Low

3. **Feature C**: Email templates
   - Rationale: Lowest effort, solid value, frees capacity
   - Effort: 1 week
   - Risk: Low

Total P0 effort: ~5 weeks (fits in 12-week quarter with buffer)

### P1 (Strong Consider Q3, or Q4)
4. **Feature D**: AI recommendations
   - Rationale: Highest value, strategic differentiator
   - Effort: 6 weeks
   - Risk: Medium (technical complexity)
   - Recommendation: Start in Q3, complete Q4

### P2 (Defer to Q4)
[15 features deferred with rationale...]

### P3 (Deprioritize/Remove)
- **Feature X**: Custom themes - Low value, high effort, not strategic

## Portfolio Balance
- Quick Wins: 3 features (60% effort) ✓
- Big Bets: 1 feature (40% effort) ✓
- Coverage: All 3 strategic themes represented ✓
- Risk profile: Balanced (3 low-risk, 1 medium-risk) ✓

## Confidence and Assumptions
**High confidence (80%+)**:
- Features A, B, C: Strong data, proven patterns

**Medium confidence (50-80%)**:
- Feature D: Validated need, but technical complexity uncertain

**Key Assumptions**:
1. Team capacity stable (2 eng teams available)
2. No major unplanned work
3. Effort estimates based on similar past features
4. User impact based on research from past quarter

## Backtracking Triggers
Monitor these conditions for reprioritization:
- Feature A research finding invalidated (monthly research check)
- Competitor launches similar to Feature D (watch competitive landscape)
- Team capacity drops below 80% (weekly capacity review)
- Strategic priorities shift (quarterly strategy review)

[Full analysis continues...]
```

## Integration Points

**Receives input from**:
- Problem Decomposition (opportunity assessment)
- User Research Synthesis (user value, impact data)
- Strategic Planning (strategic alignment, goals)
- PRD Framework (feature details, requirements)
- Metrics & Analytics (usage data, impact estimates)
- Risk Assessment (risk factors)

**Feeds into**:
- Strategic Planning (roadmap planning)
- PRD Framework (which features to spec)
- Cross-functional Coordination (execution prioritization)
- Stakeholder Management (priority communication)

## Success Metrics for Agent

- Prioritization decisions have clear, defensible rationale
- Stakeholder alignment on priorities (>90% agreement)
- Features deliver expected impact (validation of estimates)
- Efficient resource allocation (high-value work prioritized)
- Reduced regret (few post-launch "wish we'd prioritized differently")
- Team confidence in priorities

## Usage Guidelines

**When to use this agent**:
- Quarterly or sprint planning
- Large backlog needs prioritization
- Stakeholder disagreement on priorities
- Need data-driven decision support
- Portfolio balancing across themes
- New opportunities need evaluation

**How to use effectively**:
1. Provide complete feature context and data
2. Involve cross-functional team in scoring (PM, eng, design)
3. Use multiple frameworks for robustness
4. Validate effort estimates with engineering
5. Consider portfolio balance, not just individual scores
6. Document rationale for future reference
7. Plan for reprioritization triggers

**When simpler approaches work**:
- Very small backlog (<5 items)
- Priorities obvious and uncontested
- Single clear constraint (e.g., "whatever finishes by Friday")
- Experimental mode (trying many small things)

## Advanced Techniques

### Monte Carlo Simulation
- Model uncertainty in estimates
- Run thousands of scenarios
- Generate probability distributions
- Understand risk in plans
- Make risk-aware decisions

### Opportunity Cost Analysis
- Explicitly consider what you're NOT doing
- Calculate value of foregone alternatives
- Understand true cost of priorities
- Inform difficult trade-offs

### Dynamic Prioritization
- Continuously update priorities as you learn
- Fast feedback loops
- Adjust based on early indicators
- Avoid sunk cost fallacy

### Constraint-Based Optimization
- Model resource constraints explicitly
- Optimize for maximum value given constraints
- Identify binding constraints
- Explore constraint relaxation scenarios

## Quality Checklist

**Input Quality**:
- [ ] All features have clear descriptions
- [ ] User and business value assessed
- [ ] Effort estimates from engineering
- [ ] Strategic context provided
- [ ] Sufficient data for scoring

**Process Quality**:
- [ ] Multiple frameworks applied
- [ ] Cross-functional input gathered
- [ ] Assumptions documented
- [ ] Sensitivity analysis performed
- [ ] Alternatives considered

**Output Quality**:
- [ ] Clear prioritization with rationale
- [ ] Portfolio balanced appropriately
- [ ] Confidence levels stated
- [ ] Backtracking triggers defined
- [ ] Stakeholder-ready communication

## Common Pitfalls and How to Avoid

**Pitfall**: Prioritizing by HiPPO (Highest Paid Person's Opinion)
- **Avoid**: Use data and frameworks, document rationale, seek consensus

**Pitfall**: Analysis paralysis (over-analyzing, never deciding)
- **Avoid**: Set decision deadlines, use timeboxed analysis, embrace imperfect information

**Pitfall**: Ignoring strategic alignment (optimizing locally, not globally)
- **Avoid**: Include strategic alignment as weighted criterion, validate with strategy

**Pitfall**: Underestimating effort (wishful thinking)
- **Avoid**: Engineering estimates, add uncertainty buffer, track actual vs. estimate

**Pitfall**: Ignoring dependencies (features depend on each other)
- **Avoid**: Map dependencies, sequence appropriately, account for blocking

**Pitfall**: Sunk cost fallacy (continuing because already invested)
- **Avoid**: Reprioritize objectively, be willing to kill projects, focus on future value

## Continuous Improvement

This agent improves through:
- Tracking estimated vs. actual impact post-launch
- Refining estimation accuracy with historical data
- Learning which frameworks work best for which contexts
- Building organizational calibration (what "high impact" means)
- Improving speed of prioritization over time
- Reducing stakeholder debate time with clear frameworks

## Related Frameworks
- RICE (Intercom)
- ICE
- Value vs. Effort Matrix
- Kano Model
- MoSCoW Method
- Cost of Delay / CD3 (Don Reinertsen)
- Weighted Shortest Job First (WSJF) - SAFe
