# Risk Assessment Workflow

## Proactive Risk Identification and Mitigation Planning

This workflow enables systematic identification, assessment, and mitigation of risks across product initiatives to minimize surprises and increase probability of success.

## Phase 1: Risk Identification

### Step 1.1: Risk Categories
**Technical Risks**:
- Technology uncertainty or complexity
- Architecture scalability concerns
- Technical debt accumulation
- Integration challenges
- Performance and reliability issues
- Security vulnerabilities
- Data migration risks

**Market Risks**:
- Competitive threats
- Market timing and windows
- Product-market fit uncertainty
- Customer adoption challenges
- Pricing and monetization risks
- Market size miscalculation

**Execution Risks**:
- Resource constraints (people, budget, time)
- Team skill gaps
- Cross-functional coordination challenges
- Dependency on external parties
- Scope creep
- Timeline pressure
- Quality trade-offs

**Business Risks**:
- Strategic misalignment
- ROI uncertainty
- Regulatory and compliance issues
- Legal and IP concerns
- Partnership dependencies
- Revenue impact

**User Risks**:
- User experience degradation
- User adoption barriers
- User trust and privacy concerns
- Accessibility issues
- Learning curve too steep

### Step 1.2: Risk Discovery Methods
**Structured Brainstorming**:
- Cross-functional team workshop
- Pre-mortem exercise: "Imagine we failed, why?"
- SWOT analysis (Strengths, Weaknesses, Opportunities, Threats)
- Risk checklist review

**Expert Consultation**:
- Engineering: Technical risks
- Design: UX and adoption risks
- Security: Security and privacy risks
- Legal: Compliance and legal risks
- Sales/CS: Customer and market risks

**Historical Review**:
- Past project post-mortems
- Similar initiative learnings
- Industry case studies
- Competitor failures and successes

**Data Analysis**:
- Usage analytics (current behavior patterns)
- Support tickets (common issues)
- User research (pain points and concerns)
- Market research (trends and threats)

**Verification**: Comprehensive risk coverage across all categories

### Step 1.3: Risk Documentation
```markdown
## Risk: [Risk Title]

**Category**: [Technical/Market/Execution/Business/User]

**Description**: [Clear description of the risk]

**Trigger Events**: [What would cause this risk to materialize]

**Impact if Occurs**: [Consequences if risk happens]

**Current Status**: [Identified/Monitoring/Active/Mitigated/Closed]

**Probability**: [High/Medium/Low] ([%] likelihood)

**Impact**: [High/Medium/Low] (scale: 1-10)

**Risk Score**: [Probability × Impact]

**Owner**: [Who is responsible for monitoring and mitigation]

**Related Risks**: [Links to related risks]
```

Save to: `./decisions/risks/[initiative]-risks.md`

## Phase 2: Risk Assessment and Prioritization

### Step 2.1: Probability Assessment
**Probability Scale**:
- **High (70-90%)**: Likely to occur given current conditions
- **Medium (30-70%)**: May or may not occur
- **Low (10-30%)**: Unlikely but possible
- **Very Low (<10%)**: Very unlikely but worth noting

**Assessment Criteria**:
- Historical data: How often has this happened before?
- Current conditions: What factors increase/decrease likelihood?
- Expert judgment: What do subject matter experts think?
- Leading indicators: Are warning signs present?

**Verification**: Probability estimates grounded in data and expertise

### Step 2.2: Impact Assessment
**Impact Dimensions**:
- **Timeline**: How much delay would this cause?
- **Budget**: What would be the financial cost?
- **Quality**: How would product quality be affected?
- **User experience**: What would be user impact?
- **Business results**: Effect on strategic goals and metrics?
- **Reputation**: Brand and reputation impact?

**Impact Scale**:
- **High (8-10)**: Critical impact on project success
- **Medium (4-7)**: Significant but manageable impact
- **Low (1-3)**: Minor impact, easily absorbed

**Combined Risk Score**: Probability (%) × Impact (1-10) = Risk Score

### Step 2.3: Risk Prioritization
**Priority Matrix (Probability × Impact)**:
```
           Low Impact    Medium Impact   High Impact
High Prob  Monitor       Mitigate        Mitigate Now
Med Prob   Monitor       Assess          Mitigate
Low Prob   Accept        Monitor         Assess
```

**Priority Levels**:
- **Critical (P0)**: High probability + High impact - Address immediately
- **High (P1)**: High prob + Med impact OR Med prob + High impact - Address soon
- **Medium (P2)**: Med prob + Med impact - Monitor and plan mitigation
- **Low (P3)**: Low prob or Low impact - Monitor periodically

