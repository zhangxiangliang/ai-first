#!/usr/bin/env bash
set -euo pipefail

root="$(cd "$(dirname "$0")/.." && pwd)"

cd "$root"

command -v claude >/dev/null 2>&1 || {
  printf 'Missing claude CLI. Install Claude Code and try again.\n' >&2
  exit 1
}

exec claude --dangerously-skip-permissions "$@"
