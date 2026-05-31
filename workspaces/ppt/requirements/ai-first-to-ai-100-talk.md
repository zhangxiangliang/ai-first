# AI First 到 AI 100 分享 Requirements

**状态：** Approved
**Owner：** Codex  
**更新日期：** 2026-05-28

## 阶段范围

**是否独立阶段：** 否  
**原因：** Discovery 已经明确受众、时长、交付物、风格和叙事方向。  
**预期产出：** 分享材料的需求文档。  
**下一阶段：** context -> tech-spec

## 目标

产出一套 10-20 分钟的中文分享材料，帮助即将毕业的大学生理解：当编码越来越多交给 AI，软件工程师还剩下什么价值，以及自己应该如何行动。

## 背景

用户受邀做一次分享，主题是“AI First 到 AI 100%：当 AI 写完所有代码，软件工程师还剩下什么？”原始材料来自录音转文字，包含口语、不连贯和转写错误。最终材料应该保留用户个人风格，同时形成清晰、可讲、可演示的分享。

## 用户 / 角色

| 角色 | 需求 |
|------|------|
| 分享者 | 需要 PPT 大纲、完整 HTML PPT 和逐字稿，且讲起来像自己。 |
| 即将毕业的大学生 | 需要理解 AI 对软件工程、就业和个人行动的影响。 |
| 活动组织者 | 需要一场符合主题、节奏清晰、时间可控的分享。 |

## Tickets

| Ticket ID | 来源 | 摘要 | 状态 |
|-----------|------|------|------|
| `PPT-TICKET-001` | `../raw-input/ai-first-to-ai-100-talk.md` | 把原始口播稿整理成 PPT 大纲、完整 HTML PPT 和逐字稿。 | Complete |

## 功能需求

| ID | 需求 |
|----|------|
| `PPT-REQ-001` | 分享时长应控制在 10-20 分钟。 |
| `PPT-REQ-002` | 分享对象应面向在校学生，重点是即将毕业的大学生。 |
| `PPT-REQ-003` | 分享应围绕同一个问题展开：“编码 100% 交给 AI，人做什么？” |
| `PPT-REQ-004` | 第一次回答应讲 AI-first 软件工程工作流。 |
| `PPT-REQ-005` | 第二次回答应讲职业和人生建议。 |
| `PPT-REQ-006` | 整体风格应幽默、真诚，保留用户个人口吻。 |
| `PPT-REQ-007` | 分享应包含用户从“AI 像搜索框”到“小助手”再到“Claude Code / vibe coding”的经历。 |
| `PPT-REQ-008` | 分享应尽量使用具体例子，不只讲抽象概念。 |
| `PPT-REQ-009` | 分享可以包含公司团队从 20 人左右到 4 人，以及多线程使用 AI 完成任务的例子。 |
| `PPT-REQ-010` | 最终交付物应包含 PPT 大纲、完整 HTML PPT、逐字稿。 |
| `PPT-REQ-011` | 工作流部分应映射到本项目流程：raw-input、discovery、context、requirements、tech-spec、implementation、review、wiki。 |
| `PPT-REQ-012` | 最终材料应处理录音转文字错误。 |
| `PPT-REQ-013` | AI 工作流示例应使用这个 PPT 项目本身，形成“原汤化原食”。 |
| `PPT-REQ-014` | 完整 PPT 应采用 HTML 格式。 |
| `PPT-REQ-015` | 分享中可以直接提到 Claude 和 Claude Code。 |

## 非功能需求

- PPT 应适合投影演示，文字清晰。
- 中文表达应自然口语化，便于上台讲。
- 不要写成通用 AI 趋势报告。
- 公司例子应以个人经历方式表达，不做攻击性表达。
- 文档本身优先使用中文，方便后续演示给听众看。

## 验收标准

