# Mermaid Diagram Syntax Reference

Complete syntax guide for all supported Mermaid diagram types.

---

## 1. Flowchart

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

**Node Shapes**:
- `[Text]` - Rectangle (standard process)
- `(Text)` - Rounded (start/end)
- `{Text}` - Diamond (decision)
- `[[Text]]` - Subroutine
- `[(Database)]` - Cylindrical (database)
- `((Text))` - Circle (connection point)

---

## 2. Sequence Diagram

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

## 3. State Diagram

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

## 4. User Journey

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

## 5. C4 Architecture Diagrams

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

## 6. Gantt Charts

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

## 7. Entity Relationship Diagrams

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
