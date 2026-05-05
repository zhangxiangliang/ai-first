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

## Knowledge Sink

Reusable knowledge produced during projects sinks to `wiki/`.

## Active Workspaces

| Workspace | Description | Status |
|-----------|-------------|--------|
| [foundation](./foundation/) | Shared conventions and initialization guidance | Persistent |
| [scaffold-maintenance](./scaffold-maintenance/) | Maintenance workspace for the project scaffold; also serves as a complete lifecycle reference | Active |
