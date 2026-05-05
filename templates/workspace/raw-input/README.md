# Raw Input

Original materials go here unchanged.

Do not rewrite, summarize, or "clean up" raw source content inside this folder. Put analysis in `discovery/`, background in `context/`, and confirmed product intent in `requirements/`.

## Recommended File Types

- customer-chat-YYYY-MM-DD.md
- bug-ticket-<id>.md
- meeting-notes-YYYY-MM-DD.md
- screenshot-<topic>.png
- external-doc-<topic>.md

For request-driven work, use the same topic slug that later phase documents will use. For example:

```text
raw-input/create-user-table.md
requirements/create-user-table.md
tech-spec/create-user-table.md
implementation/create-user-table.md
```

Do not name raw inputs `request.md`, `notes.md`, or `input.md`.

## Raw Input Wrapper

```md
# <Source Title>

**Source:** <where it came from>
**Date Captured:** YYYY-MM-DD
**Author / Requestor:** <name if known>
**Captured By:** <person or agent>
**Related Workspace:** <workspace-name>

## Original Content

[Paste the original content here without interpretation.]
```
