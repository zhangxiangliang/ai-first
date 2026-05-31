# PPT 分享项目

用于准备一次中文分享和配套 HTML PPT，主题是：

> AI First 到 AI 100%：当 AI 写完所有代码，软件工程师还剩下什么？

**状态：** Complete
**Owner：** Ben / Codex
**更新日期：** 2026-05-31

## 目标

产出一套 10-20 分钟的中文分享材料，包括 PPT 大纲、完整 HTML PPT 和逐字稿，面向即将毕业的大学生，风格幽默、真诚、实用。

## 范围

### 包含

- 保存原始录音转文字内容。
- 梳理分享主题、受众、主线、风险和缺失信息。
- 明确分享材料的需求和验收标准。
- 设计 PPT/逐字稿的实施方案。
- 在用户明确要求后，再进入真正的内容实施。

### 不包含

- 不做无关 AI 工具开发。
- 不在未审核 Tech Spec 的情况下生成最终 PPT。
- 不把尚未验证的方法论沉淀到 `wiki/`。

## 当前阶段

Complete。

说明：Tech Spec、PPT 大纲、逐字稿、HTML PPT、演讲稿、Review 和 PDF 导出均已完成。HTML PPT 位于 `repos/ppt/index.html`，演讲稿位于 `repos/ppt/index.md`，PDF 位于 `repos/ppt/exports/ai-first-talk.pdf`。当前 PDF 导出版已按用户要求去掉两页“张大猪”。

## 流程模式

**模式：** 完整生命周期
**原因：** 这个项目从口语化原始稿开始，需要经过 discovery、requirements、context、tech-spec、implementation、review，才能变成可上台使用的 PPT 和讲稿。

## 交接状态

### 当前状态

已经完成：

- raw-input：保存原始转写稿。
- discovery：梳理问题、主线和开放问题。
- requirements：确认受众、时间、交付物、叙事结构。
- context：记录已确认信息、转写纠错、叙事骨架。
- tech-spec：提出 HTML PPT 的实施方案，并已通过用户审核。
- implementation：已创建状态文档、PPT 大纲和逐字稿；可运行 HTML PPT 与最终演讲稿放在 `repos/ppt/`。
- review：已完成，记录了验证结果和可选后续优化项。
- export：已将 HTML PPT 导出为静态 PDF，并补齐导出流程文档和 wiki 记录。

### 已确认

- 分享时间：10-20 分钟。
- 主要听众：即将毕业的大学生。
- 交付物：PPT 大纲、完整 HTML PPT、逐字稿。
- 主题问题：编码 100% 交给 AI，人做什么？
- 叙事结构：同一个问题回答两次。
- 第一次回答：AI 工作流程教学。
- 第二次回答：职业和人生建议。
- 风格：幽默、真诚。
- 可以直接讲 Claude / Claude Code。
- AI 工作流例子：就用这个 PPT 项目本身，形成“原汤化原食”的闭环。
- 真正实施前必须先经过用户审核。

### 可选后续

- 正式分享前自行试讲计时。
- 代码提交暂缓到用户后续指令。

### 下一步

流程已完成。下一步只剩正式分享前的可选优化。

## 关键文档

| 文档 | 用途 |
|------|------|
| `raw-input/ai-first-to-ai-100-talk.md` | 原始录音转文字内容。 |
| `discovery/ai-first-to-ai-100-talk.md` | Discovery 记录：主题、主线、风险、开放问题。 |
| `requirements/ai-first-to-ai-100-talk.md` | Requirements：受众、范围、需求、验收标准。 |
| `context/ai-first-to-ai-100-talk.md` | Context：确认信息、纠错表、叙事骨架。 |
| `tech-spec/ai-first-to-ai-100-talk.md` | Tech Spec：HTML PPT 的技术和实施方案。 |
| `implementation/ai-first-to-ai-100-talk.md` | Implementation 阶段状态记录。 |
| `implementation/ai-first-to-ai-100-talk-outline.md` | PPT 大纲，已通过用户确认。 |
| `implementation/ai-first-to-ai-100-talk-script.md` | 逐字稿，已通过用户确认。 |
| `../../repos/ppt/index.html` | 可运行 HTML PPT，当前 27 页。 |
| `../../repos/ppt/index.md` | 中文演讲稿，当前 19 个章节。 |
| `../../repos/ppt/assets/claude-invite-email.png` | Claude 邀请邮件素材。 |
| `../../repos/ppt/assets/daily-flow-orders.png` | 小生意订单截图素材。 |
| `review/ai-first-to-ai-100-talk.md` | Review 记录，等待用户视觉审核和试讲计时。 |
| `raw-input/export-html-deck-to-pdf.md` | PDF 导出请求的原始输入。 |
| `requirements/export-html-deck-to-pdf.md` | PDF 导出需求和验收标准。 |
| `tech-spec/export-html-deck-to-pdf.md` | HTML deck 导出 PDF 的技术方案。 |
| `implementation/export-html-deck-to-pdf.md` | PDF 导出执行、验证和 wiki 记录。 |
| `../../repos/ppt/exports/ai-first-talk.pdf` | 可分发的静态 PDF 版本，当前 25 页，已去掉两页“张大猪”。 |

