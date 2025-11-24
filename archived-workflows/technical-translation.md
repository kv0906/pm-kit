# Technical Translation Workflow

## Long-CoT Technical Translation Framework

This workflow enables systematic translation of technical code, concepts, and engineering decisions into PM-friendly language, empowering non-technical PMs to understand and participate in technical discussions.

## Phase 1: Context Gathering

### Step 1.1: Identify Translation Target
- What needs to be translated? (code, concept, error, architecture decision)
- Why does PM need to understand this? (feature planning, bug triage, discussion prep)
- What decision depends on this understanding?
- What's the PM's technical background level?
- **Verification**: Translation scope clearly defined?

### Step 1.2: Gather Technical Artifacts
- Source code files (if translating code)
- Error messages or stack traces (if debugging)
- Architecture diagrams (if system-level)
- Technical specifications or RFCs
- **Verification**: All necessary technical information collected?

### Step 1.3: Identify Audience and Purpose
- **Audience**: Non-technical PM, Technical PM, Executive, Designer
- **Purpose**: Feature planning, Bug understanding, Meeting prep, Decision-making
- **Desired outcome**: What should PM be able to do after understanding?
- **Verification**: Translation level appropriate for audience?

## Phase 2: Technical Analysis

### Step 2.1: Code/Concept Comprehension
- Read and understand technical implementation
- Identify main functionality and purpose
- Map inputs, processing, and outputs
- Note side effects (database writes, API calls, state changes)
- **Verification**: Technical details accurately understood?

### Step 2.2: Identify Key Elements
- **Core functionality**: What's the primary purpose?
- **Critical logic**: Decision points, conditionals, loops
- **Error handling**: How failures are managed
- **Dependencies**: What this relies on
- **Performance characteristics**: Speed, resource usage
- **Verification**: All important technical elements identified?

### Step 2.3: Map to Product Context
- Which product feature does this enable?
- What user-facing behavior does it control?
- How does this fit in larger user journey?
- What happens to users if this fails?
- **Backtracking Point**: If product context unclear, gather more business requirements

## Phase 3: Translation Strategy Selection

### Step 3.1: Choose Translation Approach
Based on complexity and audience:
- **Simple explanation**: For straightforward concepts
- **Analogy-driven**: For abstract technical concepts
- **Visual diagram**: For complex flows or systems
- **Layered explanation**: For multi-level understanding needs
- **Verification**: Approach matches complexity and audience?

### Step 3.2: Select Appropriate Analogies
Choose analogies that:
- Match PM's domain knowledge (business, not technical)
- Accurately represent technical behavior
- Avoid oversimplification that misleads
- Are consistent with previous analogies used
- **Verification**: Analogies tested for accuracy and clarity?

### Step 3.3: Determine Detail Level
- **High-level summary**: For executive decisions
- **PM-level detail**: For feature planning and prioritization
- **Technical coordination**: For PM-engineering collaboration
- **Deep-dive**: For technical PMs or specialized topics
- **Verification**: Detail appropriate for decision being made?

## Phase 4: Plain-English Translation

### Step 4.1: Write Quick Summary
Create 2-3 sentence summary:
- What does this do? (no jargon)
- Why does it exist? (product purpose)
- When does it run? (trigger or invocation)
- **Verification**: Non-technical person can understand summary?

### Step 4.2: Explain Step-by-Step
Break down into sequential steps:
- Use numbered list for clarity
- Explain conditionals as "If... then..."
- Describe loops as "For each... it does..."
- Translate technical terms to plain English
- **Verification**: Logic flow clear without technical knowledge?

### Step 4.3: Define All Technical Terms
For unavoidable technical terms:
- Provide jargon-free definition
- Include real-world analogy
- Give product context example
- Link to glossary for reference
- **Verification**: Every technical term explained?

## Phase 5: Visual Representation

### Step 5.1: Create Diagrams
Generate Mermaid diagrams as needed:
- **Flowcharts**: For sequential logic and decision trees
- **Sequence diagrams**: For interactions between components
- **State diagrams**: For state machines and workflows
- **Architecture diagrams**: For system relationships
- **Verification**: Diagrams accurate and clearly labeled?

