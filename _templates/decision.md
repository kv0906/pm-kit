---
type: decision
project: {{project}}
status: active
date: {{date}}
tags: []
---

# Decision: {{title}}

## Context

{{context}}

## Decision

{{decision}}

## Alternatives Considered

{{#each alternatives}}
- **{{this.name}}**: {{this.reason}}
{{/each}}

## Rationale

{{rationale}}

## Consequences

{{consequences}}

---

## Links

### Project
- [[01-index/{{project}}|{{project_name}}]]

### Related
%% AI determines appropriate links based on context %%
