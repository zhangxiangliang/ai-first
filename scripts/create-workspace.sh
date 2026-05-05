#!/usr/bin/env bash
set -euo pipefail

usage() {
  printf 'Usage: %s <workspace-name>\n' "$0"
  printf 'Example: %s admin\n' "$0"
}

if [ "${1:-}" = "" ]; then
  usage
  exit 1
fi

name="$1"

case "$name" in
  *[!a-z0-9-]* | -* | *-)
    printf 'Workspace name must be kebab-case: lowercase letters, numbers, and hyphens only.\n' >&2
    exit 1
    ;;
esac

root="$(cd "$(dirname "$0")/.." && pwd)"
target="$root/workspaces/$name"
template="$root/templates/workspace"

if [ -e "$target" ]; then
  printf 'Workspace already exists: %s\n' "$target" >&2
  exit 1
fi

mkdir -p "$target"
cp -R "$template/." "$target/"

title="$(printf '%s' "$name" | awk -F- '{ for (i=1; i<=NF; i++) { $i=toupper(substr($i,1,1)) substr($i,2) } print }' OFS=' ')"
prefix="$(printf '%s' "$name" | tr '[:lower:]-' '[:upper:]_')"
today="$(date +%F)"

cat > "$target/README.md" <<EOF
# $title

Short description of the module, feature, or project.

**Status:** Draft
**Owner:** <person or agent>
**Updated:** $today

## Goal

[One clear sentence describing the desired outcome.]

## Scope

### In Scope

- [What this workspace covers]

### Out of Scope

- [What this workspace intentionally excludes]

## Current Phase

[raw-input | discovery | context | requirements | tech-spec | implementation | review]

## Phase Mode

**Mode:** Full Lifecycle | Standalone Phase | Phase Subset
**Reason:** <why this workspace uses this amount of process>

## Handoff

### Current State

[Where the work currently stands.]

### Confirmed

- [Confirmed fact or decision]

### Unknown

- [Missing information or unresolved question]

### Next Best Action

[The next action a human or AI should take.]

### Read First

- [Most important file to read first]

## Key Documents

- [raw-input/](raw-input/)
- [discovery/](discovery/)
- [context/](context/)
- [requirements/](requirements/)
- [tech-spec/](tech-spec/)
- [implementation/](implementation/)
- [review/](review/)

## Related Workspaces

| Workspace | Relationship |
|-----------|--------------|
| | |

## Related Wiki Pages

| Page | Why It Matters |
|------|----------------|
| | |

## Implementation Repositories

| Repository | Role |
|------------|------|
| | |

## Decisions

| Date | Decision | Reason |
|------|----------|--------|
| | | |

## Knowledge Gaps

- [ ] [Missing information]

## ID Prefix

Use \`$prefix-REQ-001\` and \`$prefix-TICKET-001\` IDs for requirements and tickets.

## Open Questions

- [ ] [Question]

## Next Step

[The immediate next action.]
EOF

printf 'Created workspace: %s\n' "$target"
printf 'Next step: update %s/README.md and add original sources to raw-input/.\n' "$target"
