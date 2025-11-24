# Cross-Functional Coordination Workflow

## Orchestrating Multi-Team Product Development

This workflow ensures effective coordination across engineering, design, marketing, sales, and other functions to deliver successful product initiatives.

## Phase 1: Team Structure and Roles

### Step 1.1: Core Team Definition
**Product Team Composition**:
```markdown
## Product Initiative: [Name]

**Product Manager**: [Name]
- Overall initiative ownership
- Decision authority and accountability
- Stakeholder management

**Engineering Lead**: [Name]
- Technical architecture and feasibility
- Engineering resource allocation
- Technical decision authority

**Design Lead**: [Name]
- User experience and design
- Design resource allocation
- Design system alignment

**Additional Core Members**:
- QA Lead
- Data Analyst
- Technical Writer
- Others as needed
```

**Verification**: Right people with right authority assigned

### Step 1.2: RACI Matrix
**For key decisions and deliverables, define**:
- **Responsible**: Who does the work
- **Accountable**: Who has final authority
- **Consulted**: Who provides input
- **Informed**: Who needs to know

**Example**:
```
| Activity | PM | Eng Lead | Design | Marketing | Sales |
|----------|-----|----------|--------|-----------|-------|
| PRD | A | C | C | I | I |
| Tech Design | C | A/R | I | I | I |
| UX Design | C | C | A/R | I | I |
| Go-to-Market Plan | C | I | I | A | C |
```

### Step 1.3: Cross-Functional Partner Identification
**Extended Team**:
- Marketing: Product marketing, growth, content
- Sales: Sales engineering, account executives
- Customer Success: Support, onboarding, advocacy
- Legal: Privacy, compliance, contracts
- Finance: Pricing, business case, ROI
- Operations: IT, security, infrastructure

## Phase 2: Planning and Kickoff

### Step 2.1: Project Brief Creation
```markdown
# Project Brief: [Initiative Name]

## Overview
- Problem statement
- Proposed solution
- Success metrics
- Timeline and milestones

## Team and Stakeholders
- Core team members
- Key stakeholders
- Decision makers

## Scope
- In scope
- Out of scope
- Open questions

## Dependencies
- Technical dependencies
- Design dependencies
- Go-to-market dependencies
- External dependencies

## Risks and Mitigations
- Key risks
- Mitigation strategies

## Resources
- PRD location
- Design files location
- Technical specs location
- Communication channels
```

### Step 2.2: Kickoff Meeting
**Agenda**:
1. **Context and goals** (5 min): Why we're doing this
2. **Scope and approach** (10 min): What we're building
3. **Roles and responsibilities** (5 min): Who does what
4. **Timeline and milestones** (10 min): When things happen
5. **Communication and process** (5 min): How we work together
6. **Q&A** (10 min): Address questions and concerns
7. **Next steps** (5 min): Immediate actions

**Outcomes**:
- Shared understanding of goals and scope
- Commitment from all functions
- Clear next steps for each team
- Communication channels established

### Step 2.3: Working Agreement
**Team norms**:
- **Communication**: Where and how we communicate
- **Meetings**: Standing meetings and decision forums
- **Decision-making**: How decisions get made
- **Documentation**: What we document and where
- **Availability**: Expected response times
- **Conflict resolution**: How we handle disagreements

## Phase 3: Development Coordination

### Step 3.1: Regular Sync Meetings
**Daily Standup** (Optional, for fast-moving projects):
- Duration: 15 minutes
- Attendance: Core team
- Format: What did you do? What will you do? Any blockers?

**Weekly Sync**:
- Duration: 30-60 minutes
- Attendance: Core team + key stakeholders
- Agenda:
  - Progress update (10 min)
  - Blockers and decisions (20 min)
  - Upcoming work (10 min)
  - Q&A (10 min)

**Biweekly Stakeholder Update**:
- Duration: 30 minutes
- Attendance: Extended stakeholders
- Format: Written update + Q&A session

### Step 3.2: Decision-Making Framework
**Decision Types**:
- **Type 1 (Reversible)**: Product manager can decide
- **Type 2 (Difficult to reverse)**: Core team consensus
- **Type 3 (Strategic)**: Escalate to leadership

