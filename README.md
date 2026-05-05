# AI Workspace Scaffold

[中文说明](README.zh-CN.md)

An AI-first workspace scaffold for PRD-driven development, persistent project knowledge, and LLM-maintained wiki workflows.

This repository is a coordination layer. It helps teams and AI agents preserve project context, move from raw input to implementation, and keep reusable knowledge in a durable wiki.

## Why This Exists

Most AI-assisted development loses context between sessions. Requirements live in chat history, implementation decisions are scattered, and new agents have to rediscover project knowledge from scratch.

AI Workspace Scaffold gives that work a stable shape:

- `workspaces/` for active project, feature, or module work
- `wiki/` for persistent reusable knowledge
- `repos/` for implementation repositories, usually linked as git submodules
- `templates/` for repeatable workspace documents
- `scripts/` for creating workspaces, linting the scaffold, and maintaining wiki ingest queues

## Core Idea

Every substantial piece of work gets a workspace:

```text
workspaces/<workspace-name>/
```

The full reference lifecycle is:

```text
raw-input -> discovery -> context -> requirements -> tech-spec -> implementation -> review
```

This is not a mandatory waterfall. Use the smallest path that preserves useful traceability.

Examples:

| Situation | Suggested Path |
|-----------|----------------|
| Clear small change | `implementation` |
| Bug ticket | `raw-input -> implementation -> review` |
| Ambiguous product work | `raw-input -> discovery -> context -> requirements` |
| Clear feature | `requirements -> tech-spec -> implementation -> review` |
| Research only | `discovery` or `discovery -> context` |
| Durable knowledge update | `context -> wiki promotion` |

## Quick Start

Create a workspace:

```sh
./scripts/create-workspace.sh admin
```

Update the generated workspace README, especially:

- `Goal`
- `Current Phase`
- `Phase Mode`
- `Handoff`
- `Next Step`

Run the scaffold health check:

```sh
./scripts/lint-scaffold.sh
```

Generate the wiki ingest queue:

```sh
./scripts/update-ingest-queue.sh
```

## Documentation

- [Onboarding guide](docs/ai-first-guide.md) / [中文指南](docs/ai-first-guide.zh-CN.md) — practical guide for people and AI agents working in this scaffold
- [LLM-WIKI.md](LLM-WIKI.md) — upstream pattern idea, attributed to the original gist by Andrej Karpathy
- [WIKI-SCHEMA.md](WIKI-SCHEMA.md) — local operating schema
- [AGENT-RULES.md](AGENT-RULES.md) — hard rules for AI agents
- [scripts/README.md](scripts/README.md) — script usage
- [workspaces/scaffold-maintenance/](workspaces/scaffold-maintenance/) — persistent workspace for maintaining this scaffold
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
./scripts/update-ingest-queue.sh
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

When finishing work, update the active workspace handoff, run the ingest queue, run scaffold lint, and report remaining gaps.

## Project Status

This project is early but usable. The scaffold is intentionally lightweight and document-first. Expect the workflow to evolve through `workspaces/scaffold-maintenance/`.

## License

MIT. See [LICENSE](LICENSE).
