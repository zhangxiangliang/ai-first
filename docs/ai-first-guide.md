# AI Workspace Scaffold Guide

This guide explains how to work inside AI Workspace Scaffold.

The goal is not to force a heavy process. The goal is to keep enough structure that a human or AI agent can recover context, understand the current state, and continue work without rediscovering everything from scratch.

## Mental Model

This repository is a coordination layer.

| Layer | Purpose |
|-------|---------|
| `workspaces/` | Active project, module, or feature work |
| `wiki/` | Stable reusable knowledge |
| `repos/` | Implementation repositories, usually linked as git submodules |
| `templates/` | Workspace scaffolding and reusable document templates |
| `scripts/` | Scaffold CLI |

## Start Here

When entering the project, read:

1. `LLM-WIKI.md`
2. `WIKI-SCHEMA.md`
3. `AGENT-RULES.md`
4. `scripts/README.md`
5. the active workspace `README.md`
6. relevant pages from `wiki/index.md`

Do not read every file by default. Start from the active workspace and follow links.

## New Project Setup

If this repository was cloned as a starting point for a new project, update Git remotes before the first project commit or push. Otherwise commits can still target the scaffold source repository.

Replace `origin` with the new project repository:

```sh
git remote set-url origin <your-project-repo-url>
git remote -v
```

Or keep the scaffold remote for reference and add the project repository as `origin`:

```sh
git remote rename origin scaffold
git remote add origin <your-project-repo-url>
git remote -v
```

Before pushing, verify that `origin` is the project repository:

```sh
git remote get-url origin
git push -u origin main
```

## Create a Workspace

Create a new workspace:

```sh
./scripts/scaffold.sh create user-management
```

Optionally create the first topic documents at the same time:

```sh
./scripts/scaffold.sh create user-management create-user-table
```

This creates:

```text
workspaces/user-management/
├── README.md
├── raw-input/
├── discovery/
├── context/
├── requirements/
├── tech-spec/
├── implementation/
├── worklog/
└── review/
```

With a topic slug, it also creates starter documents in `raw-input/`, `requirements/`, and `tech-spec/`.

After creation, update the workspace `README.md`, especially:

- `Goal`
- `Current Phase`
- `Phase Mode`
- `Handoff`
- `Next Step`

## Choose the Smallest Useful Workflow

The full reference lifecycle is:

```text
raw-input -> discovery -> context -> requirements -> tech-spec -> implementation -> worklog -> review
```

`worklog` is an optional running log; use it for long-running or multi-session work.

This is not mandatory. Choose the smallest path that preserves useful traceability, subject to two invariants:

- **raw-input is almost always required** — it records why a change exists. Only standalone `discovery` or `context` may omit it.
- **tech-spec precedes implementation for anything beyond a simple change** — it is the cheap human review gate where direction is checked before implementation detail. Only simple, low-risk changes go `raw-input -> implementation` directly.

| Situation | Suggested Path |
|-----------|----------------|
| Simple, low-risk change | `raw-input -> implementation` |
| Bug or support ticket | `raw-input -> tech-spec -> implementation -> review` (a simple bug may skip tech-spec) |
| Bug with unclear expected behavior | `raw-input -> discovery -> requirements -> tech-spec -> implementation -> review` |
| Clear product feature | `raw-input -> requirements -> tech-spec -> implementation -> review` |
| Ambiguous product work | `raw-input -> discovery -> context -> requirements` |
| Architecture or cross-module change | `raw-input -> context -> tech-spec -> implementation -> review -> wiki promotion` |
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

## Naming

Use names that make work findable without opening files.

- Workspace names should describe the project, module, feature, or outcome.
- Do not use generic names such as `request`, `task`, `notes`, `misc`, or `temp`.
- For one work item, reuse the same topic slug across phases.

Example:

```text
workspaces/user-management/
├── raw-input/create-user-table.md
├── requirements/create-user-table.md
├── tech-spec/create-user-table.md
├── implementation/create-user-table.md
└── review/create-user-table.md
```

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
./scripts/scaffold.sh ingest
```

To complete an ingest:

1. Decide whether the conclusion is stable and reusable.
2. Add or update the appropriate page under `wiki/`.
3. Update `wiki/index.md`.
4. Append `wiki/log.md`.
5. Check off the source item under `Wiki Promotion Candidates`.
6. Run `./scripts/scaffold.sh ingest`.
7. Run `./scripts/scaffold.sh lint`.

## Scripts

### Create Workspace

```sh
./scripts/scaffold.sh create user-management
```

Creates a workspace from `templates/workspace/`. Add an optional topic slug to create starter documents from `templates/documents/`.

### Create Document

```sh
./scripts/scaffold.sh create-doc user-management implementation create-user-table
```

Creates a phase document in an existing workspace. Use `all` instead of a phase name to create every standard phase document for the topic.

### Lint Scaffold

```sh
./scripts/scaffold.sh lint
```

Checks scaffold structure, executable scaffold scripts, workspace phase README files, document template coverage, workspace root README placeholders, wiki index coverage in both directions, phase document naming warnings, ignored local noise files, ingest queue presence, and `git diff --check`.

This is a structural guard. It does not prove that document content is complete or correct.

### Generate Ingest Queue

```sh
./scripts/scaffold.sh ingest
```

Scans visible `Wiki Promotion Candidates` sections and regenerates `wiki/ingest-queue.md`.

## How to Ask an AI Agent

### Starting a new module

```text
Create a workspace for the user management module.
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
Run ingest and lint.
Report any remaining gaps.
```

## Before Commit

Run:

```sh
./scripts/scaffold.sh ingest
./scripts/scaffold.sh lint
git diff --check
```

Commit messages must be concise English Conventional Commits.

Examples:

```text
feat: add workspace handoff
docs: clarify wiki promotion
fix: correct ingest queue parsing
```
