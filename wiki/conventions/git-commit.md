---
title: Git Commit
source: workspaces/foundation/raw-input/git-commit.md
reference: https://www.conventionalcommits.org/en/v1.0.0/
created: 2026-04-16
updated: 2026-04-16
tags: [git, conventions, commits]
---

# Conventional Commits

Reference: https://www.conventionalcommits.org/en/v1.0.0/

## Format

```
<type>[optional scope]: <description>

[optional body]

[optional footer(s)]
```

## Types

| Type | Purpose | SemVer |
|------|---------|--------|
| feat | New functionality | MINOR |
| fix | Bug fix | PATCH |
| docs | Documentation only | — |
| style | Formatting, no logic change | — |
| refactor | Restructuring, no feat/fix | — |
| perf | Performance improvement | — |
| test | Adding or updating tests | — |
| chore | Maintenance, deps, tooling | — |
| ci | CI/CD configuration | — |
| build | Build system changes | — |
| revert | Reverting a previous commit | — |

## Breaking Changes

Indicated via `!` after type/scope or as `BREAKING CHANGE:` footer. Correlates to MAJOR in SemVer.

## Examples

```
feat: allow config object to extend other configs
fix(parser): handle nested arrays correctly
docs: correct spelling of CHANGELOG
feat(lang): add Polish language
feat!: send email when product is shipped
chore(deps): upgrade Next.js to 15.x
```
