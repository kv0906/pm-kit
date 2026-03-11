# JQL Cheatsheet for PMs

Quick reference for common Jira Query Language patterns. Used by `/jira search` to convert natural language to JQL.

## My Work

```jql
# My open issues
assignee = currentUser() AND status != Done

# My issues updated today
assignee = currentUser() AND updated >= startOfDay()

# Issues I reported
reporter = currentUser()

# Watching
watcher = currentUser()
```

## Sprint Queries

```jql
# Active sprint items
sprint in openSprints()

# Active sprint for a project
project = TEAM AND sprint in openSprints()

# Items not in any sprint (backlog)
sprint not in openSprints() AND sprint is EMPTY

# Completed in current sprint
sprint in openSprints() AND status = Done
```

## Status & Priority

```jql
# Blocked items
status = Blocked

# High priority open issues
priority in (Highest, High) AND status != Done

# Recently resolved
status changed to Done AFTER -7d

# Stale in-progress (no update in 5+ days)
status = "In Progress" AND updated <= -5d
```

## By Type

```jql
# All bugs
type = Bug AND status != Done

# Open stories
type = Story AND status != Done

# Epics
type = Epic

# Sub-tasks of an epic
"Epic Link" = TEAM-100
```

## Time-Based

```jql
# Created this week
created >= startOfWeek()

# Created in the last 30 days
created >= -30d

# Due this week
due >= startOfWeek() AND due <= endOfWeek()

# Overdue
due < now() AND status != Done

# Updated recently
updated >= -3d
```

## By Person

```jql
# Assigned to someone
assignee = "john.doe"

# Unassigned
assignee is EMPTY

# Assigned but not started
assignee is not EMPTY AND status = "To Do"
```

## By Label & Component

```jql
# By label
labels = "frontend"

# By component
component = "API"

# Multiple labels (AND)
labels = "frontend" AND labels = "urgent"

# Multiple labels (OR)
labels in ("frontend", "backend")
```

## Combining Filters

```jql
# My high-priority bugs in active sprint
assignee = currentUser() AND type = Bug AND priority in (Highest, High) AND sprint in openSprints()

# Team blockers this sprint
project = TEAM AND status = Blocked AND sprint in openSprints()

# Recently shipped for standup
project = TEAM AND status changed to Done AFTER -1d

# Cross-project search
project in (TEAM, PLATFORM) AND status != Done AND priority = Highest
```

## Useful ORDER BY Clauses

```jql
ORDER BY priority DESC, created DESC    # Highest priority first
ORDER BY updated DESC                    # Most recently updated
ORDER BY due ASC                         # Earliest due date first
ORDER BY rank ASC                        # Board rank order
```

## Natural Language → JQL Mapping

| User says | JQL |
|-----------|-----|
| "my open bugs" | `assignee = currentUser() AND type = Bug AND status != Done` |
| "what's blocked" | `status = Blocked AND project = {PROJECT}` |
| "high priority" | `priority in (Highest, High) AND status != Done` |
| "shipped this week" | `status changed to Done AFTER startOfWeek()` |
| "overdue items" | `due < now() AND status != Done` |
| "unassigned in sprint" | `assignee is EMPTY AND sprint in openSprints()` |
| "created yesterday" | `created >= -1d` |
| "john's tasks" | `assignee = "john" AND status != Done` |
