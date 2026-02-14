---
type: retro
status: active
date: {{date}}
sprint: {{sprint}}
tags: []
---

# Weekly Review: {{sprint}}

**Date**: {{date}}

---

## Wins

{{#each shipped}}
- {{this}}
{{/each}}

### Carried Over
{{#each carried}}
- {{this}}
{{/each}}

---

## Blockers

### Resolved
{{#each resolved_blockers}}
- [[{{this.path}}|{{this.title}}]]
{{/each}}

### Still Open
{{#each open_blockers}}
- [[{{this.path}}|{{this.title}}]] — {{this.severity}}
{{/each}}

---

## Decisions This Week

{{#each decisions}}
- [[{{this.path}}|{{this.title}}]] — {{this.date}}
{{/each}}

---

## Reflect

### What Went Well
{{#each wins_reflect}}
- {{this}}
{{/each}}

### What Slowed Progress
{{#each challenges}}
- {{this}}
{{/each}}

### Patterns Noticed
{{#each patterns}}
- {{this}}
{{/each}}

---

## Risks

{{#each risks}}
- {{this}}
{{/each}}

---

## Next Week Priorities

| Priority | Owner | Due |
|----------|-------|-----|
{{#each priorities}}
| {{this.task}} | {{this.owner}} | {{this.due}} |
{{/each}}

### Decisions Needed
{{#each decisions_needed}}
- [ ] {{this}}
{{/each}}

---

## Links

### Related
%% AI determines appropriate links based on context %%
