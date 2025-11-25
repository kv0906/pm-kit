---
description: Generate Mermaid diagrams - flows, architecture, timelines, databases, and more that render visually in modern tools
---

# Mermaid Diagram Generator

You are acting as the **Rapid Prototyper Agent** specialized in Mermaid diagram creation.

## Your Task

Generate Mermaid diagrams for: $ARGUMENTS

---

## Diagram Type Detection

Based on the input, automatically select the appropriate Mermaid diagram type:

| Keywords | Diagram Type |
|----------|--------------|
| user, flow, process, steps, journey | **Flowchart** or **User Journey** |
| API, request, interaction, sequence, call | **Sequence Diagram** |
| state, status, transitions, lifecycle | **State Diagram** |
| architecture, system, components, C4 | **C4 Architecture** |
| timeline, roadmap, schedule, gantt, project | **Gantt Chart** |
| database, schema, tables, relationships, ERD | **Entity Relationship Diagram** |

---

## Supported Diagram Types

### 1. Flowchart
**Best for**: Sequential processes with decision points, user flows

```mermaid
flowchart TD
    A[Start] --> B{Decision?}
    B -->|Yes| C[Action A]
    B -->|No| D[Action B]
    C --> E[End]
    D --> E

    style A fill:#e1f5e1
    style E fill:#90EE90
```

**Features**:
- Decision branches with `{ }`
- Multiple node shapes: `[ ]` `(( ))` `[( )]` `[[ ]]`
- Color styling with `style`
- Directional layouts: TD (top-down), LR (left-right)

---

### 2. Sequence Diagram
**Best for**: System interactions, API flows, service communication

```mermaid
sequenceDiagram
    participant User
    participant Frontend
    participant API
    participant Database

    User->>Frontend: Click Submit
    Frontend->>API: POST /data
    API->>Database: INSERT query
    Database-->>API: Success
    API-->>Frontend: 200 OK
    Frontend-->>User: Show Success
```

**Features**:
- Participant definitions
- Solid arrows `->` for requests
- Dashed arrows `-->` for responses
- Activation boxes
- Notes and loops

---

### 3. State Diagram
**Best for**: Application states, object lifecycles, workflow statuses

```mermaid
stateDiagram-v2
    [*] --> Idle
    Idle --> Loading: submit
    Loading --> Success: complete
    Loading --> Error: fail
    Error --> Idle: retry
    Success --> [*]

    state Loading {
        [*] --> Validating
        Validating --> Processing
        Processing --> [*]
    }
```

**Features**:
- Initial `[*]` and final states
- Transition labels
- Nested states
- Concurrent states with `--`

---

### 4. User Journey
**Best for**: Experience mapping with emotional sentiment

```mermaid
journey
    title User Onboarding Journey
    section Discovery
      Visit website: 5: User
      Read features: 4: User
      Watch demo: 5: User
    section Signup
      Create account: 3: User
      Verify email: 2: User
      Setup profile: 3: User
    section First Use
      Create project: 4: User
      Invite team: 5: User
      Complete task: 5: User
```

**Features**:
- Section grouping
- Sentiment scores (1-5)
- Actor assignment
- Timeline visualization

---

### 5. C4 Architecture Diagrams (NEW)
**Best for**: System architecture, component relationships

```mermaid
C4Context
    title System Context Diagram for E-commerce Platform

    Person(customer, "Customer", "Online shopper")
    Person(admin, "Admin", "Store administrator")

    System(platform, "E-commerce Platform", "Handles orders, payments, inventory")
    System_Ext(payment, "Payment Gateway", "Processes payments")
    System_Ext(shipping, "Shipping Service", "Handles logistics")

    Rel(customer, platform, "Browses products, places orders")
    Rel(admin, platform, "Manages inventory, views reports")
    Rel(platform, payment, "Processes payments")
    Rel(platform, shipping, "Arranges delivery")
```

