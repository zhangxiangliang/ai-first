# Project Initialization

This document describes how new project work should be introduced inside this repository structure.

## Why This Is In Context

This file is not raw source material from outside the repository.

It is a distilled description of how this repository currently works, so it belongs in `context/` rather than `raw-input/`.

Hard rules still belong in `AGENT-RULES.md`.

## Repository Role

This repository is a long-lived coordination layer.

It is not treated as a disposable starter template that should be renamed for each new engagement.

The reusable part of this repository is the operating architecture:

- shared agent rules
- workspace lifecycle structure
- wiki knowledge sink pattern
- implementation repo boundary model

See also:

- [repository-model.md](repository-model.md)
- [workspace-readme-template.md](workspace-readme-template.md)
- [submodule-guide.md](../../../repos/submodule-guide.md)

## How New Projects Start

New project work starts by adding a new workspace under `workspaces/`.

Recommended structure:

- `raw-input/`
- `requirements/`
- `context/`
- `discovery/`
- `design/`
- `tech-spec/`
- `implementation/`
- `review/`

Each project workspace should include a `README.md` that explains:

- project scope
- current status
- planning boundary

Prefer keeping the shared structure stable and expressing project differences through new workspace content rather than by rewriting the shared operating files.

## Implementation Repositories

Implementation code belongs under `repos/`.

Rules:

- each repo keeps its own git history
- each repo should be listed in `repos/README.md`
- each repo should usually be linked as a git submodule for team portability
- planning decisions stay in `workspaces/` until code work is explicitly approved

### Adding An Implementation Repository

When a project needs an implementation repository:

1. Create or choose the implementation repository
2. Add it under `repos/` as a git submodule
3. Prefer a portable `.gitmodules` URL, such as a relative URL when repositories share the same remote owner
4. Add the repository to `repos/README.md`
5. Commit the `.gitmodules`, `repos/README.md`, and submodule pointer changes in this coordination repository

Example:

```bash
git submodule add ../example-frontend.git repos/example-frontend
git submodule update --init --recursive
```

For day-to-day implementation work, commit code inside the submodule repository first. Then commit the parent repository's submodule pointer update when the coordination repository should reference that new implementation commit.

## Shared Knowledge

Reusable conclusions should move into `wiki/`.

Keep these boundaries clear:

- active planning in `workspaces/`
- persistent reusable knowledge in `wiki/`
- implementation code in `repos/`

## New Project Checklist

When starting a new project inside this repository:

1. Create `workspaces/<project-name>/`
2. Add the standard phase directories
3. Write the workspace `README.md`
4. Add or link the implementation repo under `repos/` if needed
5. Update `repos/README.md` when adding an implementation repo
6. Remove any copied project-specific residue from planning docs
7. Sink reusable conclusions into `wiki/` only when they are stable

## Reuse Guardrails

When adapting this repository for another project:

- keep `AGENT-RULES.md` generic unless the rule truly belongs to every project using this architecture
- keep `foundation/` focused on repository-wide conventions and initialization guidance
- keep project-specific domain knowledge in its own workspace and only move broadly reusable knowledge into `wiki/`

## Wiki Promotion Candidates

- [x] wiki/scaffold/scaffold-maintenance.md — Scaffold-level reusable conclusions should be maintained through a persistent scaffold workspace.
- [x] wiki/workflow/ai-first-development.md — New project work should start in a workspace and use only the lifecycle phases needed for the task.
- [x] wiki/conventions/project-conventions.md — Stable repository conventions and reusable operating guidance belong in wiki after they are confirmed.