## 决策记录

| 日期 | 决策 | 原因 |
|------|------|------|
| 2026-05-28 | 使用完整生命周期流程。 | 从原始口播到正式 PPT，需要保留清晰过程。 |
| 2026-05-28 | 使用“两次回答同一个问题”的结构。 | 用户希望同一个问题先讲工作流，再讲职业和人生。 |
| 2026-05-28 | 用这个 PPT 项目本身作为工作流例子。 | 形成“PPT 由流程产生，PPT 又讲这个流程”的闭环。 |
| 2026-05-28 | 最终 PPT 采用 HTML 方向。 | 用户希望输出 HTML 格式。 |
| 2026-05-28 | 暂停真正实施，回到 Tech Spec 审核。 | 用户明确 implementation 也是文档阶段，真正实施需单独指令。 |
| 2026-05-28 | 本项目文档使用中文。 | 这是中文分享，后续可能直接演示给听众看。 |
| 2026-05-28 | Tech Spec 通过，进入 implementation 文档阶段。 | 用户确认“挺好的，可以继续下一步”。 |
| 2026-05-28 | PPT 大纲通过，进入逐字稿文档阶段。 | 用户确认“大纲写得可以”。 |
| 2026-05-28 | 逐字稿通过，生成 HTML PPT。 | 用户确认“可以，继续做一下”。 |
| 2026-05-28 | HTML PPT 进入 Review。 | 本地可访问性和结构检查通过。 |
| 2026-05-28 | HTML PPT 迁移到 `repos/ppt/`。 | `implementation/` 应保存实施文档，`repos/` 应保存可运行实现产物。 |
| 2026-05-28 | 在 HTML PPT 中引入两张真实图片素材。 | Claude 邀请邮件和订单截图能增强分享的真实感。 |
| 2026-05-28 | 演讲稿从 HTML notes 中拆出到 `repos/ppt/index.md`。 | HTML 只负责展示，演讲稿单独维护。 |
| 2026-05-28 | HTML PPT 按用户新版演讲稿重排。 | 用户修改了演讲稿风格和章节，HTML 已同步核心展示文案。 |
| 2026-05-28 | 为三个记忆点加入动态效果。 | 张大猪、背锅、裁员三页需要更强的舞台表现力。 |
| 2026-05-28 | 正题页改为标题 + 副标题形式。 | 用户希望正题风格更简单，主要内容由演讲稿承载。 |
| 2026-05-28 | 重新同步工作区文档到当前 HTML/演讲稿状态。 | 当前 HTML 为深色简洁风格、27 页；演讲稿为 19 个章节；HTML 不使用 speaker notes。 |
| 2026-05-28 | Review 通过，项目流程完成。 | 用户确认整个流程已经做完。 |
| 2026-05-28 | Reveal.js 离线化完成。 | 用户要求可以做离线化，HTML 已改为本地 vendor 依赖。 |
| 2026-05-28 | 图片无需脱敏。 | 用户确认图片已检查，无需脱敏。 |
| 2026-05-28 | 增加流程截图展示页。 | 用户补充 raw-input、discovery、requirement、tech-spec、implementation、review、wiki 截图，希望 PPT 有真实图片可看。 |
| 2026-05-28 | 暂缓提交代码。 | 用户要求等整个流程完成后再提交代码。 |
| 2026-05-31 | 增加 PDF 导出产物。 | 用户准备正式分享，需要一份可分发、可离线打开的静态文件。 |
| 2026-05-31 | 将 PDF 导出也纳入工作流文档。 | 用户要求把本次导出补齐为 raw-input、requirements、tech-spec、implementation，并记录到 wiki。 |
| 2026-05-31 | PDF 导出版移除两页“张大猪”。 | 用户明确要求改的是导出的 PDF；当前 PDF 为 25 页，HTML 源仍保留 27 页版本。 |

## 开放问题

- [ ] 正式分享前自行试讲计时。
- [ ] 用户后续确认后再提交代码。

## 下一步

正式分享前按需做可选优化；如果需要对外发送文件，优先使用 `repos/ppt/exports/ai-first-talk.pdf`。
