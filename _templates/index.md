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

## Manual Notes

%% Add your own notes below — this section is preserved during updates %%
