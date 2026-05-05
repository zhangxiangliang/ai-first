# Workspace Template

Copy this structure when creating a new project, module, or feature workspace.

```text
workspaces/<workspace-name>/
├── README.md
├── raw-input/
├── discovery/
├── context/
├── requirements/
├── tech-spec/
├── implementation/
└── review/
```

## Naming Rules

- Use a meaningful kebab-case workspace name that describes the project, module, feature, or outcome.
- Do not use generic workspace names such as `request`, `task`, `workspace`, `notes`, `misc`, or `temp`.
- Pick a stable topic slug for each work item and reuse it across phases.
- Do not create generic phase files such as `request.md`, `requirements.md`, `notes.md`, `draft.md`, `spec.md`, `implementation.md`, or `review.md`.
- Example: `raw-input/create-user-table.md`, `requirements/create-user-table.md`, `tech-spec/create-user-table.md`, `implementation/create-user-table.md`.

## Root README Template

The workspace root README is generated from [../workspace-root.md](../workspace-root.md).

Keep root README changes in that file so generated workspaces and template documentation do not drift apart.

## Phase Document Templates

Phase directory README files explain what belongs in each directory. Copyable document templates live in [../documents/](../documents/).
