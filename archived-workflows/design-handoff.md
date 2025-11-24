# Design Handoff Workflow

## Long-CoT Design Handoff Framework

This workflow enables PMs to create comprehensive design specifications that bridge the gap between product requirements and high-fidelity design, providing designers with clear direction while maintaining flexibility for creative execution.

## Phase 1: Requirements Synthesis

### Step 1.1: Gather Context
- Review PRD and user research
- Understand user goals and pain points
- Identify key user flows
- Note technical constraints
- Review existing design patterns
- **Verification**: Complete context for design work?

### Step 1.2: Define Design Scope
- List all screens/views needed
- Identify new vs. existing components
- Determine design complexity level
- Estimate design timeline
- Identify dependencies (content, brand guidelines)
- **Verification**: Design scope clearly bounded?

### Step 1.3: Prioritize Design Work
- Classify screens by priority (P0, P1, P2)
- Identify MVP vs. future phases
- Determine design sequence (what to design first)
- Note design dependencies
- **Verification**: Clear prioritization for designer?

## Phase 2: Screen Specification

### Step 2.1: Create Screen Inventory
- List all screens/views
- Describe purpose of each screen
- Define user entry and exit points
- Map screen relationships (navigation)
- Identify screen variants (states, responsive)
- **Verification**: Complete screen coverage?

### Step 2.2: Define Screen Layouts
For each screen:
- Create ASCII wireframe or reference
- Specify content zones
- Define visual hierarchy
- Note responsive behavior
- Identify fold line (above/below)
- **Verification**: Layout structure clear?

### Step 2.3: Specify Content Requirements
For each screen, document:
- Headings and labels
- Body copy (tone, length)
- Placeholder content
- Image requirements (size, type, alt text)
- Data to display (source, format)
- **Verification**: Content requirements complete?

## Phase 3: Component Specification

### Step 3.1: Component Inventory
- List all UI components needed
- Identify reusable vs. one-off components
- Check existing design system for matches
- Flag net new component requirements
- Note component complexity
- **Verification**: All components identified?

### Step 3.2: Define Component Behavior
For each component, specify:
- **States**: Default, hover, active, focus, disabled, loading, error, success
- **Interactions**: Click, keyboard, touch gestures
- **Animations**: Transitions, micro-interactions
- **Variants**: Size, color, icon variations
- **Data binding**: What data component displays
- **Verification**: Complete behavioral spec?

### Step 3.3: Component Hierarchy
- Create component tree structure
- Define parent-child relationships
- Specify composition rules
- Note layout constraints
- Document responsive behavior
- **Verification**: Component relationships clear?

## Phase 4: Interaction Design

### Step 4.1: User Flow Documentation
- Create Mermaid flowcharts for key journeys
- Show decision points clearly
- Document error paths
- Include success and failure end states
- Note system vs. user actions
- **Verification**: Complete flow coverage?

### Step 4.2: Interaction Patterns
Define patterns for:
- **Navigation**: Top nav, sidebar, tabs, breadcrumbs
- **Forms**: Input validation, error handling, success feedback
- **Modals**: Overlay, drawer, fullscreen
- **Lists**: Pagination, infinite scroll, filtering, sorting
- **Search**: Autocomplete, filters, results display
- **Verification**: Patterns match platform conventions?

### Step 4.3: Micro-interactions
Specify details for:
- Button press feedback
- Form field focus
- Loading indicators
- Success confirmations
- Error notifications
- Transitions between screens
- **Verification**: Delightful but not distracting?

## Phase 5: Responsive & Accessibility

### Step 5.1: Responsive Breakpoints
Define behavior at:
- **Mobile** (<768px): Layout, navigation, interactions
- **Tablet** (768-1024px): Hybrid patterns
- **Desktop** (>1024px): Full experience
- **Large screens** (>1440px): Max width, scaling
- Note key differences per breakpoint
- **Verification**: Responsive strategy clear?

### Step 5.2: Accessibility Requirements
Specify:
- **WCAG level**: AA or AAA compliance
- **Color contrast**: Text (4.5:1), UI (3:1)
- **Keyboard navigation**: Tab order, shortcuts
- **Screen reader**: ARIA labels, semantic HTML
- **Touch targets**: Minimum 44x44px
- **Motion**: Respect prefers-reduced-motion
- **Verification**: Accessibility requirements complete?

### Step 5.3: Inclusive Design Considerations
- **Localization**: Text expansion, RTL support
- **Dark mode**: Color palette, contrast
- **Font scaling**: Readable at 200% zoom
- **Low bandwidth**: Progressive loading
- **Older devices**: Performance graceful degradation
- **Verification**: Inclusive design addressed?

## Phase 6: Visual Direction (Optional)