**Prioritized Risk List**: Sort by risk score, review by category

## Phase 3: Risk Mitigation Planning

### Step 3.1: Mitigation Strategy Types
**Avoid**: Eliminate the risk
- Change approach to avoid risk entirely
- Remove risky feature or component
- Example: Use proven technology instead of experimental

**Reduce**: Decrease probability or impact
- Mitigate likelihood (e.g., early prototyping)
- Mitigate impact (e.g., phased rollout)
- Example: Run proof of concept before full build

**Transfer**: Shift risk to third party
- Insurance or contracts
- Outsource to specialist
- Example: Use third-party service instead of building

**Accept**: Acknowledge and plan to handle if occurs
- Risk too costly to mitigate
- Probability very low
- Have contingency plan ready
- Example: Accept small feature delay risk

**Exploit**: Turn risk into opportunity (for positive risks)
- Example: Market gap could be competitive advantage

### Step 3.2: Mitigation Plan Documentation
```markdown
## Mitigation Plan: [Risk Title]

**Risk**: [Link to risk documentation]

**Mitigation Strategy**: [Avoid/Reduce/Transfer/Accept]

**Mitigation Actions**:
1. [Action 1]: [Owner] by [Date]
2. [Action 2]: [Owner] by [Date]
3. [Action 3]: [Owner] by [Date]

**Expected Outcome**: [How this reduces probability or impact]

**Cost of Mitigation**: [Time/Budget/Resources required]

**Contingency Plan**: [What we do if risk materializes despite mitigation]

**Success Criteria**: [How we know mitigation worked]

**Residual Risk**: [Remaining risk after mitigation]
```

### Step 3.3: Contingency Planning
**Contingency Plan Structure**:
```markdown
## Contingency: If [Risk] Occurs

**Trigger Conditions**: [How we know it's happening]

**Response Team**: [Who handles this]

**Immediate Actions** (First 24 hours):
1. [Action]
2. [Action]

**Short-term Actions** (First week):
1. [Action]
2. [Action]

**Communication Plan**:
- Who to notify
- What to communicate
- Communication channels

**Resource Needs**: [What resources we need mobilized]

**Decision Authority**: [Who can authorize actions]

**Backtracking Point**: [When to consider major pivot]
```

## Phase 4: Risk Monitoring and Tracking

### Step 4.1: Risk Register Maintenance
**Risk Register**: Central tracking document
- All identified risks
- Current status and scores
- Mitigation plans
- Owners and due dates
- Regular updates

**Location**: `./decisions/risks/[initiative]-risk-register.md`

**Update Cadence**:
- **Daily**: Critical (P0) risks
- **Weekly**: High (P1) risks
- **Bi-weekly**: Medium (P2) risks
- **Monthly**: Low (P3) risks and full register review

### Step 4.2: Leading Indicator Monitoring
**For each risk, identify**:
- **Leading indicators**: Early warning signals
- **Monitoring method**: How to track
- **Alert thresholds**: When to escalate
- **Review frequency**: How often to check

**Example**:
```markdown
## Risk: Backend performance degradation

**Leading Indicators**:
- Response time trending up
- Error rate increasing
- Database query time growing

**Monitoring**: Real-time dashboard

**Thresholds**:
- Yellow alert: Response time >500ms (95th percentile)
- Red alert: Response time >1000ms OR Error rate >1%

**Review**: Daily during development, hourly post-launch
```

### Step 4.3: Risk Status Updates
**Status Change Triggers**:
- New risk identified
- Probability or impact changed
- Mitigation action completed
- Risk materialized
- Risk no longer relevant

**Communication**:
- Update risk register
- Notify risk owner and stakeholders
- Escalate if moving to higher priority
- Celebrate when mitigated or avoided

## Phase 5: Risk Response and Adaptation

### Step 5.1: Risk Materialization Response
**When risk occurs**:
1. **Activate contingency plan**: Execute prepared response
2. **Assess severity**: Actual vs. expected impact
3. **Mobilize resources**: Allocate people and budget
4. **Communicate**: Update stakeholders per communication plan
5. **Execute response**: Implement mitigation actions
6. **Monitor effectiveness**: Track if response working
7. **Adjust as needed**: Adapt response based on results
8. **Document learnings**: Capture for future reference

### Step 5.2: Risk Evolution and Reassessment
**Reassess risks when**:
- Project phase changes (planning → development → launch)
- Significant external change (market, competition, regulation)
- New information available (user feedback, technical findings)
- Timeline or scope changes
- Resources or constraints change

**Reassessment Process**:
- Review all risk probabilities and impacts
- Add newly identified risks
- Close risks no longer relevant
- Update mitigation plans
- Reprioritize risk list

