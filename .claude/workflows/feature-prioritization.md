# Feature Prioritization Workflow

## Multi-Framework Prioritization with Systematic Validation

This workflow applies multiple prioritization frameworks to feature backlogs and ensures systematic, data-driven decision-making with transparent rationale.

## Phase 1: Backlog Preparation

### Step 1.1: Feature Collection and Standardization
- **Source aggregation**: Gather from user research, sales, support, strategy, technical debt
- **Feature description**: Clear problem statement and proposed solution
- **Requestor tracking**: Who requested and why
- **Initial categorization**: New feature, enhancement, bug fix, technical debt
- **Verification**: Ensure each item has clear definition and rationale

### Step 1.2: Context Enrichment
- **User impact scope**: Number of users affected (reach)
- **User problem severity**: How painful is the problem (1-10 scale)
- **Business value**: Revenue impact, strategic importance
- **Technical effort**: Development time estimate (S/M/L/XL or story points)
- **Technical complexity**: Risk and uncertainty level
- **Dependencies**: Prerequisites and blockers
- **Cross-validation**: Validate estimates with engineering and design

### Step 1.3: Data Collection
- **Quantitative data**: Usage analytics, conversion metrics, support tickets
- **Qualitative data**: User interviews, feedback, sales insights
- **Market data**: Competitive analysis, industry trends
- **Technical data**: Performance metrics, technical debt impact
- **Verification**: Data completeness and reliability check

## Phase 2: Multi-Framework Analysis

### Framework 1: RICE Scoring
**Formula**: (Reach × Impact × Confidence) / Effort

- **Reach**: Number of users affected per quarter
  - Scale: Actual number (e.g., 1000 users)
- **Impact**: Degree of impact per user
  - Scale: 3 = Massive, 2 = High, 1 = Medium, 0.5 = Low, 0.25 = Minimal
- **Confidence**: How confident are we in our estimates
  - Scale: 100% = High, 80% = Medium, 50% = Low
- **Effort**: Person-months required
  - Scale: Actual effort (e.g., 2 person-months)
- **RICE Score**: Calculate and rank

**Verification**: Validate assumptions for reach, impact, and effort estimates

### Framework 2: ICE Framework
**Formula**: (Impact × Confidence × Ease) / 3

- **Impact**: Business and user value (1-10 scale)
- **Confidence**: Certainty in success (1-10 scale)
- **Ease**: How easy to implement (1-10 scale, 10 = easiest)
- **ICE Score**: Calculate average

**Best for**: Quick prioritization when detailed data unavailable

### Framework 3: Value vs. Effort Matrix
**2×2 Matrix Quadrants**:
- **Quick Wins** (High Value, Low Effort): Prioritize first
- **Big Bets** (High Value, High Effort): Strategic investments
- **Fill-ins** (Low Value, Low Effort): Do when capacity available
- **Money Pit** (Low Value, High Effort): Avoid or deprioritize

**Plotting**:
- X-axis: Effort (1-10, higher = more effort)
- Y-axis: Value (1-10, higher = more value)
- Visual clustering and quadrant analysis

### Framework 4: Kano Model Analysis
**Categories**:
- **Basic/Must-be**: Expected features, dissatisfaction if missing
- **Performance**: Linear satisfaction with performance
- **Excitement/Delighters**: Unexpected features that wow users
- **Indifferent**: Doesn't significantly impact satisfaction
- **Reverse**: Some users dislike

**Application**:
- Categorize each feature
- Balance portfolio across categories
- Ensure basics covered, add delighters strategically

### Framework 5: MoSCoW Method
**Categories**:
- **Must have**: Non-negotiable for launch
- **Should have**: Important but not critical
- **Could have**: Nice to have if resources allow
- **Won't have**: Out of scope for this cycle

**Constraints**:
- Must haves: Max 60% of effort
- Should haves: ~20% of effort
- Could haves: ~20% of effort
- **Verification**: Ensure must-haves are truly essential

### Framework 6: Weighted Scoring Model
**Custom Criteria Weighting**:
```
Criteria examples (adjust weights per organization):
- User value: 25%
- Business value: 25%
- Strategic alignment: 20%
- Technical feasibility: 15%
- Competitive advantage: 10%
- Time sensitivity: 5%
```

- Score each feature on each criterion (1-10)
- Multiply by weights
- Sum for total weighted score
- Rank by weighted score

**Verification**: Ensure criteria weights align with current strategy

### Framework 7: Cost of Delay (CD3)
**Formula**: User/Business Value / Duration

- **User/Business Value**: Combined impact score
- **Duration**: Time to implement and deploy
- **Cost of Delay**: Value lost per unit time delay
- **CD3 Score**: CoD / Duration = economic priority