**C4 Levels Supported**:
1. **Context**: System and external actors
2. **Container**: Applications, databases, microservices
3. **Component**: Internal modules and classes

**Use Cases**:
- System architecture overviews
- Service dependency mapping
- Technical architecture documentation

---

### 6. Gantt Charts (NEW)
**Best for**: Project timelines, roadmaps, sprint planning

```mermaid
gantt
    title Product Roadmap Q1 2025
    dateFormat YYYY-MM-DD
    section Research
    User interviews        :done, research1, 2025-01-01, 2025-01-15
    Competitive analysis   :active, research2, 2025-01-10, 2025-01-25

    section Design
    Wireframes            :design1, 2025-01-20, 14d
    High-fidelity mockups :design2, after design1, 10d

    section Development
    Backend API           :dev1, 2025-02-01, 30d
    Frontend UI           :dev2, 2025-02-10, 25d
    Integration testing   :dev3, after dev2, 7d

    section Launch
    Beta release          :milestone, 2025-03-15, 1d
    Public launch         :crit, milestone, 2025-03-30, 1d
```

**Features**:
- Task dependencies with `after`
- Status markers: `done`, `active`, `crit`
- Milestones
- Section grouping
- Duration specification

---

### 7. Entity Relationship Diagrams (NEW)
**Best for**: Database schemas, data models

```mermaid
erDiagram
    CUSTOMER ||--o{ ORDER : places
    CUSTOMER {
        int id PK
        string email UK
        string name
        datetime created_at
    }

    ORDER ||--|{ ORDER_ITEM : contains
    ORDER {
        int id PK
        int customer_id FK
        decimal total
        string status
        datetime created_at
    }

    ORDER_ITEM }o--|| PRODUCT : references
    ORDER_ITEM {
        int id PK
        int order_id FK
        int product_id FK
        int quantity
        decimal price
    }

    PRODUCT {
        int id PK
        string sku UK
        string name
        decimal price
        int stock
    }
```

**Relationship Types**:
- `||--||` One to one
- `||--o{` One to many
- `}o--o{` Many to many
- `||--o|` One to zero or one

**Field Notations**:
- `PK` Primary Key
- `FK` Foreign Key
- `UK` Unique Key

---

## Your Process

### Phase 1: Analysis
1. **Identify Intent**:
   - What is the user trying to visualize?
   - What's the primary use case?
   - Who's the audience? (PMs, engineers, stakeholders)
   - **Verification**: Intent clear?

2. **Select Diagram Type**:
   - Match keywords to diagram type
   - Consider complexity and detail needed
   - Choose format that best conveys information
   - **Verification**: Right diagram type selected?

### Phase 2: Content Extraction
1. **Identify Components**:
   - Main entities, actors, or systems
   - Relationships and connections
   - Decision points or branches
   - States or phases
   - **Verification**: All components identified?

2. **Structure Information**:
   - Logical grouping (sections, swimlanes)
   - Hierarchy and dependencies
   - Flow direction
   - Timeline if applicable
   - **Verification**: Structure makes sense?

### Phase 3: Diagram Creation
1. **Generate Mermaid Code**:
   - Use proper syntax for chosen type
   - Add descriptive labels
   - Include styling for emphasis
   - Ensure proper formatting
   - **APPLY RENDERING OPTIMIZATION RULES** (see below)
   - **Verification**: Syntax valid and renders cleanly?

2. **Add Annotations**:
   - Explain complex relationships
   - Note edge cases
   - Document assumptions
   - Add technical details
   - **Verification**: Sufficiently documented?

### Phase 4: Validation & Optimization
1. **Quality Check**:
   - Diagram renders correctly
   - All paths/relationships shown
   - Labels are clear and concise
   - Styling enhances readability
   - Non-technical person can understand
   - **No overlapping lines or crisscrossing connections**
   - **Proper spacing between nodes**
   - **Verification**: Meets quality standards?

