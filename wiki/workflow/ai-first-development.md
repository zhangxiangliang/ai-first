---
title: AI-First Development Lifecycle
source: WIKI-SCHEMA.md
see-also: [llm-wiki-operations.md, ../conventions/project-conventions.md, ../scaffold/scaffold-maintenance.md]
created: 2026-05-05
updated: 2026-05-05
tags: [ai-first, prd, lifecycle, workspaces]
---

# AI-First Development Lifecycle

AI-first development in this scaffold is a PRD-centered workflow that turns original source material into confirmed requirements, reviewed technical specifications, implementation tracking, and final review evidence when that level of process is useful.

The lifecycle is flexible. Substantial or ambiguous work should use the full path. Each phase can also stand alone when that is the right fit, such as discovery-only research, context-only documentation, implementation-only operational work, or review-only audits.

## Lifecycle

```text
raw-input -> discovery -> context -> requirements -> tech-spec -> implementation -> review
```

## Phase Meaning

| Phase | Purpose |
|-------|---------|
| `raw-input/` | Preserve original source material unchanged |
| `discovery/` | Research, clarify ambiguity, identify risks and questions |
| `context/` | Capture background needed by future humans and AI agents |
| `requirements/` | Convert source material into confirmed PRD-style requirements |
| `tech-spec/` | Translate approved requirements into an implementation design |
| `implementation/` | Track execution, deviations, changed files, and verification |
| `review/` | Verify acceptance criteria and record final decision |

## Gate Rules

- Requirements should not advance to tech spec until ambiguity is resolved or explicitly accepted.
- Tech specs should not advance to implementation until reviewed or explicitly approved by the user.
- Direct implementation is allowed for small, clear, operational, or explicitly requested tasks.
- Shortcuts should record the starting phase, skipped phases, reason, and risk.
- Standalone phases should record phase scope, inputs, expected output, and next phase if any.
- Implementation should record deviations from the tech spec.
- Review should trace back to acceptance criteria.

## Workflow Depth

| Task Type | Minimum Path |
|-----------|--------------|
| Ambiguous product work | `raw-input -> discovery -> context -> requirements -> tech-spec -> implementation -> review` |
| Clear feature with known context | `requirements -> tech-spec -> implementation -> review` |
| Small clear change | `implementation -> review` |
| Bug with a ticket | `raw-input -> requirements -> implementation -> review` |
| Operational cleanup | `implementation` |
| Research only | `discovery -> context` |
| Standalone investigation | `discovery` |
| Context capture only | `context` |
| Requirements drafting only | `requirements` |
| Technical planning only | `tech-spec` |
| Review or audit only | `review` |

## Wiki Relationship

Workspace documents own active project state. The wiki owns stable reusable knowledge.

Promote knowledge to the wiki when it becomes reusable across workspaces, such as product concepts, architecture decisions, domain terminology, or recurring constraints.
