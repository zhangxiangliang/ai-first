create_workspace() {
  if [ "${1:-}" = "" ]; then
    printf 'Usage: %s create <workspace-name> [topic-slug]\n' "$0"
    printf 'Example: %s create user-management create-user-table\n' "$0"
    printf 'Use a meaningful kebab-case name, not request/task/notes.\n'
    exit 1
  fi

  local name="$1"
  local topic="${2:-}"
  local target=""
  local template=""
  local root_template=""
  local title=""
  local topic_title=""
  local prefix=""
  local today=""

  if [ "${3:-}" != "" ]; then
    printf 'Usage: %s create <workspace-name> [topic-slug]\n' "$0" >&2
    exit 1
  fi

  case "$name" in
    *[!a-z0-9-]* | -* | *-)
      printf 'Workspace name must be kebab-case: lowercase letters, numbers, and hyphens only.\n' >&2
      exit 1
      ;;
  esac

  if is_generic_name "$name"; then
    printf 'Workspace name is too generic. Use a meaningful project, module, feature, or outcome name.\n' >&2
    exit 1
  fi

  if [ "$topic" != "" ]; then
    case "$topic" in
      *[!a-z0-9-]* | -* | *-)
        printf 'Topic slug must be kebab-case: lowercase letters, numbers, and hyphens only.\n' >&2
        exit 1
        ;;
    esac

    if is_generic_name "$topic"; then
      printf 'Topic slug is too generic. Use a meaningful request, feature, ticket, or investigation name.\n' >&2
      exit 1
    fi
  fi

  target="$SCAFFOLD_ROOT/workspaces/$name"
  template="$SCAFFOLD_ROOT/templates/workspace"
  root_template="$SCAFFOLD_ROOT/templates/workspace-root.md"

  if [ -e "$target" ]; then
    printf 'Workspace already exists: %s\n' "$target" >&2
    exit 1
  fi

  if [ ! -f "$root_template" ]; then
    printf 'Missing workspace root template: %s\n' "$root_template" >&2
    exit 1
  fi

  mkdir -p "$target"
  cp -R "$template/." "$target/"

  title="$(titleize_slug "$name")"
  prefix="$(printf '%s' "$name" | tr '[:lower:]-' '[:upper:]_')"
  today="$(date +%F)"

  sed \
    -e "s/{{WORKSPACE_TITLE}}/$title/g" \
    -e "s/{{UPDATED_DATE}}/$today/g" \
    -e "s/{{WORKSPACE_PREFIX}}/$prefix/g" \
    "$root_template" > "$target/README.md"

  if [ "$topic" != "" ]; then
    topic_title="$(titleize_slug "$topic")"
    create_topic_starter_documents "$target" "$name" "$title" "$prefix" "$topic" "$topic_title" "$today"
  fi

  printf 'Created workspace: %s\n' "$target"
  if [ "$topic" != "" ]; then
    printf 'Created starter topic documents for: %s\n' "$topic"
    printf 'Next step: update %s/README.md and fill raw-input/%s.md.\n' "$target" "$topic"
  else
    printf 'Next step: update %s/README.md and add original sources to raw-input/.\n' "$target"
  fi
}

create_document() {
  if [ "${1:-}" = "" ] || [ "${2:-}" = "" ] || [ "${3:-}" = "" ] || [ "${4:-}" != "" ]; then
    printf 'Usage: %s create-doc <workspace-name> <phase|all> <topic-slug>\n' "$0" >&2
    printf 'Example: %s create-doc user-management requirements create-user-table\n' "$0" >&2
    exit 1
  fi

  local name="$1"
  local phase="$2"
  local topic="$3"
  local target="$SCAFFOLD_ROOT/workspaces/$name"
  local title=""
  local topic_title=""
  local prefix=""
  local today=""

  validate_workspace_name "$name"
  validate_topic_slug "$topic"
  validate_document_phase "$phase"

  if [ ! -d "$target" ]; then
    printf 'Workspace does not exist: %s\n' "$target" >&2
    exit 1
  fi

  title="$(titleize_slug "$name")"
  topic_title="$(titleize_slug "$topic")"
  prefix="$(printf '%s' "$name" | tr '[:lower:]-' '[:upper:]_')"
  today="$(date +%F)"

  if [ "$phase" = "all" ]; then
    create_documents_for_phases "$target" "$name" "$title" "$prefix" "$topic" "$topic_title" "$today" raw-input discovery context requirements tech-spec implementation review
  else
    create_documents_for_phases "$target" "$name" "$title" "$prefix" "$topic" "$topic_title" "$today" "$phase"
  fi

  printf 'Created document(s) for topic: %s\n' "$topic"
}