**Decision Documentation**:
```markdown
## Decision: [Title]

**Date**: [Date]

**Decision Maker(s)**: [Name(s)]

**Context**: Why this decision was needed

**Options Considered**:
1. Option A: [Pros/Cons]
2. Option B: [Pros/Cons]
3. Option C: [Pros/Cons]

**Decision**: [Chosen option]

**Rationale**: [Why this option]

**Implications**: [What this means going forward]

**Validation Plan**: [How we'll know if this was right]
```

Save to: `./decisions/logs/[date]-[decision-topic].md`

### Step 3.3: Dependency Management
**Dependency Tracking**:
```markdown
## Dependency: [Description]

**Blocker for**: [What work is blocked]

**Owned by**: [Team/Person responsible]

**Status**: [Not Started/In Progress/Blocked/Complete]

**Due Date**: [When needed]

**Risk Level**: [High/Medium/Low]

**Mitigation**: [Backup plan if delayed]

**Updates**: [Latest progress]
```

**Dependency Review**:
- Weekly review of all dependencies
- Red/yellow/green status
- Escalation of at-risk dependencies
- Proactive communication to blocked teams

### Step 3.4: Parallel Workstream Coordination
**Engineering Workstreams**:
- Backend development
- Frontend development
- Infrastructure/DevOps
- QA and testing

**Design Workstreams**:
- User research and validation
- UX design and prototyping
- Visual design and UI
- Design QA

**Go-to-Market Workstreams**:
- Positioning and messaging
- Sales enablement
- Marketing campaigns
- Customer communication

**Coordination Points**:
- Integration milestones
- Review and approval gates
- Handoff protocols
- Shared documentation

## Phase 4: Engineering Collaboration

### Step 4.1: Technical Planning
**Sprint Planning Collaboration**:
- PM presents prioritized backlog
- Engineering estimates effort
- Jointly decide sprint commitment
- Identify dependencies and risks

**Technical Design Review**:
- Engineering proposes technical approach
- PM validates alignment with requirements
- Design validates UX feasibility
- Identify trade-offs and alternatives

### Step 4.2: Development Process
**Story Refinement**:
- PM writes user stories with acceptance criteria
- Engineering asks clarifying questions
- Design provides specs and assets
- QA defines test cases

**Definition of Done**:
- Code complete and reviewed
- Unit tests passing
- Integration tests passing
- Design QA approved
- Product acceptance criteria met
- Documentation updated

### Step 4.3: Quality Assurance Collaboration
- **Test plan review**: QA shares approach, PM validates coverage
- **Bug triage**: PM and eng prioritize bugs together
- **Acceptance testing**: PM validates against requirements
- **Performance testing**: Validate meets performance requirements

## Phase 5: Design Collaboration

### Step 5.1: Design Process Coordination
**Research Phase**:
- PM shares context and requirements
- Design conducts user research
- PM participates in research sessions
- Jointly synthesize insights

**Design Phase**:
- Design creates concepts and prototypes
- PM provides feedback on product requirements
- Engineering provides feedback on feasibility
- Iterate to converge on solution

**Validation Phase**:
- Design runs usability testing
- PM participates in validation
- Incorporate learnings into final design

### Step 5.2: Design Handoff
- **Design specs**: Complete and annotated
- **Assets**: All required assets exported
- **Design QA**: Process for validating implementation
- **Edge cases**: Documented and designed
- **Accessibility**: WCAG compliance verified

### Step 5.3: Design System Coordination
- Use existing components when possible
- New components reviewed by design system team
- Contribution process for new patterns
- Maintain consistency across product

## Phase 6: Go-to-Market Coordination

### Step 6.1: Marketing Collaboration
**Product Marketing**:
- **Positioning**: How product is positioned in market
- **Messaging**: Key messages and value props
- **Competitive analysis**: Competitive differentiation
- **Launch plan**: Marketing activities and timeline

**Growth Marketing**:
- **Acquisition channels**: How to reach new users
- **Activation strategy**: Getting users to value quickly
- **Retention campaigns**: Keeping users engaged
- **Metrics**: Growth KPIs and targets

