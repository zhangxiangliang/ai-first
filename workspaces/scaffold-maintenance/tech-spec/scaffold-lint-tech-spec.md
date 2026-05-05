# Scaffold Lint Tech Spec

**Status:** Approved
**Owner:** AI agent
**Updated:** 2026-05-05

## Phase Scope

**Standalone:** No
**Reason:** This tech spec maps the example requirements to files and checks.
**Expected Output:** Small implementation plan for the lint script.
**Next Phase:** implementation

## Requirement Links

- ../requirements/scaffold-lint-requirements.md

## Summary

Add a `scripts/lint-scaffold.sh` shell script and document it in `scripts/README.md`.

## Proposed Approach

Use a dependency-free shell script that resolves the repository root, checks required files and directories, iterates through workspaces, checks wiki index coverage, and reports a pass/fail result.

## Task Breakdown

| Task | Files / Areas | Acceptance |
|------|---------------|------------|
| Add lint script | `scripts/lint-scaffold.sh` | Script exits 0 on current scaffold |
| Document command | `scripts/README.md` | README shows how to run it |
| Reference command | `README.md`, `WIKI-SCHEMA.md` | Users can discover the command |

## Testing Strategy

### Automated Tests

- [x] Run `./scripts/lint-scaffold.sh`
- [x] Run `git diff --check`

### Manual Tests

- [x] Inspect output for concise pass/fail behavior

## Rollback Plan

Remove `scripts/lint-scaffold.sh` and its documentation references.

## Risks

- The script may become stale if schema structure changes.
- The script intentionally checks structure, not content quality.

## Wiki Promotion Candidates

- [x] wiki/scaffold/scaffold-health-checks.md — Health-check scripts should be treated as structural guards, not proof of documentation quality.
