# Workspaces

Active project workspaces. Each follows the AI-first PRD lifecycle defined in [../WIKI-SCHEMA.md](../WIKI-SCHEMA.md).

## Phase Structure

```text
raw-input/       -> Original source materials, unchanged
discovery/       -> Research, ambiguity, open questions, risks
context/         -> Product and technical background for future agents
requirements/    -> Confirmed PRD-style requirements and acceptance criteria
tech-spec/       -> Reviewed technical design and task breakdown
implementation/  -> Execution tracking, deviations, verification evidence
review/          -> Acceptance verification and final sign-off
```

Use [../templates/workspace/](../templates/workspace/) when creating a new workspace.

The full phase structure is the default for substantial or ambiguous work. Each phase can also be used independently. Clear small changes, bug fixes, operational tasks, user-directed implementation tasks, standalone research, or review-only work may start directly in the relevant phase. Record the phase scope or shortcut reason in the active document.

## Naming

Use meaningful kebab-case workspace names. For one work item, reuse the same topic slug across phases, such as `raw-input/create-user-table.md`, `requirements/create-user-table.md`, and `tech-spec/create-user-table.md`.

Do not use generic workspace or document names such as `request`, `task`, `notes`, `request.md`, or `notes.md`.

## Knowledge Sink

Reusable knowledge produced during projects sinks to `wiki/`.

## Active Workspaces

| Workspace | Description | Status |
|-----------|-------------|--------|
| [foundation](./foundation/) | Shared conventions and initialization guidance | Persistent |
| [scaffold-maintenance](./scaffold-maintenance/) | Maintenance workspace for the project scaffold; also serves as a complete lifecycle reference | Active |
