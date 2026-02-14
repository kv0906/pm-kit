---
type: meeting
project: {{project}}
status: active
date: {{date}}
meeting_type: {{meeting_type}}
attendees: {{attendees}}
tags: []
---

# {{meeting_type}}: {{title}}

**Date**: {{date}}
**Attendees**: {{attendees}}

## Agenda

{{agenda}}

## Notes

{{notes}}

## Decisions Made

{{#each decisions}}
- {{this}}
{{/each}}

## Action Items

| Owner | Action | Due |
|-------|--------|-----|
{{#each actions}}
| {{this.owner}} | {{this.action}} | {{this.due}} |
{{/each}}

## Blockers Raised

{{#each blockers}}
- {{this}}
{{/each}}

---

## Links

### Project
- [[index/{{project}}|{{project_name}}]]

### Related
%% AI determines appropriate links based on context %%
