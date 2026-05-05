---
title: Project Conventions
source: workspaces/foundation/raw-input/conventions.md
see-also: [git-commit.md, git-workflow.md, ../workflow/ai-first-development.md]
created: 2026-04-16
updated: 2026-04-16
tags: [conventions, standards, foundation]
---

# Project Conventions

## Language

- All persistent files (docs, wiki, workspace content): **English**
- Git commit messages: **English**
- File names: **kebab-case**

## Git

- Follow [Conventional Commits v1.0.0](https://www.conventionalcommits.org/en/v1.0.0/) — format: `<type>(<scope>): <description>`
- Types: `feat`, `fix`, `docs`, `style`, `refactor`, `perf`, `test`, `chore`, `ci`, `build`, `revert`
- No Co-Authored-By or Claude-related info in commit messages
- Commit messages should be concise and describe the "why"
- See [Git Workflow](git-workflow.md) for commit approval process and operational rules

## Documentation

- All markdown files in English
- Wiki is auto-maintained by LLM — humans work in workspaces, knowledge sinks to wiki
- Wiki pages are organized by topic directories to avoid an unreadable flat namespace
- Lookup order: wiki → workspace context → code

## Code

- All code repositories live under `repos/`, each with independent git
- All code is AI-produced, operated from root directory