**Best for**: Time-sensitive features with clear value metrics

## Phase 3: Synthesis and Decision-Making

### Step 3.1: Cross-Framework Analysis
- Run all applicable frameworks
- Identify features that rank highly across multiple frameworks
- Investigate discrepancies when frameworks disagree
- Document assumptions and data sources
- **Verification**: Check for scoring bias or systematic errors

### Step 3.2: Qualitative Overlay
- **Strategic initiatives**: Do features support key strategies?
- **User research insights**: What do users actually need most?
- **Technical architecture**: What enables future capabilities?
- **Competitive pressure**: What's competitively critical?
- **Team motivation**: What energizes the team?
- **Backtracking Point**: If frameworks suggest misalignment with strategy

### Step 3.3: Portfolio Balancing
Balance across:
- **Time horizons**: Quick wins vs. long-term investments
- **User segments**: Ensure all key personas served
- **Value types**: User value vs. business value vs. technical health
- **Risk profile**: Safe bets vs. innovative experiments
- **Feature types**: New capabilities vs. improvements vs. technical debt

### Step 3.4: Constraint Application
- **Team capacity**: Can we realistically deliver?
- **Technical dependencies**: Are prerequisites completed?
- **Design capacity**: Do we have design support?
- **External dependencies**: Third-party APIs, partnerships
- **Market timing**: Are there time-sensitive windows?

## Phase 4: Prioritized Backlog Creation

### Step 4.1: Final Ranking
- Create prioritized list with clear rationale for each decision
- Group into tiers: P0 (must do), P1 (should do), P2 (could do), P3 (won't do now)
- Assign to releases/sprints
- Document trade-offs and decisions made

### Step 4.2: Roadmap Mapping
- Map prioritized features to roadmap timeline
- Visualize themes and strategic initiatives
- Show dependencies and sequencing
- Create stakeholder-appropriate views

### Step 4.3: Communication Package
- **Executive summary**: Top priorities and rationale
- **Team backlog**: Detailed prioritized list for execution
- **Stakeholder view**: Features by theme/initiative
- **Customer roadmap**: Public-safe feature timeline

## Phase 5: Continuous Refinement

### Step 5.1: Backlog Grooming Cadence
- **Weekly**: Review top 10-20 items, refine details
- **Bi-weekly**: Groom upcoming sprint candidates
- **Monthly**: Reprioritize full backlog based on new data
- **Quarterly**: Major reprioritization aligned with strategy review

### Step 5.2: Feedback Loop Integration
- **User feedback**: Support tickets, NPS, user interviews
- **Market changes**: Competitor moves, industry shifts
- **Technical learnings**: What we learned building recent features
- **Business metrics**: Actual impact of shipped features
- **Adaptation**: Update scoring and reprioritize based on learnings

### Step 5.3: Decision Log Maintenance
- Document all major prioritization decisions
- Track rationale and assumptions
- Review accuracy of predictions
- Learn from successes and misses
- Improve estimation over time

## Verification and Quality Assurance

### Level 1: Data Quality
- Scores based on reliable data, not guesses
- Effort estimates validated by engineering
- Impact estimates grounded in research
- All features have complete information

### Level 2: Framework Application
- Frameworks applied consistently
- Scoring criteria clear and documented
- Calculations verified for accuracy
- Multiple perspectives considered

### Level 3: Strategic Alignment
- Top priorities support strategic objectives
- Portfolio balanced appropriately
- Resources allocated to highest value
- Trade-offs explicitly documented

### Level 4: Stakeholder Agreement
- Engineering agrees on feasibility and effort
- Design agrees on scope and timeline
- Business agrees on value and priorities
- Leadership approves resource allocation

## Output Artifacts

1. **Prioritized Backlog** (`./frameworks/prioritization/backlog-[date].md`)
2. **Prioritization Analysis** (`./frameworks/prioritization/analysis-[date].md`)
3. **Decision Log** (`./decisions/logs/prioritization-[date].md`)
4. **Roadmap View** (Link to roadmap documents)
5. **Scoring Spreadsheet** (If using external tools)

## Integration Points

- Receives input from Problem Decomposition, User Research, Strategic Planning
- Feeds into PRD Framework for detailed specification
- Connects to Metrics & Analytics for tracking impact
- Links to Cross-functional workflow for execution coordination
- Integrates with Risk Assessment for risk-aware prioritization

## Success Criteria

- Clear prioritization rationale for all decisions
- Stakeholder consensus on priorities
- Backlog grooming process established
- Prioritization frameworks consistently applied
- Data-driven decision making with transparent trade-offs
- Regular reprioritization based on new information
- Team understands and agrees with priorities
