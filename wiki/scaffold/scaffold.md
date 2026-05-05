---
title: Scaffold Workspace
source: workspaces/scaffold/
see-also: [../workflow/ai-first-development.md, ../workflow/llm-wiki-operations.md]
created: 2026-05-05
updated: 2026-05-05
tags: [scaffold, workspace, self-bootstrapping]
---

# Scaffold Workspace

`workspaces/scaffold/` is the persistent workspace for maintaining this project scaffold.

It is not only an example. It is the operational workspace for changes to the scaffold itself, including conventions, schema, templates, scripts, wiki operations, workspace structure, and documentation.

## Role

Use `scaffold` when changing:

- `WIKI-SCHEMA.md`
- `AGENT-RULES.md`
- agent entry files
- `templates/`
- `scripts/`
- root scaffold documentation
- wiki organization rules
- workspace lifecycle conventions

## CLI

Use `scripts/scaffold.sh` as the single scaffold command:

```sh
./scripts/scaffold.sh create <workspace-name>
./scripts/scaffold.sh create <workspace-name> <topic-slug>
./scripts/scaffold.sh lint
./scripts/scaffold.sh ingest
```

When a topic slug is provided, `create` also generates starter documents for `raw-input/`, `requirements/`, and `tech-spec/`.

## Self-Bootstrapping Pattern

The scaffold should use its own workflow to maintain itself.

That means scaffold changes can be represented through the same phase documents used by product workspaces:

```text
raw-input -> discovery -> context -> requirements -> tech-spec -> implementation -> review
```

The full path is useful when the scaffold change is broad or educational. Smaller maintenance tasks can still use standalone phases or direct implementation when appropriate.

## Wiki Ingest Rule

When scaffold work creates stable reusable knowledge, run an ingest step:

1. Identify the durable conclusion from `workspaces/scaffold/`.
2. Add or update the relevant wiki page under a topic directory.
3. Update `wiki/index.md`.
4. Append `wiki/log.md`.

If a maintenance change affects how agents should behave, update `WIKI-SCHEMA.md` or `AGENT-RULES.md` as appropriate. Do not rely on wiki pages alone for hard operating rules.

## Current Durable Conclusions

- The wiki should use topic directories instead of a single flat namespace.
- `scaffold` is the persistent workspace for evolving the scaffold.
- `scripts/scaffold.sh` is the primary scaffold CLI entry point.
- `create` accepts an optional first topic slug to avoid generic phase document names.
- Scaffold changes should be self-bootstrapped through workspace documents when useful.
- Durable conclusions from scaffold work should be ingested into the wiki.
