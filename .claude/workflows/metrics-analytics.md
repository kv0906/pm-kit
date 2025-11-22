# Metrics & Analytics Workflow

## Data-Driven Product Management and Decision Making

This workflow establishes systematic approaches to defining, tracking, and analyzing product metrics to inform decisions and measure success.

## Phase 1: Metrics Framework Definition

### Step 1.1: North Star Metric Selection
- **Definition**: Single metric that best captures core value delivered to customers
- **Criteria**:
  - Expresses value delivery
  - Represents vision and strategy
  - Measurable and trackable
  - Actionable (team can influence)
  - Leading indicator of sustainable growth
- **Examples**:
  - Weekly active creators (content platform)
  - Messages sent per week (communication tool)
  - Successful transactions (marketplace)
- **Verification**: Aligns with business model and strategic objectives

### Step 1.2: Metrics Hierarchy
**Framework: North Star + Input Metrics + Health Metrics**

**North Star Metric**:
- Primary success indicator

**Input Metrics** (drive North Star):
- Acquisition: New user signups, activation rate
- Activation: Time to value, key action completion
- Engagement: Feature usage, frequency, depth
- Retention: Return rate, churn rate
- Revenue: Conversion rate, ARPU, LTV
- Referral: Viral coefficient, NPS

**Health Metrics** (quality indicators):
- Performance: Load time, uptime, error rates
- Quality: Bug reports, support tickets
- User satisfaction: NPS, CSAT, user feedback
- Technical debt: Code quality, security vulnerabilities

**Verification**: Input metrics have clear causal relationship to North Star

### Step 1.3: Metrics by Product Lifecycle Stage
**Pre-Launch (Development)**:
- Development velocity
- Quality metrics (test coverage, bug count)
- Design iteration cycles

**Launch (Introduction)**:
- Initial adoption rate
- User feedback scores
- Critical bugs and issues

**Growth**:
- User acquisition cost (CAC)
- Activation rate
- Viral coefficient
- Month-over-month growth

**Maturity**:
- Retention and churn rates
- Customer lifetime value (LTV)
- LTV:CAC ratio
- Feature engagement depth

**Decline/Revitalization**:
- Churn reasons
- Win-back success rate
- Feature refresh impact

## Phase 2: Metrics Definition and Documentation

### Step 2.1: Metric Specification
**For each metric document**:
```markdown
## Metric: [Metric Name]

**Definition**: [Clear, unambiguous definition]

**Calculation**: [Precise formula or query]

**Data Source**: [Where data comes from]

**Update Frequency**: [Real-time / Hourly / Daily / Weekly]

**Owner**: [Who is responsible]

**Target**: [Goal value and timeframe]

**Why it matters**: [Business/user importance]

**How to influence**: [Actions that impact this metric]

**Dashboard location**: [Link to dashboard]

**Related metrics**: [Connected metrics]
```

### Step 2.2: Baseline Establishment
- **Historical data collection**: Gather past performance data
- **Baseline calculation**: Current state before changes
- **Trend analysis**: Historical patterns and seasonality
- **Benchmark research**: Industry standards, competitors
- **Verification**: Data quality and completeness check

### Step 2.3: Target Setting
- **Stretch target**: Ambitious but achievable goal
- **Committed target**: High-confidence goal
- **Rationale**: Why this target (market, resources, strategy)
- **Timeline**: When target should be achieved
- **Consequences**: What happens if missed or exceeded
- **SMART validation**: Specific, Measurable, Achievable, Relevant, Time-bound

## Phase 3: Measurement Infrastructure

### Step 3.1: Instrumentation Planning
- **Event tracking design**: What events to track
- **Event properties**: What data to capture per event
- **User properties**: What to know about users
- **Session properties**: Context of user activity
- **Implementation plan**: Technical approach and timeline

### Step 3.2: Data Quality Assurance
- **Schema validation**: Ensure data structure correct
- **Completeness checks**: All expected events captured
- **Accuracy validation**: Data matches expected values
- **Consistency verification**: Cross-platform consistency
- **Testing protocol**: QA process for new instrumentation

### Step 3.3: Dashboard Creation
**Dashboard Design Principles**:
- Hierarchy: Most important metrics prominent
- Context: Show trends, comparisons, targets
- Actionability: Link metrics to actions
- Accessibility: Right people see right data
- Performance: Fast load times

**Dashboard Types**:
- **Executive Dashboard**: High-level business metrics
- **Product Health Dashboard**: North Star + inputs + health
- **Feature Dashboard**: Specific feature performance
- **Funnel Dashboard**: Conversion analysis
- **Cohort Dashboard**: Retention and engagement trends

**Save locations**: `./metrics/dashboards/[dashboard-name].md` (with links to BI tool)

## Phase 4: Analysis and Insights

### Step 4.1: Exploratory Analysis
**Regular Analysis Cadences**:
- **Daily**: Anomaly detection, critical metric monitoring
- **Weekly**: Trend analysis, week-over-week changes
- **Monthly**: Deep dives, cohort analysis, experimentation results
- **Quarterly**: Strategic review, goal progress, forecast updates

**Analysis Techniques**:
- Trend analysis: Directional movement over time
- Segmentation: Performance by user type, channel, etc.
- Funnel analysis: Where users drop off
- Cohort analysis: Behavior patterns by cohort
- Correlation analysis: Relationships between metrics

