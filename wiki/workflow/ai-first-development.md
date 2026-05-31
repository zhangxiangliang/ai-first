---
title: AI-First Development Lifecycle
source: WIKI-SCHEMA.md; workspaces/ppt/*
see-also: [llm-wiki-operations.md, ../conventions/project-conventions.md, ../scaffold/scaffold.md]
created: 2026-05-05
updated: 2026-05-28
tags: [ai-first, prd, lifecycle, workspaces, human-in-the-loop]
---

# AI-First Development Lifecycle

AI-first development in this scaffold is a PRD-centered workflow that turns original source material into confirmed requirements, reviewed technical specifications, implementation tracking, and final review evidence when that level of process is useful.

The lifecycle is flexible. Substantial or ambiguous work should use the full path. Each phase can also stand alone when that is the right fit, such as discovery-only research, context-only documentation, implementation-only operational work, or review-only audits.

Use the smallest workflow that preserves useful traceability.

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

## Handoff

Each workspace README should include a short handoff section:

- current state
- confirmed facts or decisions
- unknowns
- next best action
- files to read first

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

## Wiki Relationship

Workspace documents own active project state. The wiki owns stable reusable knowledge.

Promote knowledge to the wiki when it becomes reusable across workspaces, such as product concepts, architecture decisions, domain terminology, or recurring constraints.

## Validated Working Pattern

The `ppt` workspace validated this lifecycle for a content-heavy project, not only software implementation. The same pattern worked for turning rough speech-to-text into a finished HTML slide deck and speaker script.

Reusable pattern:

```text
rough input -> clarification -> requirements -> context correction -> technical plan -> drafted artifacts -> implementation artifact -> review -> wiki
```

Key observations:

- `raw-input` does not need to be clean. It should preserve the first rough material, including transcription errors, incomplete phrasing, and unclear intent.
- `discovery` is where the AI turns messy input into questions, topic structure, missing examples, risks, and candidate narratives.
- `requirements` must convert the conversation into explicit constraints, such as audience, duration, deliverables, tone, in-scope items, and out-of-scope items.
- `context` is where human corrections become durable: wrong transcriptions, naming fixes, domain vocabulary, sensitive examples, and style preferences.
- `tech-spec` is still useful for document work. It defines the artifact format, file placement, dependencies, review gates, and what counts as done.
- `implementation` can be a document phase before real artifact creation. For human-reviewed work, implementation planning and actual execution can be separate steps.
- `review` should verify both the artifact and the process state: output exists, acceptance criteria pass, documents align, dependencies work, and unresolved risks are named.

## Human Role

When AI can generate most of the implementation, the human role moves earlier and later in the lifecycle.

Earlier:

- state the real problem
- provide context
- choose constraints
- decide what success means
- correct the AI's interpretation

Later:

- judge whether the output is right
- catch omissions and style drift
- decide when to ship
- turn one-off lessons into reusable wiki knowledge

The value is not competing with AI on generation speed. The value is making the problem clear, deciding what is correct, and turning repeated experience into a system.
