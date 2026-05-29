lint_scaffold() {
  local status=0
  local phase=""
  local workspace=""
  local name=""
  local phase_dir=""
  local page=""
  local rel=""
  local junk=""
  local canonical=""
  local diff_check_output=""

  fail() {
    printf 'FAIL: %s\n' "$1" >&2
    status=1
  }

  warn() {
    printf 'WARN: %s\n' "$1" >&2
  }

  require_file() {
    [ -f "$SCAFFOLD_ROOT/$1" ] || fail "Missing file: $1"
  }

  require_executable() {
    [ -x "$SCAFFOLD_ROOT/$1" ] || fail "Missing executable file: $1"
  }

  require_dir() {
    [ -d "$SCAFFOLD_ROOT/$1" ] || fail "Missing directory: $1"
  }

  warn_unfilled_workspace_readme() {
    local file="$1"
    local rel_path="$2"
    local pattern=""

    for pattern in \
      "Short description of the module, feature, or project." \
      "<person or agent>" \
      "[One clear sentence describing the desired outcome.]" \
      "[What this workspace covers]" \
      "[What this workspace intentionally excludes]" \
      "[raw-input | discovery | context | requirements | tech-spec | implementation | review]" \
      "<why this workspace uses this amount of process>" \
      "[Where the work currently stands.]" \
      "[Confirmed fact or decision]" \
      "[Missing information or unresolved question]" \
      "[The next action a human or AI should take.]" \
      "[Most important file to read first]" \
      "[The immediate next action.]"; do
      if grep -Fq "$pattern" "$file"; then
        warn "Workspace README still contains template placeholder: $rel_path"
        return
      fi
    done
  }

  phase_doc_stems() {
    local phase_dir="$1"
    local doc=""
    local base=""

    find "$phase_dir" -maxdepth 1 -type f -name '*.md' | sort | while IFS= read -r doc; do
      base="$(basename "$doc")"
      [ "$base" = "README.md" ] && continue
      printf '%s\n' "${base%.*}"
    done
  }

  has_shared_stem() {
    local left="$1"
    local right="$2"
    local stem=""

    while IFS= read -r stem; do
      [ "$stem" != "" ] || continue
      if printf '%s\n' "$right" | grep -Fxq "$stem"; then
        return 0
      fi
    done <<EOF
$left
EOF

    return 1
  }

  warn_phase_slug_mismatch() {
    local workspace_path="$1"
    local workspace_name="$2"
    local phases=($SCAFFOLD_PHASES)
    local left_index=0
    local right_index=0
    local left_phase=""
    local right_phase=""
    local left_stems=""
    local right_stems=""
    local left_count=0
    local right_count=0
    local left_summary=""
    local right_summary=""

    for ((left_index = 0; left_index < ${#phases[@]}; left_index++)); do
      left_phase="${phases[$left_index]}"
      [ -d "$workspace_path/$left_phase" ] || continue
      left_stems="$(phase_doc_stems "$workspace_path/$left_phase")"
      [ "$left_stems" != "" ] || continue
      left_count="$(printf '%s\n' "$left_stems" | sed '/^$/d' | wc -l | tr -d ' ')"
      [ "$left_count" -eq 1 ] || continue

      for ((right_index = left_index + 1; right_index < ${#phases[@]}; right_index++)); do
        right_phase="${phases[$right_index]}"
        [ -d "$workspace_path/$right_phase" ] || continue
        right_stems="$(phase_doc_stems "$workspace_path/$right_phase")"
        [ "$right_stems" != "" ] || continue
        right_count="$(printf '%s\n' "$right_stems" | sed '/^$/d' | wc -l | tr -d ' ')"
        [ "$right_count" -eq 1 ] || continue

        if ! has_shared_stem "$left_stems" "$right_stems"; then
          left_summary="$(printf '%s' "$left_stems" | paste -sd ',' -)"
          right_summary="$(printf '%s' "$right_stems" | paste -sd ',' -)"
          warn "No shared topic slug between workspaces/$workspace_name/$left_phase/ ($left_summary) and workspaces/$workspace_name/$right_phase/ ($right_summary); verify related phase documents use the same slug"
        fi
      done
    done
  }

  require_wiki_index_targets_exist() {
    local link=""
    local target=""

    while IFS= read -r link; do
      target="${link%%#*}"
      case "$target" in
        ""|\#*|http://*|https://*|mailto:*|/*)
          continue
          ;;
      esac

      if [ ! -f "$SCAFFOLD_ROOT/wiki/$target" ]; then
        fail "wiki/index.md links to missing file: wiki/$target"
      fi
    done < <(grep -oE '\[[^]]+\]\([^)]+\)' "$SCAFFOLD_ROOT/wiki/index.md" | sed -E 's/^.*\(([^)]*)\).*$/\1/' | sort -u)
  }

  require_markdown_link_targets_exist() {
    local page=""
    local page_dir=""
    local rel=""
    local link=""
    local target=""

    while IFS= read -r page; do
      [ -f "$page" ] || continue
      page_dir="$(dirname "$page")"
      rel="${page#"$SCAFFOLD_ROOT/"}"

      while IFS= read -r link; do
        target="${link%%#*}"
        target="${target#<}"
        target="${target%>}"

        case "$target" in
          ""|\#*|http://*|https://*|mailto:*|tel:*|/*)
            continue
            ;;
        esac

        if [ ! -e "$page_dir/$target" ]; then
          fail "Markdown link points to missing target: $rel -> $target"
        fi
      done < <(grep -oE '!?\[[^]]+\]\([^)]+\)' "$page" | sed -E 's/^!?\[[^]]+\]\(([^)[:space:]]+).*$/\1/' | sort -u)
    done < <(
      find "$SCAFFOLD_ROOT" \
        -path "$SCAFFOLD_ROOT/.git" -prune -o \
        -path "$SCAFFOLD_ROOT/repos" -prune -o \
        -type f -name '*.md' -print | sort
    )
  }

  require_file "LLM-WIKI.md"
  require_file "WIKI-SCHEMA.md"
  require_file "AGENT-RULES.md"
  require_file "AGENTS.md"
  require_file "CLAUDE.md"
  require_file "README.md"
  require_file ".gitignore"
  require_file "LICENSE"
  require_file "wiki/index.md"
  require_file "wiki/log.md"
  require_file "wiki/ingest-queue.md"
  require_file "templates/workspace-root.md"
  require_executable "scripts/scaffold.sh"
  require_executable "scripts/codex.sh"
  require_executable "scripts/claude.sh"
  require_dir "templates/workspace"
  require_dir "templates/documents"
  require_dir "workspaces"
  require_dir "repos"

  for phase in $SCAFFOLD_PHASES; do
    require_file "templates/workspace/$phase/README.md"
    require_file "templates/documents/$phase.md"
  done

  for workspace in "$SCAFFOLD_ROOT"/workspaces/*; do
    [ -d "$workspace" ] || continue
    name="$(basename "$workspace")"
    [ -f "$workspace/README.md" ] || fail "Workspace missing README: workspaces/$name"
    if [ -f "$workspace/README.md" ]; then
      warn_unfilled_workspace_readme "$workspace/README.md" "workspaces/$name/README.md"
    fi
    if is_generic_name "$name"; then
      fail "Workspace name is too generic: workspaces/$name"
    fi

    for phase_dir in "$workspace"/*; do
      [ -d "$phase_dir" ] || continue
      phase="$(basename "$phase_dir")"
      if is_accepted_dir "$phase"; then
        if is_known_phase "$phase"; then
          [ -f "$phase_dir/README.md" ] || fail "Phase missing README: workspaces/$name/$phase"
        else
          [ -f "$phase_dir/README.md" ] || warn "Auxiliary directory missing README: workspaces/$name/$phase"
        fi
        while IFS= read -r doc; do
          [ -f "$doc" ] || continue
          base="$(basename "$doc")"
          [ "$base" = "README.md" ] && continue
          stem="${base%.*}"
          if is_generic_name "$stem"; then
            fail "Workspace document name is too generic: workspaces/$name/$phase/$base"
          fi
        done < <(find "$phase_dir" -maxdepth 1 -type f | sort)
      else
        canonical="$(canonical_phase "$phase")"
        if [ "$canonical" != "$phase" ] && is_accepted_dir "$canonical"; then
          warn "Non-standard workspace directory: workspaces/$name/$phase (rename to canonical '$canonical')"
        else
          warn "Non-standard workspace directory: workspaces/$name/$phase"
        fi
      fi
    done
    warn_phase_slug_mismatch "$workspace" "$name"
  done

  require_wiki_index_targets_exist
  require_markdown_link_targets_exist

  while IFS= read -r page; do
    [ -f "$page" ] || continue
    rel="${page#"$SCAFFOLD_ROOT/wiki/"}"
    case "$rel" in
      index.md|log.md)
        continue
        ;;
    esac
    if ! grep -Fq "$rel" "$SCAFFOLD_ROOT/wiki/index.md"; then
      fail "Wiki page not listed in wiki/index.md: wiki/$rel"
    fi
  done < <(find "$SCAFFOLD_ROOT/wiki" -type f -name '*.md' | sort)

  if grep -Fq -- '- [ ] `' "$SCAFFOLD_ROOT/wiki/ingest-queue.md"; then
    warn "wiki/ingest-queue.md contains pending wiki promotion candidates"
  fi

  while IFS= read -r junk; do
    [ -e "$junk" ] || continue
    if git -C "$SCAFFOLD_ROOT" check-ignore -q "$junk"; then
      rel="${junk#"$SCAFFOLD_ROOT/"}"
      warn "Ignored local noise file exists: $rel"
    fi
  done < <(find "$SCAFFOLD_ROOT" -path "$SCAFFOLD_ROOT/.git" -prune -o \( -name '.DS_Store' -o -name 'Thumbs.db' \) -print | sort)

  if git -C "$SCAFFOLD_ROOT" rev-parse --is-inside-work-tree >/dev/null 2>&1; then
    diff_check_output="$(git -C "$SCAFFOLD_ROOT" diff --check || true)"
    if [ "$diff_check_output" != "" ]; then
      printf '%s\n' "$diff_check_output" >&2
      fail "git diff --check reported whitespace or conflict-marker issues"
    fi
  else
    warn "Not a git repository; skipping git diff --check"
  fi

  if [ "$status" -eq 0 ]; then
    printf 'Scaffold lint passed.\n'
  fi

  exit "$status"
}
