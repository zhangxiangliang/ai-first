# AI Workspace Scaffold 使用指南

[English](ai-first-guide.md)

这份指南说明如何在 AI Workspace Scaffold 里工作。

目标不是强制复杂流程，而是保留足够结构，让人或 AI agent 可以恢复上下文、理解当前状态，并继续推进工作。

## 基本模型

这个仓库是协调层。

| 层 | 作用 |
|----|------|
| `workspaces/` | 当前项目、模块或功能工作 |
| `wiki/` | 稳定可复用知识 |
| `repos/` | 实现代码仓库，通常是 git submodule |
| `templates/` | 可复用 workspace 文档模板 |
| `scripts/` | 创建 workspace、lint、维护 wiki ingest queue |

## 从哪里开始

进入项目时，先读：

1. `LLM-WIKI.md`
2. `WIKI-SCHEMA.md`
3. `AGENT-RULES.md`
4. 当前 workspace 的 `README.md`
5. `wiki/index.md` 里相关页面

不要默认读取所有文件。先从当前 workspace 开始，再顺着链接读。

## 创建 Workspace

创建新 workspace：

```sh
./scripts/create-workspace.sh user-management
```

它会生成：

```text
workspaces/user-management/
├── README.md
├── raw-input/
├── discovery/
├── context/
├── requirements/
├── tech-spec/
├── implementation/
└── review/
```

创建后，优先更新 workspace `README.md`：

- `Goal`
- `Current Phase`
- `Phase Mode`
- `Handoff`
- `Next Step`

## 选择最小可用流程

完整参考流程是：

```text
raw-input -> discovery -> context -> requirements -> tech-spec -> implementation -> review
```

这不是强制流程。选择能保留必要可追溯性的最小路径。

| 场景 | 建议路径 |
|------|----------|
| 明确的小实现 | `implementation` |
| Bug 或 support ticket | `raw-input -> implementation -> review` |
| Bug 期望行为不明确 | `raw-input -> discovery -> requirements -> implementation -> review` |
| 明确产品功能 | `requirements -> tech-spec -> implementation -> review` |
| 模糊产品工作 | `raw-input -> discovery -> context -> requirements` |
| 架构或跨模块变更 | `context -> tech-spec -> implementation -> review -> wiki promotion` |
| 纯调研 | `discovery` 或 `discovery -> context` |
| 文档或知识更新 | `context -> wiki promotion` |

如果流程太重，就记录 `Phase Shortcut` 或 `Phase Scope`，不要硬跑完整流程。

## Workspace 阶段

| 阶段 | 作用 |
|------|------|
| `raw-input/` | 原始资料，保持不改 |
| `discovery/` | 调研、歧义、开放问题、风险 |
| `context/` | 产品和技术背景 |
| `requirements/` | PRD 风格需求、ticket、验收标准 |
| `tech-spec/` | 技术方案、任务拆分、测试、回滚 |
| `implementation/` | 执行记录、改动文件、验证证据 |
| `review/` | 验收结果、问题、最终决定 |

每个阶段都可以单独使用。

## 命名

名称应该让人不用打开文件也能知道在做什么。

- Workspace 名称要描述项目、模块、功能或目标。
- 不要使用 `request`、`task`、`notes`、`misc`、`temp` 这类泛名。
- 同一个事项在不同阶段复用同一个 topic slug。

示例：

```text
workspaces/user-management/
├── raw-input/create-user-table.md
├── requirements/create-user-table.md
├── tech-spec/create-user-table.md
├── implementation/create-user-table.md
└── review/create-user-table.md
```

## 更新已有项目

如果一个项目是基于旧版 scaffold 创建的，可以从新版 scaffold checkout 更新结构：

```sh
./scripts/scaffold.sh update --source ../project-scaffold-latest --dry-run
./scripts/scaffold.sh update --source ../project-scaffold-latest
```

这个命令会补齐缺失的 scaffold 管理文件；相同文件不处理；如果本地文件和新版不同，会把候选更新写到 `.scaffold-updates/<timestamp>/`。默认不会覆盖用户自己的 workspaces。

## Handoff

每个 workspace README 都应该有简短 handoff。

```md
## Handoff

### Current State

[当前进展]

### Confirmed

- [已确认事实或决定]

### Unknown

- [缺失信息或未解决问题]

### Next Best Action

[下一步最应该做什么]

### Read First

- [最应该先读的文件]
```

Handoff 是新人或新 AI agent 进入 workspace 时最快的恢复点。

## Requirement 和 Ticket 编号

需求和 ticket 编号以 workspace 为作用域，避免冲突。

格式：

```text
<WORKSPACE-PREFIX>-REQ-001
<WORKSPACE-PREFIX>-TICKET-001
```

示例：

```text
ADMIN-REQ-001
ADMIN-TICKET-001
CLAIMS-REQ-001
CLAIMS-TICKET-001
```

不要在多个 workspace 中使用裸 `REQ-001` 或 `TICKET-001`。

## Wiki Promotion

wiki 存放稳定可复用知识。

workspace 文档负责当前项目状态。只有当知识稳定且可复用时，才 promotion 到 wiki。

workspace 文档可以包含：

```md
## Wiki Promotion Candidates

- [ ] wiki/scaffold/example.md — Stable conclusion to promote
- [x] wiki/workflow/example.md — Already promoted
```

然后运行：

```sh
./scripts/update-ingest-queue.sh
```

完成一次 ingest：

1. 判断结论是否稳定且可复用。
2. 在 `wiki/` 下新增或更新页面。
3. 更新 `wiki/index.md`。
4. 追加 `wiki/log.md`。
5. 勾选来源文档里的 `Wiki Promotion Candidates`。
6. 运行 `./scripts/update-ingest-queue.sh`。
7. 运行 `./scripts/lint-scaffold.sh`。

## Scripts

### Create Workspace

```sh
./scripts/create-workspace.sh user-management
```

从 `templates/workspace/` 创建 workspace。

### Lint Scaffold

```sh
./scripts/lint-scaffold.sh
```

检查脚手架结构、workspace 阶段 README、wiki index 覆盖、ingest queue 是否存在，以及 `git diff --check`。

这是结构检查，不代表文档内容完整或正确。

### Update Ingest Queue

```sh
./scripts/update-ingest-queue.sh
```

扫描可见的 `Wiki Promotion Candidates` 区块，重新生成 `wiki/ingest-queue.md`。

## 怎么要求 AI Agent

### 启动新模块

```text
Create a workspace for the admin module.
Use the workflow router to choose the smallest useful process.
Update the workspace README handoff before doing implementation work.
```

### 处理 ticket

```text
Put the original ticket in raw-input.
Decide whether discovery is needed.
If behavior is clear, proceed to implementation and record the shortcut.
```

### 接手已有工作

```text
Read the workspace README handoff and the Read First list.
Summarize current state, confirmed facts, unknowns, risks, and the next best action.
Do not modify files yet.
```

### 收尾任务

```text
Update the workspace handoff.
Review Wiki Promotion Candidates.
Run update-ingest-queue and lint-scaffold.
Report any remaining gaps.
```

## 提交前

运行：

```sh
./scripts/update-ingest-queue.sh
./scripts/lint-scaffold.sh
git diff --check
```

commit message 必须是简短英文 Conventional Commit。

示例：

```text
feat: add workspace handoff
docs: clarify wiki promotion
fix: correct ingest queue parsing
```
