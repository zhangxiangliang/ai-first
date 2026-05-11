# Project Agent Rules

This repository uses [LLM-WIKI.md](LLM-WIKI.md) as the upstream pattern reference. Keep `LLM-WIKI.md` close to upstream.

[WIKI-SCHEMA.md](WIKI-SCHEMA.md) is the local schema that defines how the LLM Wiki pattern is applied to AI-first PRD-driven development in this repository.

Put hard operating rules here. Put detailed wiki/workspace lifecycle rules in `WIKI-SCHEMA.md`.

## Local Structure

```text
project-root/
├── repos/           # Code repositories, typically linked as git submodules
├── templates/       # Reusable workspace and document templates
├── workspaces/      # Project workspaces with lifecycle documents
└── wiki/            # Persistent knowledge
```

- `workspaces/<project>/` is the planning workspace for that project
- The upstream `raw/` idea is expanded into the phase lifecycle defined by `WIKI-SCHEMA.md`
- `wiki/` stores reusable cross-project knowledge
- `templates/` stores reusable scaffolding for new workspaces and phase documents
- `scripts/scaffold.sh` is the only user-facing command for creating workspaces, creating phase documents, linting, and generating ingest queues
- All persistent files are in English and use kebab-case file names
- Workspace names must be meaningful project, module, feature, or outcome names, not generic placeholders
- For one work item, reuse the same topic slug across workspace phase documents, such as `raw-input/create-user-table.md` and `requirements/create-user-table.md`

## Scaffold Commands

Use `./scripts/scaffold.sh` for scaffold operations instead of hand-copying templates or inventing files.

- Create a workspace with `./scripts/scaffold.sh create <workspace-name> [topic-slug]`
- Create phase documents with `./scripts/scaffold.sh create-doc <workspace-name> <phase|all> <topic-slug>`
- Run structural checks with `./scripts/scaffold.sh lint`
- Generate the wiki ingest queue with `./scripts/scaffold.sh ingest`

Do not call files under `scripts/lib/` directly. They are internal modules sourced by `scripts/scaffold.sh`.

## Reuse Intent

- This architecture is intended to be reusable across multiple projects over time
- Keep shared process language generic unless a rule is truly project-specific
- Put project-specific planning and delivery detail in the relevant workspace, not in shared rules
- Sink only stable, reusable conclusions into `wiki/`

## Wiki Role

Treat `wiki/` primarily as a knowledge base. Use it for research, summaries, product context, technical context, and reusable conclusions.

Do not rely on `wiki/` as the primary source for agent behavior. Hard operating rules belong in this file.

## Source Priority

Use this order when working:

1. This file for agent operating rules
2. `WIKI-SCHEMA.md` for wiki/workspace lifecycle rules
3. `scripts/README.md` for scaffold commands and operational entry points
4. Relevant knowledge pages in `wiki/`
5. Relevant project workspace in `workspaces/`
6. Code in `repos/`

Do not treat "wiki first" as "read every wiki page first".
Use `wiki/` for persistent knowledge, then consult the relevant workspace for current-project context, plans, and source material.

## Hard Rules

- Use `./scripts/scaffold.sh` for scaffold-supported workspace and phase document creation before creating those files manually
- Before any commit, propose the commit message and wait for user approval
- Follow Conventional Commits when committing
- Commit messages must be in English, concise, and without Chinese
- Do not amend, rewrite, or undo commits unless the user explicitly approves it
- Treat `wiki/` as guidance for understanding; do not promote wiki pages into hard rules unless this file is updated

## Repository Boundaries

- This repository manages knowledge, workspace documents, and shared agent rules
- When this scaffold is cloned for a new project, verify `git remote get-url origin` points to the user's project repository before committing or pushing project-specific changes
- If `origin` still points to the scaffold source repository, ask the user for the correct project repository URL before pushing
- Repositories under `repos/` are implementation targets and keep their own independent git history
- Prefer linking implementation repositories under `repos/` as git submodules
- When implementation work from `workspaces/` is applied to a repository under `repos/`, review and commit the code changes inside that target repository
- When a submodule moves to a new commit, commit the submodule pointer update in this repository
- Only commit in this repository when changing the knowledge system, workspace documents, shared agent instructions, or submodule pointers

## Submodule Workflow

- Add implementation repositories with `git submodule add <repo-url> repos/<repo-name>`
- Prefer portable submodule URLs in `.gitmodules`, such as relative URLs when repos share the same remote owner
- Clone this repository with submodules using `git clone --recurse-submodules <repo-url>`
- If already cloned, initialize submodules with `git submodule update --init --recursive`
- Commit code changes inside the target repository under `repos/`
- Then return to this repository and commit the updated submodule pointer when the parent should reference the new implementation commit

## Operating Rules

- Prefer updating shared local rules in `AGENT-RULES.md`; keep upstream ideas in `LLM-WIKI.md`
