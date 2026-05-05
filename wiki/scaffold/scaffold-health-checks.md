---
title: Scaffold Health Checks
source: workspaces/scaffold/
see-also: [scaffold.md, ../workflow/llm-wiki-operations.md]
created: 2026-05-05
updated: 2026-05-05
tags: [scaffold, lint, health-checks, maintenance]
---

# Scaffold Health Checks

Scaffold health checks are structural guards for this repository.

They help detect drift in required files, workspace phase documentation, document templates, wiki index coverage, phase document naming, and basic markdown formatting. They do not prove that documentation content is complete, correct, or high quality.

## Current Script

Run:

```sh
./scripts/scaffold.sh lint
```

## What It Checks

- Required root files exist.
- Required root directories exist.
- Scaffold scripts that users or maintainers run are executable.
- Workspace root `README.md` files exist.
- Workspace root `README.md` files do not still contain template placeholders.
- Standard workspace phase directories have `README.md` files.
- Standard phase document templates exist under `templates/documents/`.
- Workspace phase documents avoid generic file names.
- Workspace phase documents warn when related phases appear to use different topic slugs.
- Non-index wiki pages are listed in `wiki/index.md`.
- `wiki/index.md` links point to existing wiki files.
- Ignored local noise files such as `.DS_Store` are reported as warnings.
- `git diff --check` reports no whitespace or conflict-marker issues.
- `wiki/ingest-queue.md` exists and exposes pending wiki promotion candidates.

## Design Principles

- Prefer structural checks over subjective content checks.
- Warn when a flexible workflow may be valid instead of failing unnecessarily.
- Keep the script dependency-free and readable.
- Treat lint success as "the scaffold is structurally coherent," not "the knowledge base is complete."

## Limits

The lint script cannot decide whether a requirement is good, whether a tech spec is sufficient, or whether a wiki conclusion is true. Those checks require human or AI review.
