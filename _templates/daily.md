---
type: daily
status: active
date: {{date}}
tags: []
---

# {{date}}

{{#each projects}}
## {{this.name}}

### Shipped
{{#each this.shipped}}
- {{this}}
{{/each}}
{{#unless this.shipped}}
*None*
{{/unless}}

### In Progress
{{#each this.wip}}
- {{this}}
{{/each}}
{{#unless this.wip}}
*None*
{{/unless}}

### Blocked
{{#each this.blockers}}
- [[blockers/{{../id}}/{{this.path}}|{{this.title}}]] {{this.severity_icon}}
{{/each}}
{{#unless this.blockers}}
*None*
{{/unless}}

### Notes

{{this.notes}}

---

{{/each}}

## Tomorrow

{{tomorrow}}