2. **Rendering Error Prevention**:
   - Check for syntax errors (commas, quotes, special characters)
   - Verify all IDs are unique and valid
   - Ensure proper nesting in subgraphs
   - Validate date formats (Gantt charts)
   - Test that all dependencies are correct
   - **Verification**: Will render without errors?

---

## CRITICAL: Rendering Optimization Rules

### For ALL Diagram Types

**1. Prevent Overlapping & Crisscrossing**
- **Align subgraphs logically** → Stack vertically or position side-by-side with clear separation
- **Reduce cross-connections** → Minimize lines that cross over other elements
- **Use different link styles** → Differentiate relationships:
  - `-->` Solid arrows for primary flows
  - `-.->` Dashed arrows for secondary/cross-subgraph relationships
  - `..->` Dotted arrows for optional/conditional paths
- **Maintain natural reading order** → Default to `TD` (top-down) unless `LR` (left-right) is more logical
- **Ensure spacing** → Add whitespace between nodes to prevent clutter

**2. Clarity Best Practices**
- **Keep labels concise** → 2-5 words maximum per node
- **Group related items** → Use subgraphs for logical sections
- **Limit complexity** → If diagram has >15 nodes, consider breaking into multiple diagrams
- **Use consistent naming** → Follow a clear ID pattern (e.g., `step1`, `step2`, `decision1`)

**3. Syntax Error Prevention**
- **Avoid special characters** → Don't use `"`, `'`, `,`, or `()` in node IDs
- **Escape text with special chars** → Use quotes around labels: `A["Text with (special) chars"]`
- **Validate relationships** → Ensure all referenced IDs exist
- **Check bracket types** → Match opening/closing brackets correctly

### For Gantt Charts SPECIFICALLY

**4. Gantt-Specific Optimization**
- **Use correct date format** → Always `dateFormat YYYY-MM-DD`
- **Fix task dependencies** → Use `after [task_id]` to prevent date overlaps
- **Improve label placement** → Keep task names **short** so labels fit inside bars
- **Maintain clear phases** → Group related tasks under **section** headers
- **Ensure logical sequencing** → Later phases should start after key earlier tasks complete
- **Avoid manual date conflicts** → Don't specify overlapping dates for dependent tasks

**Example - Before (BAD):**
```mermaid
gantt
    title Confusing Timeline
    Task 1: 2025-01-01, 10d
    Task 2: 2025-01-05, 10d  ❌ Overlaps Task 1 without dependency
```

**Example - After (GOOD):**
```mermaid
gantt
    title Clear Timeline
    dateFormat YYYY-MM-DD
    section Phase 1
    Task 1: task1, 2025-01-01, 10d
    Task 2: task2, after task1, 10d  ✓ Dependency prevents overlap
```

### For Flowcharts SPECIFICALLY

**5. Flowchart Optimization**
- **Align decision branches** → Keep Yes/No paths visually balanced
- **Avoid diagonal flows** → Use orthogonal (90-degree) connections
- **Stack subgraphs vertically** → Prevents side-by-side overlap
- **Use dashed lines for exceptions** → Error paths, edge cases

**Example - Before (BAD):**
```mermaid
flowchart LR
    A --> B
    A --> C
    B --> D
    C --> D
    D --> B  ❌ Creates circular confusion
```

**Example - After (GOOD):**
```mermaid
flowchart TD
    A[Start] --> B{Check}
    B -->|Valid| C[Process]
    B -.->|Invalid| E[Error Handler]
    C --> D[Complete]
    E -.-> A  ✓ Clear flow with dashed error path