### Step 5.2: Annotate Visual Elements
Add PM-friendly annotations:
- Component purposes in plain English
- Data flow descriptions
- Decision point explanations
- Error path highlights
- **Verification**: Annotations make diagram self-explanatory?

### Step 5.3: Connect Visual to Product
Overlay product context on technical diagrams:
- "This component handles user login"
- "This database stores customer orders"
- "This API call charges credit cards"
- **Verification**: Product implications visible in diagram?

## Phase 6: Impact and Implications

### Step 6.1: User Impact Analysis
Explain how this affects users:
- What user experience does this enable?
- What happens if this fails?
- Performance impact on user (fast/slow?)
- Reliability impact (stable/flaky?)
- **Verification**: PM understands user-facing implications?

### Step 6.2: PM Decision Implications
Translate to PM decision-making:
- **Feature feasibility**: How easy is this to change?
- **Risk assessment**: What could go wrong?
- **Cost implications**: Infrastructure or operational costs
- **Timeline impact**: Development time considerations
- **Verification**: PM can make informed decisions with this information?

### Step 6.3: Engineering Collaboration Prep
Prepare PM for engineering discussions:
- Generate smart questions to ask engineering
- Identify trade-offs to discuss
- Surface assumptions to validate
- Note alternatives to explore
- **Verification**: PM can engage meaningfully with engineering?

## Phase 7: Validation and Refinement

### Step 7.1: Technical Accuracy Check
Verify translation accuracy:
- Does explanation match actual behavior?
- Are analogies technically sound?
- Are constraints accurately represented?
- No oversimplification that misleads?
- **Backtracking Point**: If inaccurate, return to Phase 2 for deeper analysis

### Step 7.2: Comprehension Testing
Test PM understanding:
- Can PM explain to non-technical stakeholder?
- Can PM assess basic feasibility?
- Can PM identify change implications?
- Can PM ask informed technical questions?
- **Verification**: PM demonstrates understanding?

### Step 7.3: Refinement Based on Feedback
Improve explanation based on questions:
- Add clarifying examples
- Expand unclear analogies
- Provide additional context
- Create supplementary diagrams
- **Verification**: All PM questions answered?

## Error Correction Mechanisms

### Automatic Detection
- **Undefined jargon**: Flag technical terms without definitions
- **Missing product context**: Warn if no user impact explained
- **Complex sentences**: Detect overly technical language
- **Inconsistent analogies**: Alert if analogies conflict

### Manual Review Checkpoints
- Phase 4 completion: Clarity review (can non-PM understand?)
- Phase 6 completion: Completeness review (all implications covered?)
- Phase 7 completion: Accuracy review (engineering validation)
- Post-translation: Effectiveness review (did PM make good decisions?)

## Output Artifacts

1. **Translation Document** (`./docs/translations/[topic]-translation-[date].md`)
   - Quick summary
   - Step-by-step explanation
   - Visual diagrams
   - PM implications
   - Questions for engineering

2. **Updated PM Glossary** (`./docs/architecture/glossary.md`)
   - New technical terms encountered
   - Analogies that worked well
   - Product context examples

3. **Smart Questions List** (embedded in translation)
   - Questions to validate understanding
   - Questions to explore alternatives
   - Questions to assess trade-offs

## Integration Points

- **Supports Architecture Documentation**: Detailed component explanations
- **Enables Tech Impact Assessment**: Understanding current implementation
- **Facilitates Bug Triage**: Translating errors to user impact
- **Prepares for Technical Meetings**: Background for informed discussions
- **Informs PRD Writing**: Technical feasibility and constraints

## Success Criteria

- PM can explain technical concept to non-technical stakeholders
- PM understands product implications and constraints
- PM can assess basic feasibility of related features
- PM asks informed technical questions in discussions
- PM makes better product decisions based on technical understanding
- Engineering confirms translation accuracy
- No misleading oversimplifications

## Translation Quality Levels

### Level 1: Basic Awareness
**Goal**: PM knows concept exists and its general purpose
**Depth**: High-level overview only
**Use case**: Executive briefings, quick context

### Level 2: Functional Understanding
**Goal**: PM understands what it does and why
**Depth**: Moderate detail with analogies
**Use case**: Feature planning, stakeholder communication

### Level 3: Decision-Making Understanding
**Goal**: PM can assess implications and trade-offs
**Depth**: Detailed with constraints and alternatives
**Use case**: Technical trade-off decisions, prioritization

