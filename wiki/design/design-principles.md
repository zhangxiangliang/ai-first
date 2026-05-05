---
title: Design Principles
source: workspaces/foundation/raw-input/claude-artifacts-design-prompt.md
created: 2026-04-17
updated: 2026-04-17
tags: [design, principles, ui, foundation]
---

# Design Principles

> Extracted from Claude Artifacts design system prompt. Adapted as general design guidelines for the current project.

## Core Philosophy

- **Never design from scratch** — always start from existing design context (UI kit, brand spec, codebase components). Designing without context leads to poor results.
- **Ask before building** — gather requirements thoroughly before producing anything. Understand output format, fidelity, constraints, and design systems in play.
- **Explore variations** — provide 3+ options across multiple dimensions (visual, interaction, color, layout). Mix conservative patterns with novel approaches. The goal is to give enough atomic variations for mix-and-match, not one "perfect" answer.

## Anti-AI-Slop Checklist

Avoid these common AI-generated design tropes:

- Aggressive gradient backgrounds
- Emoji usage (unless explicitly part of the brand)
- Containers with rounded corners + left-border accent color
- SVG-drawn imagery (use placeholders instead, ask for real materials)
- Overused font families: Inter, Roboto, Arial, Fraunces, system fonts

## Content Guidelines

- **No filler content** — every element must earn its place. Empty space is a design problem to solve with layout, not by inventing content.
- **Ask before adding** — if additional sections or content might help, ask first. The user knows their audience better.
- **Create a system up front** — define layout patterns, color usage, and type hierarchy before building. Use the system to create intentional visual variety and rhythm.

## Technical Constraints

- Minimum text sizes: 24px for 1920×1080 slides, 12pt for print, 44px touch targets for mobile
- Color: use brand/design system colors. If too restrictive, use oklch for harmonious extensions. Never invent from scratch.
- CSS best practices: `text-wrap: pretty`, CSS Grid, advanced CSS effects encouraged
- Files: avoid single files >1000 lines; split into smaller components

## Design Process

1. Understand needs (ask questions)
2. Explore resources (read design system, collect components)
3. State assumptions and reasoning (think like a junior designer reporting to a manager)
4. Build with placeholders first, show early
5. Iterate based on feedback
6. Verify output quality

## Variation Strategy

- Start basic, get progressively more creative
- Mix by-the-book designs with novel interactions
- Include options with/without color, with/without iconography
- Explore: scale, fills, texture, visual rhythm, layering, type treatments
- Remix brand assets and visual DNA in interesting ways
- If missing an asset, use a placeholder rather than a bad attempt at the real thing

## Source

- Raw input: `workspaces/foundation/raw-input/claude-artifacts-design-prompt.md`
- Origin: Claude Artifacts (claude.ai/artifacts) system prompt, April 2025
- Note: The original prompt includes platform-specific tooling (React+Babel inline JSX, starter components, verification agents) that is not directly applicable to this project. Only the design principles and methodology are extracted here.
