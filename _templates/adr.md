---
type: adr
project: {{project}}
status: proposed
date: {{date}}
deciders: {{deciders}}
tags: []
---

# ADR: {{title}}

**Status**: {{status}}
**Date**: {{date}}
**Deciders**: {{deciders}}

---

## Context

{{context}}

## Decision Drivers

{{#each drivers}}
- {{this}}
{{/each}}

## Considered Options

{{#each options}}
### Option {{@index}}: {{this.name}}

{{this.description}}

**Pros:**
{{#each this.pros}}
- {{this}}
{{/each}}

**Cons:**
{{#each this.cons}}
- {{this}}
{{/each}}

{{/each}}

## Decision

{{decision}}

## Consequences

### Positive
{{#each positive_consequences}}
- {{this}}
{{/each}}

### Negative
{{#each negative_consequences}}
- {{this}}
{{/each}}

### Risks
{{#each risks}}
- {{this}}
{{/each}}

## Compliance

{{compliance_notes}}

---

## Links

### Project
- [[index/{{project}}|{{project_name}}]]

### Related Decisions
%% AI determines appropriate links based on context %%

### Related Docs
%% AI determines appropriate links based on context %%
