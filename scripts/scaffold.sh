#!/usr/bin/env bash
set -euo pipefail

usage() {
  printf 'Usage:\n'
  printf '  %s update --source <latest-scaffold-path> [--dry-run] [--force]\n' "$0"
  printf '\n'
  printf 'Examples:\n'
  printf '  %s update --source ../project-scaffold-latest\n' "$0"
  printf '  %s update --source ../project-scaffold-latest --dry-run\n' "$0"
}

target_root="$(cd "$(dirname "$0")/.." && pwd)"

copy_file() {
  local src="$1"
  local dest="$2"
  mkdir -p "$(dirname "$dest")"
  cp -p "$src" "$dest"
}

same_file() {
  cmp -s "$1" "$2"
}

is_managed_path() {
  case "$1" in
    AGENTS.md|CLAUDE.md|AGENT-RULES.md|LLM-WIKI.md|WIKI-SCHEMA.md|README.md|README.zh-CN.md|CONTRIBUTING.md|SECURITY.md)
      return 0
      ;;
    docs/*|scripts/*|templates/*|repos/README.md|repos/submodule-guide.md|workspaces/README.md)
      return 0
      ;;
    wiki/conventions/*|wiki/design/*|wiki/scaffold/*|wiki/workflow/*)
      return 0
      ;;
    wiki/index.md|wiki/ingest-queue.md)
      return 0
      ;;
    *)
      return 1
      ;;
  esac
}

is_excluded_path() {
  case "$1" in
    .git/*|.scaffold-updates/*|workspaces/foundation/*|workspaces/scaffold-maintenance/*|repos/*/.git/*)
      return 0
      ;;
    *)
      return 1
      ;;
  esac
}

relative_managed_files() {
  source_root="$1"
  find "$source_root" -type f | while IFS= read -r src; do
    rel="${src#"$source_root"/}"
    if is_excluded_path "$rel"; then
      continue
    fi
    if is_managed_path "$rel"; then
      printf '%s\n' "$rel"
    fi
  done | sort
}

update_scaffold() {
  source_root=""
  dry_run=0
  force=0

  while [ "$#" -gt 0 ]; do
    case "$1" in
      --source)
        source_root="${2:-}"
        shift 2
        ;;
      --dry-run)
        dry_run=1
        shift
        ;;
      --force)
        force=1
        shift
        ;;
      -h|--help)
        usage
        exit 0
        ;;
      *)
        printf 'Unknown update option: %s\n' "$1" >&2
        usage >&2
        exit 1
        ;;
    esac
  done

  if [ "$source_root" = "" ]; then
    printf 'Missing required option: --source <latest-scaffold-path>\n' >&2
    exit 1
  fi

  source_root="$(cd "$source_root" && pwd)"

  if [ "$source_root" = "$target_root" ]; then
    printf 'Source and target are the same directory; nothing to update.\n'
    exit 0
  fi

  if [ ! -f "$source_root/WIKI-SCHEMA.md" ] || [ ! -d "$source_root/templates/workspace" ]; then
    printf 'Source does not look like an AI Workspace Scaffold checkout: %s\n' "$source_root" >&2
    exit 1
  fi

  timestamp="$(date +%Y%m%d-%H%M%S)"
  update_dir="$target_root/.scaffold-updates/$timestamp"
  report="$update_dir/report.md"
  added=0
  updated=0
  conflicts=0
  unchanged=0

  if [ "$dry_run" -eq 0 ]; then
    mkdir -p "$update_dir"
    {
      printf '# Scaffold Update Report\n\n'
      printf '**Source:** %s\n' "$source_root"
      printf '**Target:** %s\n' "$target_root"
      printf '**Generated:** %s\n\n' "$(date +%F)"
    } > "$report"
  fi

  while IFS= read -r rel; do
    src="$source_root/$rel"
    dest="$target_root/$rel"

    if [ ! -e "$dest" ]; then
      if [ "$dry_run" -eq 1 ]; then
        printf 'ADD: %s\n' "$rel"
      else
        copy_file "$src" "$dest"
        printf '%s%s%s\n' '- Added `' "$rel" '`' >> "$report"
      fi
      added=$((added + 1))
      continue
    fi

    if same_file "$src" "$dest"; then
      unchanged=$((unchanged + 1))
      continue
    fi

    if [ "$force" -eq 1 ]; then
      if [ "$dry_run" -eq 1 ]; then
        printf 'UPDATE: %s\n' "$rel"
      else
        copy_file "$src" "$dest"
        printf '%s%s%s\n' '- Updated `' "$rel" '`' >> "$report"
      fi
      updated=$((updated + 1))
      continue
    fi

    if [ "$dry_run" -eq 1 ]; then
      printf 'CONFLICT: %s\n' "$rel"
    else
      candidate="$update_dir/$rel.new"
      copy_file "$src" "$candidate"
      printf '%s%s%s%s%s\n' '- Candidate update for `' "$rel" '`: `.scaffold-updates/' "$timestamp/$rel" '.new`' >> "$report"
    fi
    conflicts=$((conflicts + 1))
  done < <(relative_managed_files "$source_root")

  if [ "$dry_run" -eq 1 ]; then
    return 0
  fi

  {
    printf '\n## Summary\n\n'
    printf '%s\n' "- Added: $added"
    printf '%s\n' "- Updated: $updated"
    printf '%s\n' "- Candidate updates: $conflicts"
    printf '%s\n' "- Unchanged: $unchanged"
  } >> "$report"

  printf 'Scaffold update prepared.\n'
  printf 'Report: %s\n' "$report"
  if [ "$conflicts" -gt 0 ]; then
    printf 'Review candidate updates under: %s\n' "$update_dir"
  fi
}

command="${1:-}"
case "$command" in
  update)
    shift
    update_scaffold "$@"
    ;;
  -h|--help|"")
    usage
    ;;
  *)
    printf 'Unknown command: %s\n' "$command" >&2
    usage >&2
    exit 1
    ;;
esac
