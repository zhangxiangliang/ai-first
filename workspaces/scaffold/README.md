# Scaffold

Persistent workspace for maintaining this project scaffold.

This is the single place for scaffold conventions, structural decisions, maintenance tasks, lifecycle examples, and reusable project initialization guidance.

**Status:** Active
**Owner:** Repository maintainers and AI agents
**Updated:** 2026-05-05

## Goal

Keep the scaffold clear, reusable, and easy for humans and AI agents to understand.

## Scope

### In Scope

- Repository-wide conventions and operating rules
- Workspace lifecycle and naming rules
- Templates, scripts, and scaffold documentation
- Wiki organization and ingest workflow
- Repository structure and project initialization guidance
- Scaffold maintenance requirements, tech specs, implementation notes, and reviews

### Out of Scope

- Product-specific project planning
- Customer-specific domain knowledge
- Implementation code inside `repos/`

## Current Phase

implementation

## Phase Mode

**Mode:** Phase Subset
**Reason:** This is a persistent maintenance workspace. Each scaffold change uses only the phases needed for the change.

## Handoff

### Current State

`workspaces/scaffold/` is the single workspace for scaffold operation and evolution. Historical scaffold documents have been consolidated here.

### Confirmed

- Scaffold operating rules belong in `AGENT-RULES.md` and `WIKI-SCHEMA.md`.
- Reusable scaffold conclusions belong in `wiki/`.
- User project workspaces should stay separate from scaffold maintenance.
- Scaffold maintenance must stay local and must not automate copying files into downstream projects where user content can be overwritten.
- `scripts/scaffold.sh` is the single scaffold CLI entry point.

### Unknown

- No current blocker.

### Next Best Action

Use this workspace for future scaffold changes and keep this handoff current.

### Read First

- [WIKI-SCHEMA.md](../../WIKI-SCHEMA.md)
- [AGENT-RULES.md](../../AGENT-RULES.md)
- [wiki/scaffold/scaffold.md](../../wiki/scaffold/scaffold.md)

## Key Documents

- [raw-input/](raw-input/)
- [discovery/](discovery/)
- [context/](context/)
- [requirements/](requirements/)
- [tech-spec/](tech-spec/)
- [implementation/](implementation/)
- [review/](review/)

## Related Wiki Pages

| Page | Why It Matters |
|------|----------------|
| [ai-first-development.md](../../wiki/workflow/ai-first-development.md) | Defines the flexible workspace lifecycle |
| [llm-wiki-operations.md](../../wiki/workflow/llm-wiki-operations.md) | Defines ingest, query, and lint behavior |
| [scaffold.md](../../wiki/scaffold/scaffold.md) | Defines this workspace's role |

## Implementation Repositories

| Repository | Role |
|------------|------|
| project-scaffold | Scaffold repository |

## Decisions

| Date | Decision | Reason |
|------|----------|--------|
| 2026-05-05 | Consolidate scaffold work into one workspace | A single scaffold workspace is easier to understand and maintain |
| 2026-05-05 | Use one scaffold CLI entry point | A single command reduces script discovery and keeps maintenance simple |

## ID Prefix

Use `SCAFFOLD-REQ-001` and `SCAFFOLD-TICKET-001` IDs for future scaffold requirements and tickets.

## Wiki Promotion Candidates

- [x] wiki/scaffold/scaffold.md — Scaffold work should use one persistent workspace.
- [x] wiki/scaffold/scaffold.md — Scaffold operations should use one primary CLI entry point.

## Open Questions

- [x] None.

## Next Step

Use this workspace for future scaffold changes.