### Step 5.3: Escalation Protocol
**Escalation Criteria**:
- Critical risk probability increased significantly
- Multiple high-priority risks materializing
- Mitigation actions not working
- Resources insufficient to address risks
- Risk threatens project viability

**Escalation Path**:
1. **Product Manager**: First line of response
2. **Product Leadership**: Resource allocation and trade-offs
3. **Cross-functional Leadership**: Major scope or timeline changes
4. **Executive Team**: Strategic decisions or project cancellation

**Escalation Communication**:
- Clear description of risk and impact
- Actions taken so far
- Options for consideration
- Recommendation
- Decision needed and timeline

## Phase 6: Risk Communication

### Step 6.1: Stakeholder Risk Reporting
**Executive Risk Report** (Monthly):
- Top 5 risks
- Risk trends (improving/worsening)
- Major mitigation actions
- Risks requiring decisions

**Team Risk Review** (Weekly):
- All active risks
- Action items and owners
- Blockers or concerns
- New risks identified

**Stakeholder Risk Communication**:
- Transparency: Share risks proactively
- Context: Explain why risk matters
- Action: What's being done
- Confidence: Level of concern and control

### Step 6.2: Risk Visualization
**Risk Heat Map**:
- X-axis: Impact (Low → High)
- Y-axis: Probability (Low → High)
- Plot all risks
- Color code by category
- Size by risk score

**Risk Trend Chart**:
- Track risk score over time
- Show mitigation effectiveness
- Identify improving/worsening risks

**Risk Burndown**:
- Number of risks by priority over time
- Goal: Reduce high-priority risks

### Step 6.3: Risk Culture and Mindset
**Encourage Risk Awareness**:
- Reward identification of risks early
- No blame when risks materialize
- Learn from risk events
- Celebrate successful mitigation

**Psychological Safety**:
- Safe to raise concerns
- Bad news welcomed
- Constructive discussion of risks
- Focus on solving, not blaming

## Phase 7: Learning and Improvement

### Step 7.1: Risk Retrospectives
**After project completion or major milestone**:
- Which risks materialized?
- Which didn't?
- How accurate were probability and impact estimates?
- What worked well in mitigation?
- What could we have done better?
- What did we miss?

### Step 7.2: Risk Playbook Development
**Build organizational knowledge**:
- Common risks by project type
- Effective mitigation strategies
- Early warning indicators
- Response playbooks
- Expert contacts for risk types

**Location**: `./frameworks/analysis/risk-playbooks/`

### Step 7.3: Continuous Improvement
- Refine risk assessment criteria
- Improve mitigation strategies
- Enhance monitoring capabilities
- Build better contingency plans
- Share learnings across teams

## Verification and Quality Assurance

### Level 1: Risk Identification
- Comprehensive risk discovery across all categories
- Cross-functional input gathered
- Risks clearly documented
- All major risks captured

### Level 2: Risk Assessment
- Probability and impact estimates evidence-based
- Risk prioritization logical and defensible
- Mitigation plans specific and actionable
- Contingency plans prepared for critical risks

### Level 3: Risk Monitoring
- Regular risk reviews happening
- Leading indicators tracked
- Risk register kept up to date
- Status changes communicated

### Level 4: Risk Response
- Risks proactively mitigated
- Materialized risks handled effectively
- Stakeholders informed appropriately
- Learning captured and applied

## Output Artifacts

1. **Risk Register** (`./decisions/risks/[initiative]-risk-register.md`)
2. **Risk Mitigation Plans** (`./decisions/risks/[risk]-mitigation-plan.md`)
3. **Contingency Plans** (`./decisions/risks/[risk]-contingency-plan.md`)
4. **Risk Reports** (`./decisions/risks/reports/[date]-risk-report.md`)
5. **Risk Retrospective** (`./decisions/reviews/[initiative]-risk-retrospective.md`)
6. **Risk Playbooks** (`./frameworks/analysis/risk-playbooks/`)

## Integration Points

- Informs Problem Decomposition with constraint awareness
- Validates PRD Framework feasibility
- Influences Strategic Planning decisions
- Affects Feature Prioritization (risk-adjusted)
- Guides Cross-functional Coordination
- Reported via Stakeholder Management
- Tracked via Metrics & Analytics

## Success Criteria

- Comprehensive risk identification and assessment
- Proactive mitigation plans in place
- Regular monitoring and updates
- No major surprises or unidentified risks materializing
- Effective response when risks occur
- Stakeholder confidence in risk management
- Continuous improvement in risk practices
- Learning captured and shared
