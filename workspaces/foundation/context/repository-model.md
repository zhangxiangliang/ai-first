# Repository Model

This document describes the role of each top-level layer in this coordination repository.

## Coordination Repository

This repository is the coordination layer for planning, reusable knowledge, and implementation repository references.

It is not the main place where product code lives.

## Layer Model

### `wiki/`

Purpose:

- persistent reusable knowledge
- synthesized conclusions worth keeping across projects
- reference material that should be read before re-reading raw source

Use `wiki/` for stable knowledge, not for temporary planning notes.

### `workspaces/`

Purpose:

- active project planning
- project-specific requirements, context, research, design, tech specs, implementation plans, and review artifacts

Use `workspaces/` for active delivery work and project-local documents.

### `repos/`

Purpose:

- implementation repositories
- actual codebases with their own git history

Use `repos/` when writing, reviewing, committing, or shipping implementation code.

## Git Boundaries

- this coordination repository has its own git history
- each repository under `repos/` keeps its own git history
- when a submodule repository advances, this repository records the new pointer separately

## Reading Priority

Read by layer:

1. shared agent rules
2. persistent knowledge in `wiki/`
3. active project material in `workspaces/`
4. implementation code in `repos/`

## Wiki Promotion Candidates

- [x] wiki/conventions/project-conventions.md — The repository separates persistent wiki knowledge, active workspace planning, and implementation repositories.
- [x] wiki/workflow/ai-first-development.md — Workspaces own active delivery state while wiki owns stable reusable knowledge.
