# Canonical workspace lifecycle phases, in lifecycle order.
# This is the single source of truth for the phase vocabulary. Every script
# that validates, orders, lints, or renders phases must derive from this list
# instead of hard-coding its own copy.
SCAFFOLD_PHASES="raw-input discovery context requirements tech-spec implementation worklog review"

# Recognized non-lifecycle workspace directories. Lint accepts these without a
# warning, but the scaffold ships no document template for them, so they cannot
# be created with `create-doc`.
SCAFFOLD_AUX_DIRS="test-cases plan docs"

is_known_phase() {
  case " $SCAFFOLD_PHASES " in
    *" $1 "*) return 0 ;;
    *) return 1 ;;
  esac
}

is_accepted_dir() {
  is_known_phase "$1" && return 0
  case " $SCAFFOLD_AUX_DIRS " in
    *" $1 "*) return 0 ;;
    *) return 1 ;;
  esac
}

# 1-based lifecycle position of a phase; prints 99 for unknown names.
phase_position() {
  local target="$1"
  local index=0
  local phase=""
  for phase in $SCAFFOLD_PHASES; do
    index=$((index + 1))
    if [ "$phase" = "$target" ]; then
      printf '%s' "$index"
      return 0
    fi
  done
  printf '99'
}

# Fold a known directory-name variant onto its canonical name.
# Prints the input unchanged when it is not a recognized variant.
canonical_phase() {
  case "$1" in
    raw-input|raw|raw-inputs|rawinput|inputs|input) printf 'raw-input' ;;
    discovery|discoveries|discover) printf 'discovery' ;;
    context|contexts) printf 'context' ;;
    requirements|requirement|reqs|req) printf 'requirements' ;;
    tech-spec|tech-specs|techspec|tech_spec|spec|specs) printf 'tech-spec' ;;
    implementation|implementations|impl|implement) printf 'implementation' ;;
    worklog|worklogs|work-log|work-logs) printf 'worklog' ;;
    review|reviews) printf 'review' ;;
    test-cases|test-case|testcase|testcases|tests|test) printf 'test-cases' ;;
    plan|plans) printf 'plan' ;;
    docs|doc|documentation) printf 'docs' ;;
    *) printf '%s' "$1" ;;
  esac
}

is_generic_name() {
  case "$1" in
    request|requests|task|tasks|workspace|workspaces|note|notes|input|inputs|draft|document|doc|spec|requirements|implementation|review|misc|temp|tmp)
      return 0
      ;;
    *)
      return 1
      ;;
  esac
}

copy_file() {
  local src="$1"
  local dest="$2"
  mkdir -p "$(dirname "$dest")"
  cp -p "$src" "$dest"
}

# Escape a string so it is safe to use as the replacement side of `sed s///`.
escape_sed_replacement() {
  printf '%s' "$1" | sed -e 's/[&/\]/\\&/g'
}

# Parse a YYYY-MM-DD string into a Unix epoch. Tries BSD date first, then GNU.
# Prints nothing when the input is not a valid date.
date_to_epoch() {
  local value="$1"
  date -j -f '%Y-%m-%d' "$value" +%s 2>/dev/null \
    || date -d "$value" +%s 2>/dev/null \
    || true
}

# Extract the first `updated` date from a document.
# Matches both workspace docs (`**Updated:** 2026-05-21`) and wiki
# frontmatter (`updated: 2026-05-21`). Prints nothing when absent.
extract_updated_date() {
  grep -iE 'updated' "$1" 2>/dev/null \
    | grep -oE '[0-9]{4}-[0-9]{2}-[0-9]{2}' \
    | head -n1 \
    || true
}