### Level 4: Collaboration-Ready Understanding
**Goal**: PM can engage deeply with engineering
**Depth**: Technical details with business context
**Use case**: Architecture discussions, complex feature planning

## Common Translation Patterns

### Translating Algorithms
**Technical**: Sorting algorithm, search algorithm
**PM Translation**:
1. Problem it solves (find item in list)
2. Approach used (check each item until found)
3. Performance implications (fast for small lists, slow for large)
**Example**: "Linear search is like looking through a phone book page by page. Quick for short books, but there are faster ways for thick books."

### Translating Data Structures
**Technical**: Hash table, binary tree, queue
**PM Translation**:
1. What it stores (key-value pairs)
2. Why this structure (fast lookups)
3. Trade-offs (uses more memory)
**Example**: "Hash table is like a filing cabinet with tabs—jump directly to what you need instead of searching sequentially."

### Translating Protocols
**Technical**: HTTP, WebSocket, gRPC
**PM Translation**:
1. Communication pattern (request-response, continuous connection)
2. Use cases (web pages, real-time chat)
3. Limitations (one-way, connection overhead)
**Example**: "HTTP is like postal mail (send, wait for response). WebSocket is like a phone call (open line, continuous conversation)."

### Translating Errors
**Technical**: NullPointerException, 404 Not Found, Connection Timeout
**PM Translation**:
1. What happened (tried to use something that doesn't exist)
2. User impact (feature broken, page doesn't load)
3. Urgency (how many users affected)
**Example**: "500 Internal Server Error means our server crashed while processing request. Users see error page and can't complete action."

## Advanced Translation Techniques

### Layered Explanation
Provide multiple levels of detail:
```markdown
**Level 1 (Everyone)**: This code validates user emails
**Level 2 (PMs)**: It checks format, blocks disposable emails, and verifies domain exists
**Level 3 (Technical PMs)**: Uses regex for format, maintains blocklist database, performs DNS lookup for MX records
**Level 4 (Technical Deep-Dive)**: [Link to code with detailed implementation notes]
```

### Analogies with Caveats
Use analogies but note limitations:
```markdown
**Analogy**: Cache is like a refrigerator (fast access to frequently used items)
**Caveat**: Unlike a refrigerator, cache automatically removes old items when full
**Implication**: Users might see fresh data (from database) or cached data (from memory)
```

### Decision Tree Translation
For complex conditional logic:
```markdown
What the code does:
1. If user logged in → Show personalized content
   → Otherwise → Show generic homepage
2. If premium subscriber → Show all features
   → Otherwise → Show free features only
3. If session expired → Force re-login
   → Otherwise → Continue normally
```

### Trade-off Exposition
Always explain engineering trade-offs:
```markdown
**Choice Made**: Use WebSocket for real-time updates
**Pro**: Instant updates, great user experience
**Con**: Higher server costs ($3K/month), uses more battery on mobile
**Alternative**: Polling (check for updates every 30 seconds) - cheaper but less instant
**Why We Chose This**: Real-time is core value prop, cost justified by premium pricing
```

## Quality Checklist

**Clarity**:
- [ ] No undefined technical jargon
- [ ] Analogies used for complex concepts
- [ ] Step-by-step logic flow explained
- [ ] Visual diagrams where helpful

**Completeness**:
- [ ] Product context provided
- [ ] User impact explained
- [ ] PM implications surfaced
- [ ] Questions for engineering generated

**Accuracy**:
- [ ] Technical details correct
- [ ] No misleading oversimplifications
- [ ] Constraints accurately represented
- [ ] Engineering validated translation

**Actionability**:
- [ ] PM can make informed decisions
- [ ] PM can explain to stakeholders
- [ ] PM can assess feasibility
- [ ] PM can engage with engineering

## Continuous Improvement

Improve translations based on:
- PM questions that arise (indicates unclear explanation)
- Decisions made (were they well-informed?)
- Engineering feedback (was translation accurate?)
- Stakeholder understanding (could PM explain effectively?)
- Pattern recognition (which analogies work best?)

## Related Frameworks
- Plain Language Movement
- Technical Writing Best Practices
- System Thinking (Donella Meadows)
- Mental Models (Shane Parrish)