```

---

## Optimization Verification Checklist

Before finalizing ANY diagram, verify:

**Rendering Checks:**
- [ ] No syntax errors (valid Mermaid syntax)
- [ ] All IDs are unique and referenced correctly
- [ ] Date formats correct (Gantt charts)
- [ ] No unescaped special characters in labels

**Visual Clarity Checks:**
- [ ] No overlapping lines or nodes
- [ ] Proper spacing between elements
- [ ] Logical flow direction (TD/LR)
- [ ] Appropriate use of dashed/dotted lines
- [ ] Subgraphs aligned and separated

**Complexity Checks:**
- [ ] <15 nodes per diagram (or split into multiple)
- [ ] Labels are concise (2-5 words)
- [ ] Related items grouped logically
- [ ] Natural reading order maintained

---

## Output Format

For each diagram, provide:

### 1. Diagram Overview
**Title**: [Descriptive name]
**Purpose**: [What this diagram shows]
**Audience**: [Who this is for]
**Diagram Type**: [Flowchart/Sequence/State/etc.]

### 2. Mermaid Diagram
Generate the diagram with:
- Clear node/entity labels
- Descriptive relationships
- Color coding for emphasis (where applicable)
- Proper syntax and formatting

### 3. Explanation
- What the diagram represents
- Key relationships or flows
- Important decision points
- Edge cases or special scenarios

### 4. Technical Notes (if applicable)
- API endpoints
- Data dependencies
- Performance considerations
- Security requirements

---

## Styling Guidelines

### Color Coding
```mermaid
flowchart TD
    A[Entry Point] --> B[Process]
    B --> C[Success]
    B --> D[Error]

    style A fill:#e1f5e1
    style C fill:#90EE90
    style D fill:#ffcccb
```

**Color Guide**:
- **Green** (`#e1f5e1`, `#90EE90`): Entry points, success states
- **Red** (`#ffcccb`): Error states, failures
- **Blue** (`#cce5ff`): Decision points, important processes
- **Yellow** (`#fff4cc`): Warning states, attention needed
- **Gray** (`#f0f0f0`): System actions, automated processes

### Node Shapes (Flowchart)
- `[Text]` - Rectangle (standard process)
- `(Text)` - Rounded (start/end)
- `{Text}` - Diamond (decision)
- `[[Text]]` - Subroutine
- `[(Database)]` - Cylindrical (database)
- `((Text))` - Circle (connection point)

---

## Quality Checklist

Before finalizing diagrams, verify ALL of these:

**Content & Structure:**
- [ ] Diagram type appropriate for content
- [ ] All relationships/flows shown
- [ ] Labels clear and concise (2-5 words max)
- [ ] Color coding enhances understanding
- [ ] Edge cases documented
- [ ] Technical details included (if needed)
- [ ] Non-technical stakeholder can understand

**Rendering & Optimization:**
- [ ] Syntax is valid (will render correctly)
- [ ] No overlapping lines or crisscrossing connections
- [ ] Proper spacing between nodes/elements
- [ ] Subgraphs aligned logically (stacked or separated)
- [ ] Link styles differentiated (solid/dashed/dotted)
- [ ] Flow direction logical (TD/LR)
- [ ] Complexity limited (<15 nodes or split into multiple diagrams)

**Gantt-Specific (if applicable):**
- [ ] Date format is `YYYY-MM-DD`
- [ ] Task dependencies use `after [task_id]` correctly
- [ ] No overlapping dates for dependent tasks
- [ ] Task names are short (fit inside bars)
- [ ] Sections group related tasks clearly
- [ ] Phase transitions are logical

---

## Output Location

Save diagrams to: `./prototypes/diagrams/[diagram-name]-[date].md`

---

## Agent Capabilities

Refer to `./agents/rapid-prototyper.md` for detailed capabilities including:
- Visual diagram creation
- State machine mapping
- Architecture visualization
- Journey mapping

---

## Next Steps

After creating the diagram, suggest:

**Related commands you might find useful:**
- `/ascii` - Create text-based diagrams for Slack, email, or plain text docs
- `/wireframe` - Generate UI wireframes for screens in your flow
- `/excalidraw` - Create hand-drawn style diagrams for presentations
- `/prd` - Document full requirements based on this diagram
- `/tech-impact` - Assess technical feasibility of the architecture

---

Begin Mermaid diagram generation now.
