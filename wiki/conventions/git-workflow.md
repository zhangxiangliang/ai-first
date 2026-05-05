---
title: Git Workflow
source: workspaces/foundation/raw-input/git-workflow.md
created: 2026-04-17
updated: 2026-04-17
tags: [git, workflow, conventions]
---

# Git Workflow

## Commit Workflow

- All commits require explicit user approval before execution
- LLM must present the commit message for review first
- Only after user confirms may the commit be executed
- This applies to every commit without exception

## Branch and Push

- Do not push to remote unless explicitly asked
- Do not force-push without explicit approval
- Do not amend published commits without explicit approval

## Database

- No database operations (migration, reset, revert, raw SQL) without explicit user approval
