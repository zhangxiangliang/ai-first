# Scaffold Lint Context

**Status:** Approved
**Owner:** AI agent
**Updated:** 2026-05-05

## Phase Scope

**Standalone:** No
**Reason:** Context explains the repository background needed for the example implementation.
**Expected Output:** Shared understanding of what the lint script should inspect.
**Next Phase:** requirements

## Summary

The project scaffold uses `LLM-WIKI.md` as the upstream idea, `WIKI-SCHEMA.md` as the local lifecycle schema, `AGENT-RULES.md` as hard operating rules, `templates/` as reusable workspace structure, and `wiki/` as durable knowledge.

## Confirmed Facts

- Workspace phases are flexible and may be used independently.
- Every created workspace phase directory should contain a `README.md`.
- Stable wiki pages should be listed in `wiki/index.md`.
- Shell scripts live under `scripts/`.

## Related Wiki Pages

| Wiki Page | Relevance |
|-----------|-----------|
| ../../wiki/workflow/ai-first-development.md | Defines lifecycle flexibility |
| ../../wiki/workflow/llm-wiki-operations.md | Describes lint as a wiki maintenance operation |

## Knowledge Gaps

- [x] None for this example.
