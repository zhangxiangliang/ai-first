---
title: HTML Deck Workflow
source: workspaces/ppt/tech-spec/ai-first-to-ai-100-talk.md; workspaces/ppt/tech-spec/export-html-deck-to-pdf.md; repos/ppt/*
see-also: [ai-first-development.md, project-memory.md]
created: 2026-05-28
updated: 2026-05-31
tags: [presentations, html, reveal-js, ai-first, pdf-export]
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
├── exports/
└── vendor/
```

Use:

- `index.html` for the runnable slide deck.
- `index.md` for the independent speaker script.
- `assets/` for images and media used by the deck.
- `exports/` for static shareable artifacts, such as PDF.
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

## PDF Export Rule

When the source deck is HTML and visual fidelity matters more than editability, prefer a screenshot-based PDF export:

```text
HTML deck
  -> local HTTP server
  -> browser render each slide
  -> screenshot each 16:9 slide
  -> assemble screenshots into PDF
```

This keeps the PDF close to the real on-stage view. It is especially useful when the deck has custom CSS, animations, local images, or browser-specific layout.

Use the PDF as a static backup and distribution file. Keep the HTML deck as the source of truth because PDF export does not preserve animation, click-to-zoom behavior, presenter controls, or other browser interactions.

Before capturing screenshots:

- hide Reveal.js controls and progress UI
- hide custom fullscreen buttons or presentation-only controls
- wait for local assets and fonts to render
- use a stable 16:9 viewport
- verify the screenshot count matches the Reveal slide count

Store final PDFs under:

```text
repos/<deck-name>/exports/
```

Temporary screenshots, contact sheets, and other QA artifacts can live under `outputs/` unless they are part of the final deliverable.

## Review Checklist

Before delivery:

- The deck opens locally.
- Slide count matches the accepted version.
- The speaker script covers the intended duration.
- The HTML contains no unintended speaker notes when notes are not part of the deliverable.
- Local assets render.
- Local vendor dependencies load without network access.
- Important visual effects do not obscure text.
- Static PDF export exists when a shareable file is needed.
- PDF page count matches the HTML slide count.
- PDF pages keep the expected 16:9 ratio.
- Exported PDF does not include presentation controls.
- A contact sheet or equivalent visual overview has been reviewed.
- Workspace docs and actual artifacts agree on final state.
