# Wiki Log

> Chronological record of wiki operations.

## [2026-05-05] docs | Added LLM Wiki attribution

- Added original gist attribution to `LLM-WIKI.md`
- Updated public README references to note the upstream source

## [2026-05-05] docs | Added Chinese public docs

- Added `README.zh-CN.md`
- Added `docs/ai-first-guide.zh-CN.md`
- Linked English and Chinese documentation together

## [2026-05-05] docs | Added open source readiness docs

- Reworked README for public usage as AI Workspace Scaffold
- Added license, contribution, and security docs
- Kept GitHub issue and PR templates out of the minimal open source baseline
- Added `docs/ai-first-guide.md` onboarding guide
- Added `scaffold/open-source-readiness.md`

## [2026-05-05] ingest | Added lightweight workflow usability rules

- Added workspace handoff guidance to `workflow/ai-first-development.md`
- Added workspace-scoped requirement and ticket ID guidance
- Recorded that workflow depth should be chosen through the smallest useful path

## [2026-05-05] ingest | Added scaffold health checks

- Added `scaffold/scaffold-health-checks.md` from scaffold maintenance documents
- Recorded that scaffold linting is a structural guard, not a content-quality guarantee
- Updated wiki index with the new scaffold page

## [2026-05-05] schema | Added self-driven ingest queue

- Added `wiki/ingest-queue.md` as an auto-generated queue for pending wiki promotion candidates
- Added `scripts/update-ingest-queue.sh` to scan visible workspace `Wiki Promotion Candidates` sections
- Updated scaffold lint to require the ingest queue and warn on pending ingest markers
- Documented visible wiki promotion candidate workflow

## [2026-05-05] ingest | Added scaffold maintenance knowledge and wiki directories

- Reorganized wiki pages into topic directories: `workflow/`, `conventions/`, `design/`, and `scaffold/`
- Added `scaffold/scaffold-maintenance.md` from `workspaces/scaffold-maintenance/`
- Updated wiki index for nested page paths
- Recorded that durable scaffold maintenance conclusions must be ingested into the wiki

## [2026-05-05] schema | Added AI-first LLM Wiki lifecycle

- Added local `WIKI-SCHEMA.md` for applying the LLM Wiki pattern to PRD-driven AI-first development
- Added workspace lifecycle templates under `templates/workspace/`
- Added reusable wiki pages for AI-first development and LLM Wiki operations
- Updated wiki index with the new workflow pages

## [2026-04-24] init | Scaffold initialized

- Initialized reusable coordination repository scaffold
- Created base wiki index and log
- Added shared agent rules and workspace initialization guidance
- Seeded reusable raw-input sources for conventions, git workflow, and design guidance
- Seeded reusable wiki pages for conventions, git workflow, and design principles
