# Scaffold Maintenance

Maintenance workspace for evolving the project scaffold itself. This workspace also serves as a complete lifecycle reference for future workspaces.

**Status:** Active
**Owner:** <person or agent>
**Updated:** 2026-05-05

## Goal

Maintain the project scaffold through traceable AI-first workspace documents.

## Scope

### In Scope

- Capture an example raw request
- Show discovery, context, requirements, tech spec, implementation, and review documents
- Demonstrate phase traceability without excessive ceremony
- Track future changes to scaffold schema, templates, scripts, wiki operations, and workspace structure

### Out of Scope

- Building a production application feature
- Adding real customer-specific domain behavior
- Replacing the reusable templates

## Current Phase

review

## Phase Mode

**Mode:** Full Lifecycle
**Reason:** This workspace maintains the scaffold and intentionally keeps a complete lifecycle record for reference.

## Key Documents

- [raw-input/](raw-input/)
- [discovery/](discovery/)
- [context/](context/)
- [requirements/](requirements/)
- [tech-spec/](tech-spec/)
- [implementation/](implementation/)
- [review/](review/)

## Related Workspaces

| Workspace | Relationship |
|-----------|--------------|
| | |

## Related Wiki Pages

| Page | Why It Matters |
|------|----------------|
| [ai-first-development.md](../../wiki/workflow/ai-first-development.md) | Defines the flexible workspace lifecycle |
| [llm-wiki-operations.md](../../wiki/workflow/llm-wiki-operations.md) | Defines ingest, query, and lint behavior |

## Implementation Repositories

| Repository | Role |
|------------|------|
| project-scaffold | Example target repository |

## Decisions

| Date | Decision | Reason |
|------|----------|--------|
| 2026-05-05 | Use a scaffold health-check script as the first maintenance topic | It is small, concrete, and relevant to this repository |
| 2026-05-05 | Keep a full lifecycle record for scaffold maintenance | The workspace should be both operational and instructional |

## Knowledge Gaps

- [x] No external product knowledge is needed for this example.

## Open Questions

- [x] None.

## Next Step

Use this workspace for future project-scaffold maintenance and as a reference when creating real workspaces.
