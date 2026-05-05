# Contributing

Thanks for contributing to AI Workspace Scaffold.

This project is document-first. Changes should preserve clarity, traceability, and ease of use.

## Before You Start

Read:

1. `LLM-WIKI.md`
2. `WIKI-SCHEMA.md`
3. `AGENT-RULES.md`
4. `workspaces/scaffold-maintenance/README.md`

## What Belongs Where

- Hard AI operating rules: `AGENT-RULES.md`
- Local workflow schema: `WIKI-SCHEMA.md`
- Active scaffold changes: `workspaces/scaffold-maintenance/`
- Reusable knowledge: `wiki/`
- Reusable templates: `templates/`
- Utility scripts: `scripts/`

## Development Workflow

1. Create or update a relevant workspace document.
2. Keep raw inputs unchanged.
3. Use the smallest workflow that preserves traceability.
4. Add `Wiki Promotion Candidates` for durable reusable conclusions.
5. Run:

```sh
./scripts/update-ingest-queue.sh
./scripts/lint-scaffold.sh
git diff --check
```

## Commit Messages

Use concise English Conventional Commits:

```text
feat: add workspace handoff
docs: clarify wiki promotion
fix: correct ingest queue parsing
```

Do not use Chinese in commit messages.

## Pull Requests

A useful pull request explains:

- what changed
- why it changed
- which workspace documents were updated, if any
- whether wiki promotion was considered
- verification commands run
