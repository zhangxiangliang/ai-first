# AI Workspace Scaffold Guide

[中文指南](ai-first-guide.zh-CN.md)

This guide explains how to work inside AI Workspace Scaffold.

The goal is not to force a heavy process. The goal is to keep enough structure that a human or AI agent can recover context, understand the current state, and continue work without rediscovering everything from scratch.

## Mental Model

This repository is a coordination layer.

| Layer | Purpose |
|-------|---------|
| `workspaces/` | Active project, module, or feature work |
| `wiki/` | Stable reusable knowledge |
| `repos/` | Implementation repositories, usually linked as git submodules |
| `templates/` | Reusable workspace document templates |
| `scripts/` | Utilities for creating workspaces, linting, and wiki ingest queues |

## Start Here

When entering the project, read:

1. `LLM-WIKI.md`
2. `WIKI-SCHEMA.md`
3. `AGENT-RULES.md`
4. the active workspace `README.md`
5. relevant pages from `wiki/index.md`

Do not read every file by default. Start from the active workspace and follow links.

## Create a Workspace

Create a new workspace:

```sh
./scripts/create-workspace.sh admin
```

This creates:

```text
workspaces/admin/
├── README.md
├── raw-input/
├── discovery/
├── context/
├── requirements/
├── tech-spec/
├── implementation/
└── review/
```

After creation, update the workspace `README.md`, especially:

- `Goal`
- `Current Phase`
- `Phase Mode`
- `Handoff`
- `Next Step`

## Choose the Smallest Useful Workflow

The full reference lifecycle is:

```text
raw-input -> discovery -> context -> requirements -> tech-spec -> implementation -> review
```

This is not mandatory. Choose the smallest path that preserves useful traceability.

| Situation | Suggested Path |
|-----------|----------------|
| Clear small implementation | `implementation` |
| Bug or support ticket | `raw-input -> implementation -> review` |
| Bug with unclear expected behavior | `raw-input -> discovery -> requirements -> implementation -> review` |
| Clear product feature | `requirements -> tech-spec -> implementation -> review` |
| Ambiguous product work | `raw-input -> discovery -> context -> requirements` |
| Architecture or cross-module change | `context -> tech-spec -> implementation -> review -> wiki promotion` |
| Research only | `discovery` or `discovery -> context` |
| Documentation or knowledge update | `context -> wiki promotion` |

If a workflow would be too heavy, record a `Phase Shortcut` or `Phase Scope` instead of forcing the full lifecycle.

## Workspace Phases

| Phase | Purpose |
|-------|---------|
| `raw-input/` | Original source material, unchanged |
| `discovery/` | Research, ambiguity, open questions, risks |
| `context/` | Product and technical background |
| `requirements/` | PRD-style requirements, tickets, acceptance criteria |
| `tech-spec/` | Technical approach, task breakdown, tests, rollback |
| `implementation/` | Execution notes, changed files, verification evidence |
| `review/` | Acceptance results, issues, final decision |

Each phase can stand alone when that is the right fit.

## Handoff

Every workspace README should include a short handoff section.

```md
## Handoff

### Current State

[Where the work currently stands.]

### Confirmed

- [Confirmed fact or decision]

### Unknown

- [Missing information or unresolved question]

### Next Best Action

[The next action a human or AI should take.]

### Read First

- [Most important file to read first]
```

The handoff is the fastest recovery point for a human or AI agent entering the workspace.

## Requirement and Ticket IDs

Requirement and ticket IDs are scoped by workspace to avoid collisions.

Use:

```text
<WORKSPACE-PREFIX>-REQ-001
<WORKSPACE-PREFIX>-TICKET-001
```

Examples:

```text
ADMIN-REQ-001
ADMIN-TICKET-001
CLAIMS-REQ-001
CLAIMS-TICKET-001
```

Do not use bare `REQ-001` or `TICKET-001` across multiple workspaces.

## Wiki Promotion

The wiki stores stable reusable knowledge.

Use workspace documents for active project state. Promote knowledge to the wiki only when it is stable and reusable.

Workspace documents can include:

```md
## Wiki Promotion Candidates

- [ ] wiki/scaffold/example.md — Stable conclusion to promote
- [x] wiki/workflow/example.md — Already promoted
```

Then run:

```sh
./scripts/update-ingest-queue.sh
```

To complete an ingest:

1. Decide whether the conclusion is stable and reusable.
2. Add or update the appropriate page under `wiki/`.
3. Update `wiki/index.md`.
4. Append `wiki/log.md`.
5. Check off the source item under `Wiki Promotion Candidates`.
6. Run `./scripts/update-ingest-queue.sh`.
7. Run `./scripts/lint-scaffold.sh`.

## Scripts

### Create Workspace

```sh
./scripts/create-workspace.sh admin
```

Creates a workspace from `templates/workspace/`.

### Lint Scaffold

```sh
./scripts/lint-scaffold.sh
```

Checks scaffold structure, workspace phase README files, wiki index coverage, ingest queue presence, and `git diff --check`.

This is a structural guard. It does not prove that document content is complete or correct.

### Update Ingest Queue

```sh
./scripts/update-ingest-queue.sh
```

Scans visible `Wiki Promotion Candidates` sections and regenerates `wiki/ingest-queue.md`.

## How to Ask an AI Agent

### Starting a new module

```text
Create a workspace for the admin module.
Use the workflow router to choose the smallest useful process.
Update the workspace README handoff before doing implementation work.
```

### Handling a ticket

```text
Put the original ticket in raw-input.
Decide whether discovery is needed.
If behavior is clear, proceed to implementation and record the shortcut.
```

### Taking over existing work

```text
Read the workspace README handoff and the Read First list.
Summarize current state, confirmed facts, unknowns, risks, and the next best action.
Do not modify files yet.
```

### Finishing a task

```text
Update the workspace handoff.
Review Wiki Promotion Candidates.
Run update-ingest-queue and lint-scaffold.
Report any remaining gaps.
```

## Before Commit

Run:

```sh
./scripts/update-ingest-queue.sh
./scripts/lint-scaffold.sh
git diff --check
```

Commit messages must be concise English Conventional Commits.

Examples:

```text
feat: add workspace handoff
docs: clarify wiki promotion
fix: correct ingest queue parsing
```
