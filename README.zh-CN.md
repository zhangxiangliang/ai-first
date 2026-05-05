# AI Workspace Scaffold

[English](README.md)

一个面向 AI-first 开发的工作区脚手架，用于 PRD 驱动开发、长期项目知识沉淀，以及由 LLM 维护的 wiki 工作流。

这个仓库不是普通代码仓库，而是一个协调层。它帮助团队和 AI agent 保存项目上下文，从原始输入推进到实现，并把可复用知识沉淀到长期 wiki。

## 为什么需要它

很多 AI 辅助开发会在会话之间丢失上下文。需求留在聊天记录里，技术决策散落在不同地方，新的 AI agent 经常需要从头理解项目。

AI Workspace Scaffold 给这些工作一个稳定结构：

- `workspaces/`：当前项目、功能或模块的工作区
- `wiki/`：长期可复用知识
- `repos/`：实现代码仓库，通常通过 git submodule 接入
- `templates/`：可复用的 workspace 文档模板
- `scripts/`：创建 workspace、检查脚手架、维护 wiki ingest queue 的工具

## 核心思路

每个重要任务都可以有一个 workspace：

```text
workspaces/<workspace-name>/
```

完整参考流程是：

```text
raw-input -> discovery -> context -> requirements -> tech-spec -> implementation -> review
```

这不是强制瀑布流程。实际使用时，选择能保留必要可追溯性的最小流程。

示例：

| 场景 | 建议路径 |
|------|----------|
| 明确的小改动 | `implementation` |
| Bug ticket | `raw-input -> implementation -> review` |
| 模糊的产品工作 | `raw-input -> discovery -> context -> requirements` |
| 明确功能 | `requirements -> tech-spec -> implementation -> review` |
| 纯调研 | `discovery` 或 `discovery -> context` |
| 长期知识更新 | `context -> wiki promotion` |

## 快速开始

创建 workspace：

```sh
./scripts/create-workspace.sh user-management
```

名称要用有意义的 kebab-case。相同事项在不同阶段复用同一个 topic slug，例如 `raw-input/create-user-table.md`、`requirements/create-user-table.md`、`tech-spec/create-user-table.md`。

然后更新生成的 workspace README，尤其是：

- `Goal`
- `Current Phase`
- `Phase Mode`
- `Handoff`
- `Next Step`

检查脚手架结构：

```sh
./scripts/lint-scaffold.sh
```

生成 wiki ingest queue：

```sh
./scripts/update-ingest-queue.sh
```

从更新版本的 scaffold checkout 升级已有项目，并避免覆盖本地内容：

```sh
./scripts/scaffold.sh update --source ../project-scaffold-latest --dry-run
./scripts/scaffold.sh update --source ../project-scaffold-latest
```

## 文档

- [英文使用指南](docs/ai-first-guide.md) / [中文使用指南](docs/ai-first-guide.zh-CN.md)
- [LLM-WIKI.md](LLM-WIKI.md)：上游模式说明，已标注 Andrej Karpathy 原始 gist 来源
- [WIKI-SCHEMA.md](WIKI-SCHEMA.md)：本地工作流 schema
- [AGENT-RULES.md](AGENT-RULES.md)：AI agent 硬性规则
- [scripts/README.md](scripts/README.md)：脚本说明
- [workspaces/scaffold-maintenance/](workspaces/scaffold-maintenance/)：维护脚手架自身的 workspace
- [wiki/index.md](wiki/index.md)：长期知识索引

## 目录结构

```text
.
├── AGENTS.md
├── CLAUDE.md
├── LLM-WIKI.md
├── WIKI-SCHEMA.md
├── docs/
├── repos/
├── scripts/
├── templates/
├── wiki/
└── workspaces/
```

## Wiki Promotion

workspace 文档可以提出需要沉淀到 wiki 的稳定知识：

```md
## Wiki Promotion Candidates

- [ ] wiki/scaffold/example.md — Stable conclusion to promote
- [x] wiki/workflow/example.md — Already promoted
```

然后运行：

```sh
./scripts/update-ingest-queue.sh
```

真正沉淀时，把结论写入 `wiki/`，更新 `wiki/index.md`，追加 `wiki/log.md`，并把来源 workspace 里的候选项勾选。

## Requirements 和 Tickets

需求和 ticket 编号以 workspace 为作用域，避免不同 workspace 冲突：

```text
ADMIN-REQ-001
ADMIN-TICKET-001
CLAIMS-REQ-001
CLAIMS-TICKET-001
```

不要在多个 workspace 中使用裸 `REQ-001` 或 `TICKET-001`。

## 给 AI Agent 的入口

开始工作前读取：

1. `LLM-WIKI.md`
2. `WIKI-SCHEMA.md`
3. `AGENT-RULES.md`
4. 当前 workspace 的 `README.md`
5. `wiki/index.md` 中相关 wiki 页面

收尾时，更新当前 workspace 的 handoff，运行 ingest queue，运行 scaffold lint，并报告剩余缺口。

## 项目状态

项目处于早期但可用状态。这个脚手架刻意保持轻量、文档优先，后续会通过 `workspaces/scaffold-maintenance/` 演进。

## License

MIT. See [LICENSE](LICENSE).
