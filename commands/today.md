---
description: Generate daily work suggestions based on open items, priorities, and blockers
allowed-tools: [Write]
argument-hint: "[optional: context about current work]"
---

# Today Command

Get personalized daily work suggestions based on your current context, open items, and priorities. Helps you focus on the most impactful work for today.

**Context/Open Items**: $ARGUMENTS

## Instructions

Use the **Daily Planner Agent** (`agents/daily-planner.md`) to complete this task.

The agent will guide you through:
1. **Context Scan** - Understand current open PRDs, decisions, blockers
2. **Priority Assessment** - Rank items by urgency and importance
3. **Time Estimation** - Rough effort sizing for each item
4. **Suggestion Generation** - Top 3-5 actionable focus areas
5. **Quick Wins** - Identify low-effort, high-impact opportunities

## Input Options

You can provide:
- List of open tasks, PRDs, or projects
- Current blockers or dependencies
- Upcoming deadlines or meetings
- Recent context (what you worked on yesterday)
- Nothing (agent will ask clarifying questions)

## Output

Save daily plan to: `./docs/today-[date].md`

Also display the plan in the conversation for immediate reference.

## Output Structure

Your daily plan must include:

### 1. Today's Focus
- The #1 priority for the day
- Why this should be the focus
- Expected outcome

### 2. Top 3-5 Suggestions
| Priority | Task | Why Today | Effort | Type |
|----------|------|-----------|--------|------|
| 1 | Task description | Urgency reason | Time estimate | Category |

### 3. Quick Wins (< 30 min)
- Small tasks with disproportionate impact
- Items that unblock others
- Easy momentum builders

### 4. Blockers to Address
- Items blocking your progress
- Items where you're blocking others
- Escalations or decisions needed

### 5. Defer/Delegate
- What can wait until tomorrow
- What could be handed off
- What needs more context before action

### 6. Energy Mapping
- High-focus work → Morning suggestions
- Low-focus work → Afternoon suggestions
- Meeting-heavy day adjustments

---

## Next Steps

After reviewing your daily plan:

| Next Action | Command | When to Use |
|-------------|---------|-------------|
| Break down top task | `/decompose` | Task feels too big to start |
| Make a decision | `/decide` | Blocker requires decision |
| Prioritize backlog | `/prioritize` | Too many items competing |
| Document progress | `/retro` | End of day reflection |
| Prepare handover | `/handover` | Going on leave |

---

Begin daily planning now.
