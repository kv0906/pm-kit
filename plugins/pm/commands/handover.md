---
description: Generate vacation or transition handover documentation with open tasks and owners
allowed-tools: [Write]
argument-hint: <transition context or notes>
---

# Handover Command

Generate comprehensive handover documentation for vacations, role transitions, or project transfers. Ensures continuity and clear ownership during your absence.

**Context/Handover Period**: $ARGUMENTS

## Instructions

Use the **Handover Generator Agent** (`agents/handover-generator.md`) to complete this task.

The agent will guide you through:
1. **Scope Definition** - Clarify handover period and recipients
2. **Open Items Inventory** - Catalog active projects and pending decisions
3. **Stakeholder Mapping** - Document key contacts and escalation paths
4. **Risk Identification** - Surface items that could block during absence
5. **Documentation** - Create structured handover document

## Input Options

You can provide:
- Handover dates (e.g., "Dec 20 - Jan 3")
- Handover recipient(s)
- List of active projects/PRDs
- Known blockers or pending decisions
- Stakeholder concerns
- Nothing (agent will ask clarifying questions)

## Output

Save the handover document to: `./docs/handover-[name]-[date].md`

## Output Structure

Your handover document must include:

### 1. Handover Summary
- Your name/role
- Absence period
- Primary backup/coverage
- Emergency contact method

### 2. Active Projects Status
| Project | Status | Next Milestone | Owner During Absence |
|---------|--------|----------------|---------------------|
| Project name | In progress/Blocked/Waiting | What's next | Who covers |

### 3. Pending Decisions
- Decisions waiting for input
- Decisions you were planning to make
- Decision authority delegation

### 4. Key Stakeholders
| Stakeholder | Relationship | Current Topic | If They Reach Out |
|-------------|--------------|---------------|-------------------|
| Name | Role/context | What you're discussing | How backup should respond |

### 5. Escalation Paths
- When to escalate vs handle locally
- Who to escalate to for what
- What warrants contacting you

### 6. Risks and Mitigation
| Risk | Likelihood | Impact | Mitigation Plan |
|------|------------|--------|-----------------|
| What could go wrong | High/Med/Low | Impact description | What to do |

### 7. Context Dumps
- Background information backup needs
- Where to find key documents
- Gotchas and tribal knowledge

### 8. Return Checklist
- What you'll need to review on return
- Meetings to reschedule
- Decisions to ratify

---

## Next Steps

After creating the handover:

| Next Action | Command | When to Use |
|-------------|---------|-------------|
| Align with backup | `/consensus` | Ensure backup understands priorities |
| Document a project | `/prd` | Project needs more documentation |
| Create decision framework | `/decide` | Pending decision needs structure |
| Strategic context | `/strategy` | Backup needs strategic background |
| Review priorities | `/prioritize` | Help backup prioritize if needed |

---

Begin handover documentation now.
