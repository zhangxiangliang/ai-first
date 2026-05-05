---
title: Scaffold Health Checks
source: workspaces/scaffold-maintenance/
see-also: [scaffold-maintenance.md, ../workflow/llm-wiki-operations.md]
created: 2026-05-05
updated: 2026-05-05
tags: [scaffold, lint, health-checks, maintenance]
---

# Scaffold Health Checks

Scaffold health checks are structural guards for this repository.

They help detect drift in required files, workspace phase documentation, wiki index coverage, and basic markdown formatting. They do not prove that documentation content is complete, correct, or high quality.

## Current Script

Run:

```sh
./scripts/lint-scaffold.sh
```

## What It Checks

- Required root files exist.
- Required root directories exist.
- Workspace root `README.md` files exist.
- Standard workspace phase directories have `README.md` files.
- Non-index wiki pages are listed in `wiki/index.md`.
- `git diff --check` reports no whitespace or conflict-marker issues.
- `wiki/ingest-queue.md` exists and exposes pending wiki promotion candidates.

## Design Principles

- Prefer structural checks over subjective content checks.
- Warn when a flexible workflow may be valid instead of failing unnecessarily.
- Keep the script dependency-free and readable.
- Treat lint success as "the scaffold is structurally coherent," not "the knowledge base is complete."

## Limits

The lint script cannot decide whether a requirement is good, whether a tech spec is sufficient, or whether a wiki conclusion is true. Those checks require human or AI review.
