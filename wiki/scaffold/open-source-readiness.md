---
title: Open Source Readiness
source: workspaces/scaffold-maintenance/
see-also: [scaffold-maintenance.md, scaffold-health-checks.md]
created: 2026-05-05
updated: 2026-05-05
tags: [scaffold, open-source, maintenance]
---

# Open Source Readiness

Open source readiness for this scaffold means the repository is understandable, reusable, and safe to publish.

## Required Public Files

- `README.md`
- `LICENSE`
- `CONTRIBUTING.md`
- `SECURITY.md`

GitHub issue and pull request templates can be added later if contribution volume grows. They are intentionally not part of the minimal open source baseline.
A changelog can be added later if releases become formal. It is intentionally not part of the minimal open source baseline.

## Release Checklist

- README clearly explains the project purpose and quick start.
- License is present.
- Contribution and security expectations are documented.
- No secrets, credentials, or private customer material are committed.
- Scaffold lint passes.
- Wiki ingest queue is current.
- English and Chinese Markdown onboarding guides are linked from README.

## Naming

Recommended public repository name:

```text
ai-workspace-scaffold
```

This name is more specific than `project-scaffold` and better reflects the project goal: AI-first workspace and wiki-driven development.
