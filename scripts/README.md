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

## Create Document

Create a phase document in an existing workspace:

```sh
./scripts/scaffold.sh create-doc user-management implementation create-user-table
```

Create all standard phase documents for a topic:

```sh
./scripts/scaffold.sh create-doc user-management all create-user-table
```

The phase argument is one of the canonical lifecycle phases — `raw-input`, `discovery`, `context`, `requirements`, `tech-spec`, `implementation`, `worklog`, `review` — or `all`. `worklog` is a running session log promoted from real project usage; see `WIKI-SCHEMA.md` for its semantics.

`create-doc` renders templates from `templates/documents/` and refuses to overwrite existing files. If the target phase directory does not exist yet, `create-doc` creates it (with its phase `README.md`) for any canonical phase.

## Workspace Status

Show the lifecycle state of every workspace topic document in one table:

```sh
./scripts/scaffold.sh status
```

For each phase document it reports the owning workspace, phase, topic slug, `**Status:**`
value, `**Updated:**` date, and how many days ago it was updated. A `(unset)` status means
the document still holds the template menu and needs a real status. Rows are grouped by
workspace and ordered by lifecycle phase.

## Stale Documents

Report documents that have not been updated within a threshold so old claims surface for review:

```sh
./scripts/scaffold.sh stale        # defaults to 30 days
./scripts/scaffold.sh stale 14
```

This scans both `workspaces/` phase documents and `wiki/` pages, reading the `**Updated:**`
field (workspace docs) or `updated:` frontmatter (wiki pages). Documents older than the
threshold are listed newest-overdue last. Documents without a parseable date are skipped.

## Lint Scaffold

Run a structural health check:

```sh
./scripts/scaffold.sh lint
```

This checks required root files, executable scaffold scripts, workspace phase README files, document template coverage, workspace root README placeholders, wiki index coverage in both directions, local Markdown link targets, non-standard workspace directories (with a canonical-name suggestion when the directory is a recognized variant, e.g. `tests/` → `test-cases/`), phase document naming warnings, ignored local noise files, and `git diff --check`.

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
