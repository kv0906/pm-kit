# Architecture Documentation

Generate PM-friendly system architecture documentation.

Document architecture for: **$ARGUMENTS**

## Agent

Use the **Technical Translator Agent** (`@agents/technical-translator.md`) to execute this task.

Includes: System diagrams, component descriptions, constraints, PM implications

## Output

Save to: `./docs/architecture/[system-name]-architecture-[date].md`

## Next Steps

| Command | When to Use |
|---------|-------------|
| `/tech-impact` | Assess feature feasibility |
| `/explain-code` | Deep-dive into components |
| `/prd` | Document architectural changes |
| `/mermaid` | Create additional diagrams |