| 需求 ID | 验收标准 | 状态 |
|---------|----------|------|
| `PPT-REQ-001` | 逐字稿自然朗读能控制在 10-20 分钟。 | Pass |
| `PPT-REQ-003` | 核心问题至少清晰出现两次。 | Pass |
| `PPT-REQ-004` | 第一次回答包含清晰的 AI-first 工作流和具体例子。 | Pass |
| `PPT-REQ-005` | 第二次回答包含给毕业生的职业和人生建议。 | Pass |
| `PPT-REQ-006` | 开头和结尾保留“张大猪”的记忆点。 | Pass |
| `PPT-REQ-010` | 最终交付物包含大纲、HTML PPT、逐字稿。 | Pass |
| `PPT-REQ-012` | 关键转写错误已经修正或绕开。 | Pass |
| `PPT-REQ-013` | 工作流部分能展示这个 PPT 项目如何从 raw-input 走到后续阶段。 | Pass |
| `PPT-REQ-014` | HTML PPT 可以在浏览器中打开并演示。 | Pass |

## 范围

### 包含

- PPT 大纲。
- 完整 HTML PPT。
- 逐字稿。
- 叙事结构和逐页逻辑。
- 转写纠错。
- 时间、节奏、可读性、风格 review。

### 不包含

- 录音或视频制作。
- 无关代码 demo。
- 发布或分发最终 deck。
- 对 AI 行业数据做正式调研报告。

## 依赖

- 用户审核 Tech Spec。
- 用户明确要求进入 implementation 后，才生成真正内容。
- 用户决定 HTML PPT 是否需要离线可用。

## 开放问题

- [ ] Tech Spec 是否通过？
- [ ] Implementation 阶段先写哪些文档？
- [ ] HTML PPT 使用 Reveal.js 还是自定义方案？
- [ ] 是否需要离线可用？

## 来源追踪

| 需求 ID | Ticket ID | 来源 | 说明 |
|---------|-----------|------|------|
| `PPT-REQ-001` | `PPT-TICKET-001` | Codex 对话 2026-05-28 | 用户确认时长 10-20 分钟。 |
| `PPT-REQ-002` | `PPT-TICKET-001` | Codex 对话 2026-05-28 | 用户确认听众是即将毕业的大学生。 |
| `PPT-REQ-003` | `PPT-TICKET-001` | Codex 对话 2026-05-28 | 用户确认同一个问题作为主线。 |
| `PPT-REQ-004` | `PPT-TICKET-001` | Codex 对话 2026-05-28 | 用户确认第一次回答是 AI 工作流教学。 |
| `PPT-REQ-005` | `PPT-TICKET-001` | Codex 对话 2026-05-28 | 用户确认第二次回答是职业和人生建议。 |
| `PPT-REQ-006` | `PPT-TICKET-001` | Codex 对话 2026-05-28 | 用户希望幽默、真诚。 |
| `PPT-REQ-007` | `PPT-TICKET-001` | raw-input | 原始稿包含个人 AI 使用经历。 |
| `PPT-REQ-008` | `PPT-TICKET-001` | raw-input | 用户提到学生更容易听懂例子。 |
| `PPT-REQ-009` | `PPT-TICKET-001` | Codex 对话 2026-05-28 | 用户允许讲公司例子，并修正人数为 20 到 4。 |
| `PPT-REQ-010` | `PPT-TICKET-001` | Codex 对话 2026-05-28 | 用户要求大纲、完整 PPT、逐字稿。 |
| `PPT-REQ-011` | `PPT-TICKET-001` | raw-input / Codex 对话 | 原始稿和后续确认都提到工作流。 |
| `PPT-REQ-012` | `PPT-TICKET-001` | Codex 对话 2026-05-28 | 用户说明原文来自录音转写。 |
| `PPT-REQ-013` | `PPT-TICKET-001` | Codex 对话 2026-05-28 | 用户要求“原汤化原食”。 |
| `PPT-REQ-014` | `PPT-TICKET-001` | Codex 对话 2026-05-28 | 用户要求 HTML 格式。 |
| `PPT-REQ-015` | `PPT-TICKET-001` | Codex 对话 2026-05-28 | 用户允许直接讲 Claude / Claude Code。 |

## 审批

**审批人：** Ben
**审批日期：** 2026-05-28
**说明：** 需求已通过，最终产物已完成到 `repos/ppt/`。

## Wiki Promotion Candidates

- [x] `wiki/workflow/ai-first-development.md` - 如果本项目流程验证有效，可沉淀为复用工作流。
