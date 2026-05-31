---
title: HTML Deck Workflow
source: workspaces/ppt/tech-spec/ai-first-to-ai-100-talk.md; repos/ppt/*
see-also: [ai-first-development.md, project-memory.md]
created: 2026-05-28
updated: 2026-05-28
tags: [presentations, html, reveal-js, ai-first]
---

# HTML Deck Workflow

HTML slide decks are useful when a presentation needs version control, local assets, animation, responsive layout, and fast iteration with AI.

The `ppt` workspace validated an HTML deck workflow using a Reveal.js-based artifact in `repos/ppt/`, with planning and review state kept in `workspaces/ppt/`.

## Recommended Structure

```text
repos/<deck-name>/
├── README.md
├── index.html
├── index.md
├── assets/
└── vendor/
```

Use:

- `index.html` for the runnable slide deck.
- `index.md` for the independent speaker script.
- `assets/` for images and media used by the deck.
- `vendor/` for local dependencies when offline playback matters.

Do not put the final runnable deck under `workspaces/`. Workspaces hold planning and lifecycle documents. `repos/` holds implementation artifacts.

## Planning Flow

Use the normal AI-first lifecycle:

```text
raw-input -> discovery -> context -> requirements -> tech-spec -> implementation -> review
```

For presentation work, each phase has a concrete role:

| Phase | Deck Meaning |
|-------|--------------|
| `raw-input` | Rough speech, notes, prompt, transcript, screenshots |
| `discovery` | Theme, audience, narrative options, risks, open questions |
| `context` | Speaker style, terminology fixes, examples, constraints |
| `requirements` | Duration, audience, deliverables, tone, assets, acceptance criteria |
| `tech-spec` | Format, file placement, deck framework, local dependency strategy |
| `implementation` | Outline, script, deck creation, deviations from plan |
| `review` | Slide count, script alignment, visual checks, local playback, final decision |

## Speaker Script Rule

Keep speaker script independent from slide notes when the script itself is a deliverable.

Prefer:

```text
repos/<deck-name>/index.md
```

Avoid hiding the main script inside HTML speaker notes. Speaker notes are useful for presenter mode, but they are harder to review, diff, and reuse as a standalone artifact.

## Asset Rule

Use real assets when they make the story more credible.

For screenshots or personal materials:

- confirm whether redaction is required
- store approved assets under `assets/`
- reference them with local paths
- avoid CDN-only dependencies if the deck must work offline

## Visual Rule

For talk decks, keep high-detail explanation in the script and keep slides simple enough to read from the audience's seat.

A useful default is:

```text
one slide = one main title + one supporting subtitle
```

Use more expressive pages only for deliberate memory points, transitions, or visual proof.

## Review Checklist

Before delivery:

- The deck opens locally.
- Slide count matches the accepted version.
- The speaker script covers the intended duration.
- The HTML contains no unintended speaker notes when notes are not part of the deliverable.
- Local assets render.
- Local vendor dependencies load without network access.
- Important visual effects do not obscure text.
- Workspace docs and actual artifacts agree on final state.
