---
type: retro
status: active
date: {{date}}
sprint: {{sprint}}
tags: []
---

# Sprint Retro: {{sprint}}

**Date**: {{date}}
**Sprint**: {{sprint_name}}

---

## Collect

### Shipped This Sprint
{{#each shipped}}
- {{this}}
{{/each}}

### Carried Over
{{#each carried}}
- {{this}}
{{/each}}

### Blockers Resolved
{{#each resolved_blockers}}
- [[{{this.path}}|{{this.title}}]]
{{/each}}

### Blockers Still Open
{{#each open_blockers}}
- [[{{this.path}}|{{this.title}}]] — {{this.severity}}
{{/each}}

---

## Reflect

### What Went Well
{{#each wins}}
- {{this}}
{{/each}}

### What Didn't Go Well
{{#each challenges}}
- {{this}}
{{/each}}

### Patterns Noticed
{{#each patterns}}
- {{this}}
{{/each}}

---

## OKR Progress

| Objective | Key Result | Progress | Delta |
|-----------|-----------|----------|-------|
{{#each okr_progress}}
| {{this.objective}} | {{this.key_result}} | {{this.progress}}% | {{this.delta}} |
{{/each}}

---

## Plan

### ONE Big Thing Next Sprint
> {{one_big_thing}}

### Sprint Goals
{{#each sprint_goals}}
- [ ] {{this}}
{{/each}}

### Decisions Needed
{{#each decisions_needed}}
- [ ] {{this}}
{{/each}}

---

## Links

### Related
%% AI determines appropriate links based on context %%
