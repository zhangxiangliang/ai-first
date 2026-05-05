# Wiki Log

> Chronological record of wiki operations.

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
