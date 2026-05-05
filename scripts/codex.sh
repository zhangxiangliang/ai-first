#!/usr/bin/env bash
set -euo pipefail

root="$(cd "$(dirname "$0")/.." && pwd)"

command -v codex >/dev/null 2>&1 || {
  printf 'Missing codex CLI. Install Codex CLI and try again.\n' >&2
  exit 1
}

exec codex -C "$root" \
  --sandbox danger-full-access \
  --ask-for-approval never "$@"
