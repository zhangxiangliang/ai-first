# Scaffold Lint Discovery

**Status:** Approved
**Owner:** AI agent
**Updated:** 2026-05-05

## Phase Scope

**Standalone:** No
**Reason:** This discovery supports the first complete scaffold maintenance lifecycle record.
**Expected Output:** Identify what a minimal scaffold health check should validate.
**Next Phase:** context

## Source Inputs

| Source | Notes |
|--------|-------|
| ../raw-input/example-request.md | Example source request |
| ../../templates/workspace/ | Defines expected workspace phase coverage |
| ../../WIKI-SCHEMA.md | Defines schema and lifecycle expectations |

## Problem Summary

The scaffold has multiple moving parts: root rules, schema, templates, workspaces, wiki pages, and scripts. A small lint script can catch common drift before it becomes confusing.

## Observations

- New workspaces should have a root `README.md`.
- Created phase directories should have their own `README.md`.
- Wiki pages should be discoverable through `wiki/index.md`.
- Markdown changes should pass `git diff --check`.

## Assumptions

- The script should avoid heavyweight dependencies.
- The script should be readable by beginners.
- The script should fail on structural issues and warn on non-standard workspace directories.

## Risks

- A lint script can become too strict and block legitimate flexible workflows.
- A lint script can give false confidence if it checks only structure and not content quality.

## Recommendation

Build a small shell script under `scripts/` that validates scaffold structure and wiki index coverage without enforcing a rigid lifecycle.
