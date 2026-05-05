# Scaffold Lint Requirements

**Status:** Approved
**Owner:** AI agent
**Updated:** 2026-05-05

## Phase Scope

**Standalone:** No
**Reason:** Requirements make the example implementation testable.
**Expected Output:** Approved requirements for a small scaffold health-check script.
**Next Phase:** tech-spec

## Goal

Provide a simple command that checks whether the scaffold's required structure is present and internally discoverable.

## Users / Actors

| Actor | Need |
|-------|------|
| Scaffold maintainer | Quickly detect structural drift |

## Tickets

| Ticket ID | Source | Summary | Status |
|-----------|--------|---------|--------|
| SCAFFOLD_MAINTENANCE-TICKET-001 | ../raw-input/example-request.md | Add a scaffold health-check script | Closed |

## Functional Requirements

| ID | Requirement |
|----|-------------|
| SCAFFOLD_MAINTENANCE-REQ-001 | The script shall verify required root files exist. |
| SCAFFOLD_MAINTENANCE-REQ-002 | The script shall verify required root directories exist. |
| SCAFFOLD_MAINTENANCE-REQ-003 | The script shall verify each workspace has a root `README.md`. |
| SCAFFOLD_MAINTENANCE-REQ-004 | The script shall verify each standard phase directory inside a workspace has a `README.md`. |
| SCAFFOLD_MAINTENANCE-REQ-005 | The script shall verify non-index wiki pages are listed in `wiki/index.md`. |
| SCAFFOLD_MAINTENANCE-REQ-006 | The script shall run `git diff --check` and report formatting issues. |

## Non-Functional Requirements

- The script should use standard shell tools.
- The script should have no package dependencies.
- The output should be concise.

## Acceptance Criteria

| Requirement ID | Criterion | Status |
|----------------|-----------|--------|
| SCAFFOLD_MAINTENANCE-REQ-001 | Running `./scripts/lint-scaffold.sh` succeeds on the current scaffold. | Pass |
| SCAFFOLD_MAINTENANCE-REQ-001 | Missing required files cause a failure. | Pass |
| SCAFFOLD_MAINTENANCE-REQ-004 | Non-standard workspace directories produce warnings rather than hard failures. | Pass |
| SCAFFOLD_MAINTENANCE-REQ-006 | The script is documented in `scripts/README.md`. | Pass |

## Source Traceability

| Requirement ID | Ticket ID | Source | Notes |
|----------------|-----------|--------|-------|
| SCAFFOLD_MAINTENANCE-REQ-001 | SCAFFOLD_MAINTENANCE-TICKET-001 | ../raw-input/example-request.md | Health-check command |
| SCAFFOLD_MAINTENANCE-REQ-004 | SCAFFOLD_MAINTENANCE-TICKET-001 | ../../WIKI-SCHEMA.md | Workspace phase README checks |
| SCAFFOLD_MAINTENANCE-REQ-005 | SCAFFOLD_MAINTENANCE-TICKET-001 | ../../wiki/workflow/llm-wiki-operations.md | Wiki index coverage |

## Approval

**Approved By:** Scaffold maintenance workspace
**Approval Date:** 2026-05-05
**Notes:** Approved as the first scaffold maintenance lifecycle example.
