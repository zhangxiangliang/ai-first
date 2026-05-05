#!/usr/bin/env bash
set -euo pipefail

SCAFFOLD_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
SCAFFOLD_LIB="$SCAFFOLD_ROOT/scripts/lib"

. "$SCAFFOLD_LIB/common.sh"
. "$SCAFFOLD_LIB/create.sh"
. "$SCAFFOLD_LIB/lint.sh"
. "$SCAFFOLD_LIB/ingest.sh"

usage() {
  printf 'Usage:\n'
  printf '  %s create <workspace-name>\n' "$0"
  printf '  %s lint\n' "$0"
  printf '  %s ingest\n' "$0"
  printf '\n'
  printf 'Examples:\n'
  printf '  %s create user-management\n' "$0"
  printf '  %s lint\n' "$0"
  printf '  %s ingest\n' "$0"
}

command="${1:-}"
case "$command" in
  create)
    shift
    create_workspace "$@"
    ;;
  lint)
    shift
    lint_scaffold "$@"
    ;;
  ingest)
    shift
    update_ingest_queue "$@"
    ;;
  -h|--help|"")
    usage
    ;;
  *)
    printf 'Unknown command.\n' >&2
    usage >&2
    exit 1
    ;;
esac