### Step 6.1: Brand Alignment
- Reference brand guidelines
- Specify brand elements to include
- Note tone and personality
- Identify visual inspiration
- Define guardrails (what to avoid)
- **Verification**: Brand direction clear?

### Step 6.2: Visual Hierarchy
- Primary content (most prominent)
- Secondary content (supporting)
- Tertiary content (de-emphasized)
- Interactive elements (clear affordances)
- Feedback elements (visible but not intrusive)
- **Verification**: Hierarchy priorities set?

### Step 6.3: Visual References (Optional)
- Competitor examples (inspiration)
- Design patterns (references)
- Mood boards (if needed)
- Anti-patterns (what to avoid)
- **Note**: Be careful not to over-constrain designer creativity

## Phase 7: Edge Cases & States

### Step 7.1: Empty States
For each content area, define:
- First-time user experience (no data yet)
- Cleared/deleted state (data removed)
- No results state (search/filter yields nothing)
- Offline state (no connection)
- **Verification**: All empty states covered?

### Step 7.2: Loading States
Define loading experience:
- Initial page load
- Component-level loading
- Background data refresh
- Optimistic updates
- Loading timeout handling
- **Verification**: Loading UX smooth?

### Step 7.3: Error States
For each error scenario:
- User-caused errors (validation, permissions)
- System errors (500, timeout, offline)
- Third-party errors (API failures)
- Error recovery path (how to fix)
- Error messaging tone (helpful, not blaming)
- **Backtracking Point**: If errors poorly handled, return to Step 4.2

## Phase 8: Technical Constraints

### Step 8.1: Platform Constraints
- Browser support requirements
- Mobile OS versions
- Device capabilities (camera, GPS)
- Network conditions (offline, slow)
- **Verification**: Constraints documented?

### Step 8.2: Performance Budget
- Page load time target (<2-3 seconds)
- Time to interactive (<5 seconds)
- Image size limits
- Animation performance (60fps)
- Bundle size constraints
- **Verification**: Performance targets clear?

### Step 8.3: Technical Feasibility
- Validate design is technically achievable
- Note complex interactions requiring engineering input
- Flag experimental features needing spike
- Document known limitations
- **Verification**: Design is buildable?

## Phase 9: Documentation Assembly

### Step 9.1: Create Design Brief
Compile comprehensive document with:
- Executive summary
- Screen inventory with priorities
- User flows (Mermaid diagrams)
- Component specifications
- Interaction patterns
- Edge cases and states
- Accessibility requirements
- Technical constraints
- **Verification**: Complete design brief?

### Step 9.2: Prepare Assets
Gather supporting materials:
- Wireframes (ASCII or images)
- User flow diagrams
- Existing design system documentation
- Brand guidelines links
- Content requirements doc
- Technical constraints doc
- **Verification**: All assets ready?

### Step 9.3: Add Questions and Notes
- Open questions for designer
- Areas needing design exploration
- Known constraints or limitations
- Timeline and milestone expectations
- Review and feedback process
- **Verification**: Designer has what they need?

## Phase 10: Handoff & Collaboration

### Step 10.1: Design Kickoff Meeting
Conduct handoff meeting to:
- Walk through design brief
- Explain user context and goals
- Highlight key interactions
- Discuss constraints and trade-offs
- Answer designer questions
- Align on timeline and milestones
- **Verification**: Designer understands requirements?

### Step 10.2: Collaboration Protocol
Establish:
- Check-in cadence (daily, weekly)
- Feedback channels (Figma comments, Slack)
- Review milestones (when to review)
- Approval process (who signs off)
- Iteration expectations (how many rounds)
- **Verification**: Clear collaboration process?

### Step 10.3: Monitor Progress
- Check in at milestones
- Provide feedback promptly
- Validate against requirements
- Flag blocking issues early
- Maintain design spec as source of truth
- **Backtracking Point**: If design diverges from requirements, realign

## Error Correction Mechanisms

### Automatic Detection
- **Missing states**: Alert if components lack state definitions
- **Incomplete flows**: Warn if user flows have dead ends
- **Accessibility gaps**: Flag missing accessibility specs
- **Undefined content**: Detect screens without content requirements

### Manual Review Checkpoints
- Phase 3 completion: Component completeness check
- Phase 7 completion: Edge case coverage review
- Phase 9 completion: Design brief quality check
- Phase 10 completion: Designer understanding validation

## Output Artifacts

1. **Design Brief** (`./prototypes/design-specs/[feature]-brief-[date].md`)
   - Complete specification document
   - Screen inventory and priorities
   - Component specifications
   - Interaction patterns

2. **User Flows** (`./prototypes/flows/[feature]-flows-[date].md`)
   - Mermaid diagrams for key journeys
   - Decision trees
   - State machines

