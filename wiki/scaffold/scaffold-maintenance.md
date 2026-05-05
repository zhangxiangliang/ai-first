---
title: Scaffold Maintenance Workspace
source: workspaces/scaffold-maintenance/
see-also: [../workflow/ai-first-development.md, ../workflow/llm-wiki-operations.md]
created: 2026-05-05
updated: 2026-05-05
tags: [scaffold, maintenance, workspace, self-bootstrapping]
---

# Scaffold Maintenance Workspace

`workspaces/scaffold-maintenance/` is the persistent workspace for maintaining this project scaffold.

It is not only an example. It is the operational workspace for changes to the scaffold itself, including schema, templates, scripts, wiki operations, workspace structure, and documentation.

## Role

Use `scaffold-maintenance` when changing:

- `WIKI-SCHEMA.md`
- `AGENT-RULES.md`
- agent entry files
- `templates/`
- `scripts/`
- root scaffold documentation
- wiki organization rules
- workspace lifecycle conventions

## Self-Bootstrapping Pattern

The scaffold should use its own workflow to maintain itself.

That means scaffold changes can be represented through the same phase documents used by product workspaces:

```text
raw-input -> discovery -> context -> requirements -> tech-spec -> implementation -> review
```

The full path is useful when the scaffold change is broad or educational. Smaller maintenance tasks can still use standalone phases or direct implementation when appropriate.

## Wiki Ingest Rule

When scaffold maintenance creates stable reusable knowledge, run an ingest step:

1. Identify the durable conclusion from `workspaces/scaffold-maintenance/`.
2. Add or update the relevant wiki page under a topic directory.
3. Update `wiki/index.md`.
4. Append `wiki/log.md`.

If a maintenance change affects how agents should behave, update `WIKI-SCHEMA.md` or `AGENT-RULES.md` as appropriate. Do not rely on wiki pages alone for hard operating rules.

## Current Durable Conclusions

- The wiki should use topic directories instead of a single flat namespace.
- `scaffold-maintenance` is the persistent workspace for evolving the scaffold.
- Scaffold changes should be self-bootstrapped through workspace documents when useful.
- Durable conclusions from scaffold maintenance should be ingested into the wiki.