validate_workspace_name() {
  local name="$1"

  case "$name" in
    *[!a-z0-9-]* | -* | *-)
      printf 'Workspace name must be kebab-case: lowercase letters, numbers, and hyphens only.\n' >&2
      exit 1
      ;;
  esac

  if is_generic_name "$name"; then
    printf 'Workspace name is too generic. Use a meaningful project, module, feature, or outcome name.\n' >&2
    exit 1
  fi
}

validate_topic_slug() {
  local topic="$1"

  case "$topic" in
    *[!a-z0-9-]* | -* | *-)
      printf 'Topic slug must be kebab-case: lowercase letters, numbers, and hyphens only.\n' >&2
      exit 1
      ;;
  esac

  if is_generic_name "$topic"; then
    printf 'Topic slug is too generic. Use a meaningful request, feature, ticket, or investigation name.\n' >&2
    exit 1
  fi
}

validate_document_phase() {
  case "$1" in
    all|raw-input|discovery|context|requirements|tech-spec|implementation|review)
      ;;
    *)
      printf 'Phase must be one of: all, raw-input, discovery, context, requirements, tech-spec, implementation, review.\n' >&2
      exit 1
      ;;
  esac
}

titleize_slug() {
  printf '%s' "$1" | awk -F- '{ for (i=1; i<=NF; i++) { $i=toupper(substr($i,1,1)) substr($i,2) } print }' OFS=' '
}

create_topic_starter_documents() {
  local target="$1"
  local workspace_name="$2"
  local workspace_title="$3"
  local workspace_prefix="$4"
  local topic_slug="$5"
  local topic_title="$6"
  local updated_date="$7"
  local phase=""

  for phase in raw-input requirements tech-spec; do
    create_documents_for_phases "$target" "$workspace_name" "$workspace_title" "$workspace_prefix" "$topic_slug" "$topic_title" "$updated_date" "$phase"
  done
}

create_documents_for_phases() {
  local target="$1"
  local workspace_name="$2"
  local workspace_title="$3"
  local workspace_prefix="$4"
  local topic_slug="$5"
  local topic_title="$6"
  local updated_date="$7"
  shift 7

  local phase=""
  local destination=""

  for phase in "$@"; do
    destination="$target/$phase/$topic_slug.md"
    if [ ! -d "$target/$phase" ]; then
      printf 'Workspace phase directory does not exist: %s\n' "$target/$phase" >&2
      exit 1
    fi

    if [ -e "$destination" ]; then
      printf 'Document already exists: %s\n' "$destination" >&2
      exit 1
    fi

    render_document_template \
      "$phase" \
      "$destination" \
      "$workspace_name" \
      "$workspace_title" \
      "$workspace_prefix" \
      "$topic_slug" \
      "$topic_title" \
      "$updated_date"

    printf 'Created document: %s\n' "$destination"
  done
}

render_document_template() {
  local phase="$1"
  local destination="$2"
  local workspace_name="$3"
  local workspace_title="$4"
  local workspace_prefix="$5"
  local topic_slug="$6"
  local topic_title="$7"
  local updated_date="$8"
  local document_template="$SCAFFOLD_ROOT/templates/documents/$phase.md"

  if [ ! -f "$document_template" ]; then
    printf 'Missing document template: %s\n' "$document_template" >&2
    exit 1
  fi

  sed \
    -e "s/{{WORKSPACE_NAME}}/$workspace_name/g" \
    -e "s/{{WORKSPACE_TITLE}}/$workspace_title/g" \
    -e "s/{{WORKSPACE_PREFIX}}/$workspace_prefix/g" \
    -e "s/{{TOPIC_SLUG}}/$topic_slug/g" \
    -e "s/{{TOPIC_TITLE}}/$topic_title/g" \
    -e "s/{{UPDATED_DATE}}/$updated_date/g" \
    "$document_template" > "$destination"
}
