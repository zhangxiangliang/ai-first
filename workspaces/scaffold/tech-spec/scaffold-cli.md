# Scaffold CLI Tech Spec

**Status:** Approved
**Owner:** AI agent
**Updated:** 2026-05-05

## Phase Scope

**Standalone:** No
**Reason:** Requirements require script and documentation changes.
**Expected Output:** Implementable plan for CLI consolidation.
**Next Phase:** implementation

## Requirement Links

- ../requirements/scaffold-cli.md

## Summary

Consolidate scaffold operations into `scripts/scaffold.sh` and use `templates/workspace-root.md` for generated workspace README files.

## Proposed Approach

- Keep `scripts/scaffold.sh` as the only executable scaffold script.
- Keep subcommand implementations in `scripts/lib/*.sh` so `scripts/scaffold.sh` stays a small dispatcher.
- Implement subcommands: `create`, `lint`, and `ingest`.
- Keep the command surface limited to local scaffold operations; downstream projects can have local files that scaffold automation must not overwrite.
- Generate workspace root README files from `templates/workspace-root.md`.
- Update docs, wiki pages, and scaffold workspace records to use the single command.

## Testing Strategy

### Automated / Command Checks

- [x] `bash -n scripts/scaffold.sh`
- [x] `./scripts/scaffold.sh lint`
- [x] `./scripts/scaffold.sh ingest`
- [x] Temporary-directory create simulation

## Rollback Plan

Restore the previous separate scripts and remove `templates/workspace-root.md` if the single CLI proves too hard to maintain.
