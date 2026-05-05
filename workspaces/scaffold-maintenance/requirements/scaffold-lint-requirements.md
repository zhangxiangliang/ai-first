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

## Functional Requirements

1. The script shall verify required root files exist.
2. The script shall verify required root directories exist.
3. The script shall verify each workspace has a root `README.md`.
4. The script shall verify each standard phase directory inside a workspace has a `README.md`.
5. The script shall verify non-index wiki pages are listed in `wiki/index.md`.
6. The script shall run `git diff --check` and report formatting issues.

## Non-Functional Requirements

- The script should use standard shell tools.
- The script should have no package dependencies.
- The output should be concise.

## Acceptance Criteria

1. [x] Running `./scripts/lint-scaffold.sh` succeeds on the current scaffold.
2. [x] Missing required files cause a failure.
3. [x] Non-standard workspace directories produce warnings rather than hard failures.
4. [x] The script is documented in `scripts/README.md`.

## Source Traceability

| Requirement | Source |
|-------------|--------|
| Health-check command | ../raw-input/example-request.md |
| Workspace phase README checks | ../../WIKI-SCHEMA.md |
| Wiki index coverage | ../../wiki/workflow/llm-wiki-operations.md |

## Approval

**Approved By:** Scaffold maintenance workspace
**Approval Date:** 2026-05-05
**Notes:** Approved as the first scaffold maintenance lifecycle example.
