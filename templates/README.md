# Templates

Reusable templates for the AI-first workspace lifecycle.

Use `workspace/` when creating a new workspace under `workspaces/<workspace-name>/`.

Use `documents/` when creating new phase documents inside a workspace.

The standard lifecycle is:

```text
raw-input -> discovery -> context -> requirements -> tech-spec -> implementation -> review
```

Create only folders that contain real content. Each created folder should include a `README.md` that explains the folder's role.