### Step 4.2: Root Cause Analysis
**When metric moves unexpectedly**:
1. **Verify data accuracy**: Rule out instrumentation issues
2. **Segment the movement**: Which user segments driving change?
3. **Timeline correlation**: What changed when metric moved?
4. **Hypothesis generation**: Potential causes
5. **Hypothesis testing**: Validate with additional data
6. **Root cause identification**: Confirmed reason for movement
7. **Documentation**: Capture learnings

**Backtracking Point**: If can't identify root cause, gather more data

### Step 4.3: Predictive Analytics
- **Forecasting**: Project future metric values
- **Scenario modeling**: What-if analysis for decisions
- **Leading indicators**: Early signals of future performance
- **Risk identification**: Metrics trending toward danger zone
- **Opportunity spotting**: Emerging positive trends

### Step 4.4: Insight Documentation
```markdown
## Analysis: [Title]

**Date**: [Date]

**Analyst**: [Name]

**Observation**: [What we noticed in data]

**Analysis**: [How we investigated]

**Finding**: [What we learned]

**Why it matters**: [Business impact]

**Recommendation**: [Suggested action]

**Related analyses**: [Links]
```

Save to: `./metrics/analyses/[date]-[topic].md`

## Phase 5: Experimentation Framework

### Step 5.1: A/B Test Design
**Hypothesis Template**:
```
We believe that [change] will cause [metric] to [increase/decrease]
because [rationale based on user insight].
```

**Test Design**:
- **Primary metric**: Main success measure
- **Secondary metrics**: Additional measures
- **Guardrail metrics**: Should not degrade
- **Sample size calculation**: Statistical power analysis
- **Duration calculation**: Time to significance
- **Success criteria**: What result validates hypothesis

### Step 5.2: Test Execution
- **Implementation**: Build and QA test variants
- **Randomization**: Proper user assignment
- **Instrumentation verification**: Tracking working correctly
- **Monitoring**: Watch for issues during test
- **Data collection**: Gather results over test period

### Step 5.3: Results Analysis
- **Statistical significance**: P-value calculation
- **Effect size**: Magnitude of impact
- **Confidence intervals**: Range of likely true effect
- **Segmentation analysis**: Different effects by segment
- **Novelty effects**: Consider time-based patterns
- **Decision**: Ship, iterate, or abandon

**Verification**: Multiple reviewers validate analysis

### Step 5.4: Experimentation Learning
- **Document results**: Test outcomes and learnings
- **Meta-analysis**: Patterns across experiments
- **Framework refinement**: Improve experimentation process
- **Knowledge sharing**: Distribute insights to team

## Phase 6: Reporting and Communication

### Step 6.1: Regular Reporting Cadence
**Weekly Product Review**:
- Key metrics snapshot
- Week-over-week changes
- Notable observations
- Blockers and risks

**Monthly Business Review**:
- Month-over-month performance
- Goal progress tracking
- Deep dive on 1-2 topics
- Forecast updates

**Quarterly Strategic Review**:
- Quarter results vs. targets
- Trends and patterns
- Learnings and insights
- Next quarter goals

### Step 6.2: Stakeholder-Specific Views
- **Executive team**: Business outcomes, strategic progress
- **Product team**: Feature performance, user behavior
- **Engineering team**: Technical health, performance
- **Sales team**: Adoption, usage, customer health
- **Customer success**: User satisfaction, retention

### Step 6.3: Metric Stories
**Narrative Structure**:
1. **What happened**: Metric movement or observation
2. **Why it happened**: Root cause or driver
3. **Why it matters**: Business/user impact
4. **What we're doing**: Action plan
5. **What to watch**: Leading indicators

## Verification and Quality Assurance

### Level 1: Data Quality
- Instrumentation tested and verified
- Data completeness checked
- Anomalies investigated
- Data source reliability confirmed

### Level 2: Analysis Rigor
- Statistical methods appropriate
- Assumptions validated
- Alternative explanations considered
- Peer review of complex analyses

### Level 3: Insight Validity
- Insights supported by data
- Causation vs correlation understood
- Context and limitations noted
- Actionable recommendations provided

### Level 4: Decision Impact
- Metrics inform product decisions
- Experiments drive learning and iteration
- Goals set and tracked systematically
- Team develops data literacy

## Output Artifacts

1. **Metrics Framework Document** (`./metrics/dashboards/metrics-framework.md`)
2. **Metric Definitions** (`./metrics/dashboards/metric-definitions.md`)
3. **Analysis Reports** (`./metrics/analyses/[date]-[topic].md`)
4. **Experiment Results** (`./metrics/reports/experiments/[test-name].md`)
5. **Weekly/Monthly Reports** (`./metrics/reports/[period]/[date]-report.md`)
6. **Dashboards** (Links in documentation, actual dashboards in BI tool)

## Integration Points

- Supports all workflows with data-driven insights
- Validates Problem Decomposition with usage data
- Measures PRD success criteria
- Informs Feature Prioritization with impact data
- Validates User Research findings quantitatively
- Tracks Strategic Planning goal progress
- Feeds Risk Assessment with early warning signals

## Success Criteria

- North Star metric defined and tracked
- Comprehensive metrics hierarchy established
- Dashboards accessible and used regularly
- Regular analysis cadence maintained
- Experiments running continuously
- Data-informed decision making culture
- Metrics literacy across product team
- Clear connection between actions and outcomes
