# Requirements

Requirements convert raw input and discovery into confirmed PRD-style product intent.

Do not write a tech spec from requirements that still contain unresolved ambiguity unless the assumptions are explicit and approved.

## Requirements Template

```md
# <Feature or Module> Requirements

**Status:** Draft | In Review | Approved | Superseded
**Owner:** <person or agent>
**Updated:** YYYY-MM-DD

## Phase Scope

**Standalone:** Yes | No
**Reason:** <why requirements are being drafted now>
**Expected Output:** <approved PRD, draft requirements, scope clarification, etc.>
**Next Phase:** None | discovery | context | tech-spec | implementation | review

## Goal

[One clear sentence describing what should be achieved.]

## Background

[Why this is needed.]

## Users / Actors

| Actor | Need |
|-------|------|
| | |

## Tickets

Use workspace-scoped ticket IDs to avoid collisions across workspaces.

| Ticket ID | Source | Summary | Status |
|-----------|--------|---------|--------|
| `<WORKSPACE-PREFIX>-TICKET-001` | ../raw-input/<file> | [Short summary] | Open |

## Functional Requirements

| ID | Requirement |
|----|-------------|
| `<WORKSPACE-PREFIX>-REQ-001` | [The system shall ...] |

## Non-Functional Requirements

- [Performance, security, auditability, accessibility, compliance, reliability]

## Acceptance Criteria

| Requirement ID | Criterion | Status |
|----------------|-----------|--------|
| `<WORKSPACE-PREFIX>-REQ-001` | [Measurable criterion] | Not Started |

## Scope

### In Scope

- [Included]

### Out of Scope

- [Excluded]

## Dependencies

- [Dependency]

## Open Questions

- [ ] [Question]

## Source Traceability

| Requirement ID | Ticket ID | Source | Notes |
|----------------|-----------|--------|-------|
| `<WORKSPACE-PREFIX>-REQ-001` | `<WORKSPACE-PREFIX>-TICKET-001` | ../raw-input/<file> | |

## Approval

**Approved By:** <name>
**Approval Date:** YYYY-MM-DD
**Notes:** <notes>

## Wiki Promotion Candidates

- [ ] wiki/<topic>/<page>.md — Reusable product rule, domain concept, or requirement pattern
```
