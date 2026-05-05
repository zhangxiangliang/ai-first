# Scaffold CLI Requirements

**Status:** Approved
**Owner:** AI agent
**Updated:** 2026-05-05

## Phase Scope

**Standalone:** No
**Reason:** This change affects scripts, docs, and scaffold maintenance flow.
**Expected Output:** Single CLI entry point for local scaffold operations.
**Next Phase:** tech-spec

## Goal

Provide one primary scaffold command that is easy to remember and safe to use.

## Functional Requirements

| ID | Requirement |
|----|-------------|
| SCAFFOLD-REQ-010 | The scaffold shall expose `create`, `lint`, and `ingest` through `scripts/scaffold.sh`. |
| SCAFFOLD-REQ-011 | The scaffold shall only expose operations that stay within the current repository. |
| SCAFFOLD-REQ-013 | Workspace root README generation shall use a template file instead of embedding the document in shell code. |
| SCAFFOLD-REQ-014 | Documentation shall recommend the single CLI entry point. |
| SCAFFOLD-REQ-015 | The single CLI entry point shall delegate implementation details to internal script modules instead of keeping all logic in one large file. |

## Acceptance Criteria

| Requirement ID | Criterion | Status |
|----------------|-----------|--------|
| SCAFFOLD-REQ-010 | `./scripts/scaffold.sh create`, `lint`, and `ingest` run from the single script. | Pass |
| SCAFFOLD-REQ-011 | `./scripts/scaffold.sh --help` lists only `create`, `lint`, and `ingest`. | Pass |
| SCAFFOLD-REQ-013 | `create` renders `templates/workspace-root.md`. | Pass |
| SCAFFOLD-REQ-014 | User-facing docs use `./scripts/scaffold.sh ...` commands. | Pass |
| SCAFFOLD-REQ-015 | `scripts/scaffold.sh` dispatches to `scripts/lib/*.sh` modules. | Pass |

## Source Traceability

| Requirement ID | Source | Notes |
|----------------|--------|-------|
| SCAFFOLD-REQ-010 | ../raw-input/scaffold-cli.md | Single CLI entry point |
| SCAFFOLD-REQ-011 | ../raw-input/scaffold-cli.md | Avoid risky downstream file copying |
| SCAFFOLD-REQ-013 | Maintainer review | Avoid duplicated root README templates |
| SCAFFOLD-REQ-014 | Maintainer review | Reduce user-facing command surface |
| SCAFFOLD-REQ-015 | Maintainer review | Keep the single CLI maintainable |

## Wiki Promotion Candidates

- [x] wiki/scaffold/scaffold.md — Scaffold maintenance should keep one primary script entry point.
