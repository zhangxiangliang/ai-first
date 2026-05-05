#!/usr/bin/env bash
set -euo pipefail

root="$(cd "$(dirname "$0")/.." && pwd)"
status=0

fail() {
  printf 'FAIL: %s\n' "$1" >&2
  status=1
}

warn() {
  printf 'WARN: %s\n' "$1" >&2
}

require_file() {
  [ -f "$root/$1" ] || fail "Missing file: $1"
}

require_dir() {
  [ -d "$root/$1" ] || fail "Missing directory: $1"
}

require_file "LLM-WIKI.md"
require_file "WIKI-SCHEMA.md"
require_file "AGENT-RULES.md"
require_file "AGENTS.md"
require_file "CLAUDE.md"
require_file "README.md"
require_file "wiki/index.md"
require_file "wiki/log.md"
require_file "wiki/ingest-queue.md"
require_dir "templates/workspace"
require_dir "workspaces"
require_dir "repos"

for phase in raw-input discovery context requirements tech-spec implementation review; do
  require_file "templates/workspace/$phase/README.md"
done

for workspace in "$root"/workspaces/*; do
  [ -d "$workspace" ] || continue
  name="$(basename "$workspace")"
  [ -f "$workspace/README.md" ] || fail "Workspace missing README: workspaces/$name"

  for phase_dir in "$workspace"/*; do
    [ -d "$phase_dir" ] || continue
    phase="$(basename "$phase_dir")"
    case "$phase" in
      raw-input|discovery|context|requirements|tech-spec|implementation|review)
        [ -f "$phase_dir/README.md" ] || fail "Phase missing README: workspaces/$name/$phase"
        ;;
      *)
        warn "Non-standard workspace directory: workspaces/$name/$phase"
        ;;
    esac
  done
done

while IFS= read -r page; do
  [ -f "$page" ] || continue
  rel="${page#"$root/wiki/"}"
  case "$rel" in
    index.md|log.md)
      continue
      ;;
  esac
  if ! grep -Fq "$rel" "$root/wiki/index.md"; then
    fail "Wiki page not listed in wiki/index.md: wiki/$rel"
  fi
done < <(find "$root/wiki" -type f -name '*.md' | sort)

if grep -Fq -- '- [ ] `' "$root/wiki/ingest-queue.md"; then
  warn "wiki/ingest-queue.md contains pending wiki promotion candidates"
fi

diff_check_output="$(git -C "$root" diff --check || true)"
if [ "$diff_check_output" != "" ]; then
  printf '%s\n' "$diff_check_output" >&2
  fail "git diff --check reported whitespace or conflict-marker issues"
fi

if [ "$status" -eq 0 ]; then
  printf 'Scaffold lint passed.\n'
fi

exit "$status"
