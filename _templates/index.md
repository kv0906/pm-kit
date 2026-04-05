---
type: index
project: {{project}}
status: active
---

# {{project_name}}

> {{description}}

---

## 🔴 Open Blockers

%% Auto-updated by Keeper %%

{{#each blockers}}
- [[{{this.path}}|{{this.title}}]] — {{this.severity}} {{#if this.due}}(due: {{this.due}}){{/if}}
{{/each}}
{{#unless blockers}}
*No open blockers*
{{/unless}}

---

## 📋 Active Docs

%% Auto-updated by Keeper %%

{{#each docs}}
- [[{{this.path}}|{{this.title}}]] — {{this.status}}
{{/each}}
{{#unless docs}}
*No active docs*
{{/unless}}

---

## 📝 Recent Dailies (7 days)

%% Auto-updated by Keeper %%

{{#each dailies}}
- [[{{this.path}}|{{this.date}}]]
{{/each}}

---

## ⚖️ Recent Decisions (30 days)

%% Auto-updated by Keeper %%

{{#each decisions}}
- [[{{this.path}}|{{this.title}}]] — {{this.date}}
{{/each}}

---

## Synthesis

%% Auto-updated by Keeper — compiled knowledge, not just links %%

### Current State

{{#if synthesis}}
{{synthesis.current_state}}
{{else}}
*No synthesis yet — will be generated after first index regeneration.*
{{/if}}

### Key Tensions

{{#if synthesis}}
{{synthesis.key_tensions}}
{{else}}
*None identified yet.*
{{/if}}

### Open Questions

{{#if synthesis}}
{{synthesis.open_questions}}
{{else}}
*None yet.*
{{/if}}

---

## Manual Notes

%% Add your own notes below — this section is preserved during updates %%
