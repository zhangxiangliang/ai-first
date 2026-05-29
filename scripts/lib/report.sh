# Read the first `**Status:**` value from a workspace document.
# Returns "(unset)" when the line still holds the template menu.
extract_status() {
  local raw=""
  raw="$(grep -m1 -E '^\*\*Status:\*\*' "$1" 2>/dev/null || true)"
  raw="${raw#\*\*Status:\*\* }"
  raw="${raw#\*\*Status:\*\*}"
  case "$raw" in
    ""|*"|"*)
      printf '(unset)'
      ;;
    *)
      printf '%s' "$raw"
      ;;
  esac
}

# Compute whole-day age between an epoch and now. Prints "" when input empty.
age_in_days() {
  local epoch="$1"
  local now=""
  [ -n "$epoch" ] || return 0
  now="$(date +%s)"
  printf '%s' "$(( (now - epoch) / 86400 ))"
}

report_status() {
  if [ "${1:-}" != "" ]; then
    printf 'Usage: %s status\n' "$0" >&2
    exit 1
  fi

  local rows=""
  local doc=""
  local rel=""
  local workspace=""
  local phase=""
  local base=""
  local topic=""
  local status=""
  local updated=""
  local epoch=""
  local age=""
  local found=0

  while IFS= read -r doc; do
    [ -f "$doc" ] || continue
    base="$(basename "$doc")"
    [ "$base" = "README.md" ] && continue

    rel="${doc#"$SCAFFOLD_ROOT/workspaces/"}"
    workspace="${rel%%/*}"
    rel="${rel#"$workspace/"}"
    phase="${rel%%/*}"
    topic="${base%.*}"

    is_known_phase "$phase" || continue

    status="$(extract_status "$doc")"
    updated="$(extract_updated_date "$doc")"
    if [ -n "$updated" ]; then
      epoch="$(date_to_epoch "$updated")"
      age="$(age_in_days "$epoch")"
      [ -n "$age" ] && age="${age}d" || age="?"
    else
      updated="(unset)"
      age="-"
    fi

    found=1
    rows="$rows$workspace	$(phase_position "$phase")	$phase	$topic	$status	$updated	$age
"
  done < <(find "$SCAFFOLD_ROOT/workspaces" -type f -name '*.md' | sort)

  if [ "$found" -eq 0 ]; then
    printf 'No workspace topic documents found.\n'
    return 0
  fi

  {
    printf 'WORKSPACE\tPHASE\tTOPIC\tSTATUS\tUPDATED\tAGE\n'
    printf '%s' "$rows" | sort -t '	' -k1,1 -k2,2n | cut -f1,3-
  } | column -t -s '	'
}

report_stale() {
  local threshold="${1:-30}"

  if [ "${2:-}" != "" ]; then
    printf 'Usage: %s stale [days]\n' "$0" >&2
    exit 1
  fi

  case "$threshold" in
    ''|*[!0-9]*)
      printf 'Stale threshold must be a positive integer number of days.\n' >&2
      exit 1
      ;;
  esac

  local rows=""
  local doc=""
  local rel=""
  local updated=""
  local epoch=""
  local age=""
  local found=0

  while IFS= read -r doc; do
    [ -f "$doc" ] || continue
    case "$(basename "$doc")" in
      README.md|index.md|log.md|ingest-queue.md) continue ;;
    esac

    updated="$(extract_updated_date "$doc")"
    [ -n "$updated" ] || continue
    epoch="$(date_to_epoch "$updated")"
    [ -n "$epoch" ] || continue
    age="$(age_in_days "$epoch")"
    [ -n "$age" ] || continue

    if [ "$age" -gt "$threshold" ]; then
      rel="${doc#"$SCAFFOLD_ROOT/"}"
      found=1
      rows="$rows$age	$rel	$updated
"
    fi
  done < <(
    find "$SCAFFOLD_ROOT/workspaces" "$SCAFFOLD_ROOT/wiki" \
      -type f -name '*.md' 2>/dev/null | sort
  )

  if [ "$found" -eq 0 ]; then
    printf 'No documents older than %s day(s).\n' "$threshold"
    return 0
  fi

  printf 'Documents not updated in over %s day(s):\n\n' "$threshold"
  {
    printf 'AGE\tDOCUMENT\tUPDATED\n'
    printf '%s' "$rows" | sort -t '	' -k1,1nr | awk -F '	' 'BEGIN{OFS="\t"}{print $1"d", $2, $3}'
  } | column -t -s '	'
}
