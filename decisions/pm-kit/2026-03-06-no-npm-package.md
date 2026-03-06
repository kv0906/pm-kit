---
type: decision
project: pm-kit
status: active
date: 2026-03-06
tags: [cli, distribution, packaging]
---

# Decision: Do Not Publish CLI to npm

## Context

PM-Kit includes a CLI (`cli/`) for vault management — init, update, self-update, doctor, status, migrate. The CLI is 8 pure bash scripts (~30KB total) with zero Node.js code or npm dependencies. Required tools are `bash`, `git`, `curl`, `tar` — standard Unix.

Question arose whether publishing to npm would improve distribution.

## Decision

**Do not publish to npm.** Keep the current `curl | bash` installer as the primary distribution method.

```bash
curl -fsSL https://raw.githubusercontent.com/kv0906/pm-kit/main/cli/install.sh | bash
```

## Alternatives Considered

- **npm publish**: Rejected. Publishing bash scripts to npm is an anti-pattern. Adds Node.js as a dependency for PMs who may not have it. `npm install -g` has well-known macOS permission issues (EACCES). Would create conflicts with existing `pm-kit self-update` via GitHub Releases.
- **Homebrew tap**: Best future option if distribution becomes a growth bottleneck. Natural for macOS CLI tools (`brew install kv0906/tap/pm-kit`). Medium effort — needs a tap repo + formula.
- **GitHub CLI extension**: Low effort (`gh extension install kv0906/pm-kit`) but constrains naming.
- **AUR / Nix**: Linux package managers. Low-medium effort, community can contribute.

## Rationale

1. **No JavaScript to package** — npm adds zero value for bash scripts
2. **Adds unnecessary dependency** — users would need Node.js just to run shell scripts
3. **Self-update conflict** — CLI already uses GitHub Releases API for updates; npm versioning would fight this
4. **Current install follows established patterns** — same approach as rustup, nvm, bun, Homebrew, deno
5. **Target audience is macOS terminal users** — `curl` is already available everywhere they work

## Consequences

- Distribution stays simple: single `curl` command
- If users request broader distribution, add a **Homebrew tap** first (natural next step for macOS CLI tools)
- npm is permanently off the table for this CLI

---

## Links

### Related
- [[cli/install.sh|CLI Installer]]
- [[cli/bin/pm-kit|CLI Entry Point]]
- [[cli/lib/self-update.sh|Self-Update]]
