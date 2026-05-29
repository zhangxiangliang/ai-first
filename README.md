# AI Workspace Scaffold

An AI-first workspace scaffold for PRD-driven development, persistent project knowledge, and LLM-maintained wiki workflows.

This repository is a coordination layer. It helps teams and AI agents preserve project context, move from raw input to implementation, and keep reusable knowledge in a durable wiki.

## Why This Exists

Most AI-assisted development loses context between sessions. Requirements live in chat history, implementation decisions are scattered, and new agents have to rediscover project knowledge from scratch.

AI Workspace Scaffold gives that work a stable shape:

- `workspaces/` for active project, feature, or module work
- `wiki/` for persistent reusable knowledge
- `repos/` for implementation repositories, usually linked as git submodules
- `templates/` for workspace scaffolding and reusable document templates
- `scripts/` for the scaffold CLI

## Core Idea

Every substantial piece of work gets a workspace:

```text
workspaces/<workspace-name>/
```

The full reference lifecycle is:

```text
raw-input -> discovery -> context -> requirements -> tech-spec -> implementation -> worklog -> review
```

`worklog` is an optional running log; use it for long-running or multi-session work.

This is not a mandatory waterfall. Use the smallest path that preserves useful traceability.

Two invariants apply: **raw-input is almost always required** (it records why a change exists; only standalone `discovery` or `context` may omit it), and **tech-spec precedes implementation for anything beyond a simple change** (the cheap human review gate — only simple, low-risk changes go `raw-input -> implementation` directly).

Examples:

| Situation | Suggested Path |
|-----------|----------------|
| Simple, low-risk change | `raw-input -> implementation` |
| Bug ticket | `raw-input -> tech-spec -> implementation -> review` (simple bug may skip tech-spec) |
| Ambiguous product work | `raw-input -> discovery -> context -> requirements` |
| Clear feature | `raw-input -> requirements -> tech-spec -> implementation -> review` |
| Research only | `discovery` or `discovery -> context` |
| Durable knowledge update | `context -> wiki promotion` |

## Quick Start

### New Project Setup

When using this scaffold for a new project, point Git at your own repository before committing or pushing. A plain `git clone` keeps this scaffold repository as `origin`.

Option A: replace `origin` with your project repository:

```sh
git remote set-url origin <your-project-repo-url>
git remote -v
```

Option B: keep the scaffold as an upstream reference and add your project as `origin`:

```sh
git remote rename origin scaffold
git remote add origin <your-project-repo-url>
git remote -v
```

Then push the project branch to your own repository:

```sh
git push -u origin main
```

Do this before asking an AI agent to commit or push project-specific workspace changes.

### Create Workspace

Create a workspace:

```sh
./scripts/scaffold.sh create user-management
```

Optionally create the first topic documents at the same time:

```sh
./scripts/scaffold.sh create user-management create-user-table
```

This creates starter documents in `raw-input/`, `requirements/`, and `tech-spec/` using the same topic slug.

Create more phase documents later with:

```sh
./scripts/scaffold.sh create-doc user-management implementation create-user-table
```

Use meaningful kebab-case names. Keep the same topic slug across phase documents, for example `raw-input/create-user-table.md`, `requirements/create-user-table.md`, and `tech-spec/create-user-table.md`.

Update the generated workspace README, especially:

- `Goal`
- `Current Phase`
- `Phase Mode`
- `Handoff`
- `Next Step`

Review lifecycle state and surface aging documents:

```sh
./scripts/scaffold.sh status
./scripts/scaffold.sh stale 30
```

Run the scaffold health check:

```sh
./scripts/scaffold.sh lint
```

Generate the wiki ingest queue:

```sh
./scripts/scaffold.sh ingest
```

## Documentation

- [Onboarding guide](docs/ai-first-guide.md) — practical guide for people and AI agents working in this scaffold
- [LLM-WIKI.md](LLM-WIKI.md) — upstream pattern idea, attributed to the original gist by Andrej Karpathy
- [WIKI-SCHEMA.md](WIKI-SCHEMA.md) — local operating schema
- [AGENT-RULES.md](AGENT-RULES.md) — hard rules for AI agents
- [scripts/README.md](scripts/README.md) — script usage
- [workspaces/scaffold/](workspaces/scaffold/) — persistent workspace for maintaining this scaffold
- [wiki/index.md](wiki/index.md) — persistent knowledge index

## Repository Layout

```text
.
├── AGENTS.md
├── CLAUDE.md
├── LLM-WIKI.md
├── WIKI-SCHEMA.md
├── docs/
├── repos/
├── scripts/
├── templates/
├── wiki/
└── workspaces/
```

## Wiki Promotion

Workspace documents can propose stable knowledge for the wiki:

```md
## Wiki Promotion Candidates

- [ ] wiki/scaffold/example.md — Stable conclusion to promote
- [x] wiki/workflow/example.md — Already promoted
```

Then run:

```sh
./scripts/scaffold.sh ingest
```

Promote durable conclusions into `wiki/`, update `wiki/index.md`, append `wiki/log.md`, and check off the source item.

## Requirements and Tickets

Requirement and ticket IDs are scoped by workspace to avoid collisions:

```text
ADMIN-REQ-001
ADMIN-TICKET-001
CLAIMS-REQ-001
CLAIMS-TICKET-001
```

Do not use bare `REQ-001` or `TICKET-001` across multiple workspaces.

## For AI Agents

Before acting, read:

1. `LLM-WIKI.md`
2. `WIKI-SCHEMA.md`
3. `AGENT-RULES.md`
4. the active workspace `README.md`
5. relevant wiki pages from `wiki/index.md`

When finishing work, update the active workspace handoff, run `./scripts/scaffold.sh ingest`, run `./scripts/scaffold.sh lint`, and report remaining gaps.

## Project Status

This project is early but usable. The scaffold is intentionally lightweight and document-first. Expect the workflow to evolve through `workspaces/scaffold/`.

## License

MIT. See [LICENSE](LICENSE).