### Step 6.2: Sales Enablement
- **Product training**: What it does and how it works
- **Demo environment**: Showcase environment for demos
- **Sales collateral**: Decks, one-pagers, FAQs
- **Competitive intel**: How to position vs. competitors
- **Pricing and packaging**: What's included in each tier

### Step 6.3: Customer Success Coordination
- **Onboarding updates**: New user experience changes
- **Support documentation**: Help articles and guides
- **Training materials**: Video tutorials, webinars
- **Known issues**: What to tell customers
- **Escalation process**: How to handle issues

### Step 6.4: Launch Coordination
**Launch Checklist**:
- [ ] Product ready (QA complete, bugs fixed)
- [ ] Documentation complete (help docs, API docs)
- [ ] Marketing assets ready (blog post, website, social)
- [ ] Sales enablement complete (training, collateral)
- [ ] Support prepared (knowledge base, escalation plan)
- [ ] Legal/compliance approved (privacy, security, legal)
- [ ] Monitoring and alerts configured
- [ ] Rollback plan documented
- [ ] Go/no-go decision

**Launch Meeting**:
- All functions present readiness status
- Go/no-go decision made
- Launch sequence confirmed
- Issue response plan reviewed

## Phase 7: Communication and Alignment

### Step 7.1: Status Communication
**Status Report Template**:
```markdown
# Status Update: [Initiative Name] - [Date]

## Summary
- Overall status: [On Track/At Risk/Blocked]
- Progress since last update
- Key accomplishments

## Progress by Workstream
- **Engineering**: [Status and progress]
- **Design**: [Status and progress]
- **Go-to-Market**: [Status and progress]

## Upcoming Milestones
- [Milestone 1]: [Date]
- [Milestone 2]: [Date]

## Blockers and Risks
- [Blocker/Risk]: [Impact and mitigation]

## Decisions Needed
- [Decision]: [Context and options]

## Key Metrics
- [Metric]: [Value and trend]
```

### Step 7.2: Cross-Functional Ceremonies
**Sprint Review/Demo**:
- Show progress to stakeholders
- Gather feedback
- Celebrate wins
- Discuss next steps

**Retrospective**:
- What went well
- What could improve
- Action items for next sprint
- Team health check

### Step 7.3: Documentation Centralization
**Single Source of Truth**:
- All documentation linked from project hub
- Clear ownership of each document
- Version control and update tracking
- Easy discoverability

**Documentation Types**:
- PRD: `./prds/active/[initiative].md`
- Technical specs: `./specs/technical/[initiative].md`
- Design specs: `./specs/functional/[initiative].md`
- Launch plan: `./roadmaps/[initiative]-launch.md`
- Decision log: `./decisions/logs/`

## Verification and Quality Assurance

### Level 1: Team Setup
- Core team defined with clear roles
- RACI matrix created
- Working agreement established
- Communication channels set up

### Level 2: Process Adherence
- Regular syncs happening
- Decisions documented
- Dependencies tracked
- Status communicated regularly

### Level 3: Collaboration Quality
- Cross-functional trust and respect
- Productive conflict resolution
- Shared understanding of goals
- Effective feedback loops

### Level 4: Delivery Excellence
- Milestones met on time
- Quality standards maintained
- Stakeholders satisfied
- Successful product launch

## Output Artifacts

1. **Project Brief** (`./prds/active/[initiative]-brief.md`)
2. **RACI Matrix** (`./frameworks/analysis/[initiative]-raci.md`)
3. **Working Agreement** (`./frameworks/analysis/[initiative]-working-agreement.md`)
4. **Decision Logs** (`./decisions/logs/`)
5. **Status Updates** (`./roadmaps/[initiative]-status.md`)
6. **Launch Checklist** (`./roadmaps/[initiative]-launch-checklist.md`)

## Integration Points

- Executes initiatives from Strategic Planning
- Implements features from PRD Framework
- Coordinates across all specialized workflows
- Reports progress to Stakeholder Management
- Tracks metrics via Metrics & Analytics
- Manages risks via Risk Assessment

## Success Criteria

- Cross-functional team aligned on goals
- Clear roles and responsibilities
- Effective communication and coordination
- Dependencies managed proactively
- Decisions made efficiently
- Quality standards maintained
- Successful product delivery
- Team satisfaction high
- Stakeholder expectations met
