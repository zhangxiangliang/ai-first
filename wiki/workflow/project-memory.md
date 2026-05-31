---
title: Project Memory
source: workspaces/ppt/context/ai-first-to-ai-100-talk.md; workspaces/ppt/review/ai-first-to-ai-100-talk.md
see-also: [ai-first-development.md, llm-wiki-operations.md]
created: 2026-05-28
updated: 2026-05-28
tags: [ai-first, memory, wiki, handoff]
---

# Project Memory

Project memory is the durable layer that lets a human or AI agent recover why a project looks the way it does.

Without project memory, important decisions live in scattered chat windows, private notes, ticket comments, and individual people's heads. When time passes, people leave, or a different AI session starts, the project loses context and has to rediscover the same facts again.

## What To Capture

Capture information that future work will need:

- original source material and provenance
- clarified requirements
- accepted assumptions
- rejected options
- naming and terminology corrections
- constraints and tradeoffs
- implementation deviations
- review evidence
- unresolved risks
- reusable lessons

Do not rewrite raw source material to make it cleaner. Preserve raw input unchanged, then write interpretation in later phases or wiki pages.

## Where Memory Lives

Use this split:

| Layer | Role |
|-------|------|
| `raw-input/` | Original source, unchanged |
| `discovery/` | Ambiguity, questions, early interpretation |
| `context/` | Background needed by future humans and AI |
| `requirements/` | Confirmed needs and acceptance criteria |
| `tech-spec/` | Planned solution and constraints |
| `implementation/` | Execution notes, changed artifacts, deviations |
| `review/` | Verification and final decision |
| `wiki/` | Stable knowledge reusable across projects |

Active project state belongs in the workspace. Reusable conclusions belong in the wiki.

## AI Collaboration Rule

Every important AI collaboration should leave recoverable traces outside the chat when the work matters.

Useful traces include:

- what the user originally asked for
- what the AI inferred
- what the user corrected
- what was approved before execution
- what changed during execution
- what was verified at the end

This lets another person, another AI session, or the same user later ask: "Why did we do this?" and get an answer from the project itself.

## Practical Checklist

Before considering a workflow complete:

- The workspace README says the current state and next best action.
- Requirements are traceable to raw input or confirmed conversation.
- Tech spec decisions match the artifact that was actually built.
- Implementation notes record meaningful deviations.
- Review evidence maps back to acceptance criteria.
- Durable lessons are either promoted to the wiki or left as visible wiki promotion candidates.