3. **Wireframes** (`./prototypes/mockups/[feature]-wireframes-[date].md`)
   - ASCII layouts
   - Screen annotations
   - Component callouts

4. **Content Requirements** (`./specs/content/[feature]-content-[date].md`)
   - Copy requirements
   - Image specifications
   - Data requirements

5. **Accessibility Spec** (`./specs/accessibility/[feature]-a11y-[date].md`)
   - WCAG compliance checklist
   - Keyboard navigation spec
   - Screen reader requirements

## Integration Points

- **Receives input from PRD Framework**: Feature requirements
- **Receives input from User Research**: User needs and insights
- **Receives input from Rapid Prototyping**: Low-fi wireframes
- **Feeds into Design Team**: High-fidelity mockups
- **Feeds into Engineering**: Technical specifications
- **Feeds into Content Team**: Copy requirements

## Success Criteria

- Designer produces high-fi mockups on first attempt with minimal revision
- Design stays within technical constraints
- Accessibility requirements met without retrofitting
- User flows validated and complete
- Stakeholders aligned on design direction
- Handoff reduces back-and-forth between PM and designer
- Engineering can build from design without ambiguity

## Design Handoff Quality Levels

### Level 1: Minimal Handoff (Quick Turnaround)
**What to provide**:
- Screen list with wireframes
- Key user flows
- Basic component list

**Use when**: Minor features, existing patterns, designer knows product well

### Level 2: Standard Handoff (Most Common)
**What to provide**:
- Complete screen inventory
- User flows with edge cases
- Component specifications
- Interaction patterns
- Accessibility requirements

**Use when**: New features, some novel patterns, standard project

### Level 3: Comprehensive Handoff (Complex Projects)
**What to provide**:
- Everything in Level 2 PLUS:
- Detailed content requirements
- Visual direction and brand guidance
- User research synthesis
- Competitive analysis
- Technical constraints documentation
- Multiple user flows and scenarios

**Use when**: Major features, new product areas, external designers, high complexity

## Common Design Handoff Patterns

### Pattern 1: CRUD Application
**Screens**: List, Create, Edit, Detail, Delete Confirm
**Key Specs**: Form validation, error handling, success feedback
**Focus**: Data management flows

### Pattern 2: Onboarding Flow
**Screens**: Welcome, Steps 1-N, Completion
**Key Specs**: Progress indication, skip/back navigation, celebration
**Focus**: First-time user experience

### Pattern 3: Settings/Preferences
**Screens**: Settings list, Edit forms, Confirmations
**Key Specs**: Grouping logic, save patterns, dangerous actions
**Focus**: Configuration UX

### Pattern 4: Dashboard
**Screens**: Overview, Widget details
**Key Specs**: Data visualization, responsive layout, empty states
**Focus**: Information hierarchy

## Advanced Techniques

### Technique 1: Component-First Approach
Start with component specs, then compose screens
**Pros**: Reusability, consistency
**Cons**: May miss screen-specific needs

### Technique 2: Screen-First Approach
Design screens, then extract components
**Pros**: Holistic view, context-aware
**Cons**: Risk of inconsistency

### Technique 3: Hybrid Approach (Recommended)
- Start with key screens to understand needs
- Extract components from screens
- Spec components thoroughly
- Apply components to remaining screens

### Technique 4: Progressive Handoff
- Handoff highest priority screens first
- Designer starts while PM specs remaining screens
- Iterative collaboration
- Faster time to first mockups

## Quality Checklist

**Completeness**:
- [ ] All screens identified and prioritized
- [ ] All components specified with states
- [ ] All user flows documented
- [ ] All edge cases covered
- [ ] Content requirements specified
- [ ] Accessibility requirements defined

**Clarity**:
- [ ] Wireframes clear and unambiguous
- [ ] Interaction patterns well-defined
- [ ] Technical constraints documented
- [ ] Open questions clearly stated
- [ ] Examples provided where helpful

**Actionability**:
- [ ] Designer can create high-fi mockups
- [ ] No blocking unknowns
- [ ] Timeline realistic
- [ ] Feedback process defined
- [ ] Approval criteria clear

**Feasibility**:
- [ ] Technical constraints validated
- [ ] Performance budget realistic
- [ ] Accessibility achievable
- [ ] Platform conventions followed
- [ ] Engineering consulted on complexity

## Continuous Improvement

Improve design handoff process through:
- Tracking designer questions (indicates unclear specs)
- Measuring design revision cycles (goal: minimize)
- Gathering designer feedback on spec quality
- Building reusable component spec library
- Refining templates based on project type
- Learning from successful/failed handoffs

## Related Frameworks
- Design System Documentation Standards
- Atomic Design (Brad Frost)
- Jobs-to-be-Done Framework
- WCAG 2.1 Guidelines
- Nielsen's Usability Heuristics
