# Scaffold CLI Implementation

**Status:** Complete
**Owner:** AI agent
**Updated:** 2026-05-05

## Requirements

- ../requirements/scaffold-cli.md

## Task Status

| Task | Status | Owner | Notes |
|------|--------|-------|-------|
| Consolidate CLI entry point | Complete | AI agent | `scripts/scaffold.sh` owns create, lint, and ingest |
| Split CLI internals | Complete | AI agent | Subcommand logic lives in `scripts/lib/*.sh` |
| Limit command surface | Complete | AI agent | Only local scaffold operations are exposed |
| Extract root README template | Complete | AI agent | `templates/workspace-root.md` drives workspace README generation |
| Update documentation | Complete | AI agent | Docs now prefer `./scripts/scaffold.sh ...` |

## Changed Files

| Area | Files | Reason |
|------|-------|--------|
| CLI | `scripts/scaffold.sh`, `scripts/lib/*.sh` | Single command with split implementation modules |
| Templates | `templates/workspace-root.md`, `templates/workspace/README.md` | Remove duplicated root README template |
| Docs | README, guides, wiki, scaffold workspace docs | Align user-facing commands |

## Verification Evidence

- `bash -n scripts/scaffold.sh`
- `./scripts/scaffold.sh lint`
- `./scripts/scaffold.sh ingest`
- `./scripts/scaffold.sh create request` fails as expected for a generic name.
- Temporary-directory `create user-management` generated the expected workspace files.
