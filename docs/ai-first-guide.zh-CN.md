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
| `templates/` | workspace 脚手架和可复用文档模板 |
| `scripts/` | 脚手架 CLI |

## 从哪里开始

进入项目时，先读：

1. `LLM-WIKI.md`
2. `WIKI-SCHEMA.md`
3. `AGENT-RULES.md`
4. `scripts/README.md`
5. 当前 workspace 的 `README.md`
6. `wiki/index.md` 里相关页面

不要默认读取所有文件。先从当前 workspace 开始，再顺着链接读。

## 新项目初始化

如果这个仓库是作为新项目起点 clone 下来的，第一次项目提交或 push 前先更新 Git remote。否则 commit/push 仍然可能指向 scaffold 源仓库。

把 `origin` 改成新项目仓库：

```sh
git remote set-url origin <your-project-repo-url>
git remote -v
```

或者保留 scaffold remote 作为参考，再把项目仓库加为 `origin`：

```sh
git remote rename origin scaffold
git remote add origin <your-project-repo-url>
git remote -v
```

push 前确认 `origin` 是项目仓库：

```sh
git remote get-url origin
git push -u origin main
```

## 创建 Workspace

创建新 workspace：

```sh
./scripts/scaffold.sh create user-management
```

也可以同时创建第一个 topic 文档：

```sh
./scripts/scaffold.sh create user-management create-user-table
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

带 topic slug 时，还会在 `raw-input/`、`requirements/`、`tech-spec/` 中生成 starter 文档。

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
./scripts/scaffold.sh ingest
```

完成一次 ingest：

1. 判断结论是否稳定且可复用。
2. 在 `wiki/` 下新增或更新页面。
3. 更新 `wiki/index.md`。
4. 追加 `wiki/log.md`。
5. 勾选来源文档里的 `Wiki Promotion Candidates`。
6. 运行 `./scripts/scaffold.sh ingest`。
7. 运行 `./scripts/scaffold.sh lint`。

## Scripts

### Create Workspace

```sh
./scripts/scaffold.sh create user-management
```

从 `templates/workspace/` 创建 workspace。可以追加 topic slug，从 `templates/documents/` 创建 starter 文档。

### Create Document

```sh
./scripts/scaffold.sh create-doc user-management implementation create-user-table
```

在已有 workspace 中创建阶段文档。把阶段名换成 `all` 可以为同一个 topic 创建所有标准阶段文档。

### Lint Scaffold

```sh
./scripts/scaffold.sh lint
```

检查脚手架结构、可执行 scaffold 脚本、workspace 阶段 README、文档模板覆盖、workspace 根 README 占位符、wiki index 双向覆盖、阶段文档命名 warning、被忽略的本地噪声文件、ingest queue 是否存在，以及 `git diff --check`。

这是结构检查，不代表文档内容完整或正确。

### Generate Ingest Queue

```sh
./scripts/scaffold.sh ingest
```

扫描可见的 `Wiki Promotion Candidates` 区块，重新生成 `wiki/ingest-queue.md`。

## 怎么要求 AI Agent

### 启动新模块

```text
为 user management 模块创建一个 workspace。
使用 workflow router 选择最小但足够的流程。
在开始实现前更新 workspace README 的 handoff。
```

### 处理 ticket

```text
把原始 ticket 放进 raw-input。
判断是否需要 discovery。
如果行为已经清楚，直接进入 implementation，并记录 phase shortcut。
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
Run ingest and lint.
Report any remaining gaps.
```

## 提交前

运行：

```sh
./scripts/scaffold.sh ingest
./scripts/scaffold.sh lint
git diff --check
```

commit message 必须是简短英文 Conventional Commit。

示例：

```text
feat: add workspace handoff
docs: clarify wiki promotion
fix: correct ingest queue parsing
```
