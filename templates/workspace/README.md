# Workspace Template

Copy this structure when creating a new project, module, or feature workspace.

```text
workspaces/<workspace-name>/
├── README.md
├── raw-input/
├── discovery/
├── context/
├── requirements/
├── tech-spec/
├── implementation/
└── review/
```

## Naming Rules

- Use a meaningful kebab-case workspace name that describes the project, module, feature, or outcome.
- Do not use generic workspace names such as `request`, `task`, `workspace`, `notes`, `misc`, or `temp`.
- Pick a stable topic slug for each work item and reuse it across phases.
- Do not create generic phase files such as `request.md`, `requirements.md`, `notes.md`, `draft.md`, `spec.md`, `implementation.md`, or `review.md`.
- Example: `raw-input/create-user-table.md`, `requirements/create-user-table.md`, `tech-spec/create-user-table.md`, `implementation/create-user-table.md`.

## Root README Template

```md
# <Workspace Name>

Short description of the module, feature, or project.

**Status:** Draft | In Discovery | Requirements Review | Tech Spec Review | Implementation | Review | Done
**Owner:** <person or agent>
**Updated:** YYYY-MM-DD

## Goal

[One clear sentence describing the desired outcome.]

## Scope

### In Scope

- [What this workspace covers]

### Out of Scope

- [What this workspace intentionally excludes]

## Current Phase

[raw-input | discovery | context | requirements | tech-spec | implementation | review]

## Phase Mode

**Mode:** Full Lifecycle | Standalone Phase | Phase Subset
**Reason:** <why this workspace uses this amount of process>

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

## Key Documents

- [raw-input/<topic-slug>.md](raw-input/<topic-slug>.md)
- [discovery/<topic-slug>.md](discovery/<topic-slug>.md)
- [context/<topic-slug>.md](context/<topic-slug>.md)
- [requirements/<topic-slug>.md](requirements/<topic-slug>.md)
- [tech-spec/<topic-slug>.md](tech-spec/<topic-slug>.md)
- [implementation/<topic-slug>.md](implementation/<topic-slug>.md)
- [review/<topic-slug>.md](review/<topic-slug>.md)

## Related Workspaces

| Workspace | Relationship |
|-----------|--------------|
| | |

## Related Wiki Pages

| Page | Why It Matters |
|------|----------------|
| | |

## Implementation Repositories

| Repository | Role |
|------------|------|
| | |

## Open Questions

- [ ] [Question]

## Decisions

| Date | Decision | Reason |
|------|----------|--------|
| | | |

## Knowledge Gaps

- [ ] [Missing information]

## ID Prefix

Use `<WORKSPACE-PREFIX>-REQ-001` and `<WORKSPACE-PREFIX>-TICKET-001` IDs for requirements and tickets.

## Next Step

[The immediate next action.]
```
