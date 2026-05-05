# Scripts

Utility scripts for operating this scaffold.

`scaffold.sh` is the only user-facing scaffold command. Files under `scripts/lib/` are internal implementation modules sourced by `scaffold.sh`; call the top-level command instead of calling library files directly.

## Create Workspace

Create a new AI-first workspace from the reusable template:

```sh
./scripts/scaffold.sh create user-management
```

Optionally provide the first topic slug:

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
└── review/
```

When a topic slug is provided, this also creates:

```text
workspaces/user-management/raw-input/create-user-table.md
workspaces/user-management/requirements/create-user-table.md
workspaces/user-management/tech-spec/create-user-table.md
```

After creation, update the workspace root `README.md` and capture original source materials in `raw-input/`.

Use meaningful names for both workspaces and phase documents. For one work item, keep the same topic slug across phases:

```text
raw-input/create-user-table.md
requirements/create-user-table.md
tech-spec/create-user-table.md
implementation/create-user-table.md
```

## Lint Scaffold

Run a structural health check:

```sh
./scripts/scaffold.sh lint
```

This checks required root files, executable scaffold scripts, workspace phase README files, document template coverage, workspace root README placeholders, wiki index coverage in both directions, phase document naming warnings, ignored local noise files, and `git diff --check`.

## Generate Ingest Queue

Generate the wiki ingest queue from visible workspace sections:

```sh
./scripts/scaffold.sh ingest
```

Workspace documents can include:

```md
## Wiki Promotion Candidates

- [ ] wiki/scaffold/example.md — Stable conclusion to promote
- [x] wiki/workflow/example.md — Already promoted
```

Unchecked items are collected into `wiki/ingest-queue.md`.

## Agent Launch Helpers

Launch Codex or Claude from the scaffold root with elevated local permissions:

```sh
./scripts/codex.sh
./scripts/claude.sh
```

These helpers are convenience wrappers for local maintainer use. They forward any extra arguments to the underlying CLI.
