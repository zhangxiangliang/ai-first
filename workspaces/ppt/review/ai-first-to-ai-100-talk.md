# AI First 到 AI 100 分享 Review

**状态：** Approved
**Owner：** Codex
**更新日期：** 2026-05-31

## 阶段范围

**是否独立阶段：** 否
**原因：** HTML PPT 已生成，需要记录检查结果、未验证项和后续修改任务。
**预期产出：** Review 记录、问题列表、后续行动建议。
**下一阶段：** implementation 或完成

## Reviewed Documents

- `../requirements/ai-first-to-ai-100-talk.md`
- `../context/ai-first-to-ai-100-talk.md`
- `../tech-spec/ai-first-to-ai-100-talk.md`
- `../implementation/ai-first-to-ai-100-talk.md`
- `../implementation/ai-first-to-ai-100-talk-outline.md`
- `../implementation/ai-first-to-ai-100-talk-script.md`
- `../../../repos/ppt/index.html`
- `../../../repos/ppt/index.md`

## 验收标准

| 标准 | 状态 | 证据 |
|------|------|------|
| 逐字稿可支撑 10-20 分钟分享。 | Pass | 用户确认整体流程完成；如正式上台前仍建议自行试讲计时。 |
| 核心问题至少出现两次。 | Pass | 演讲稿第 6 页和第 14 页两次抛出“编码 100% 交给 AI，人做什么？”。 |
| 第一次回答包含 AI-first 工作流和具体例子。 | Pass | 演讲稿第 8-13 页说明需求、流程、项目记忆；第 11 页已用本 PPT 从 raw-input 到 review 的真实过程作为现场例子。 |
| 第二次回答包含职业和人生建议。 | Pass | 演讲稿第 14-18 页讲裁员、真实张力、时代红利和“做自己”。 |
| 开头和结尾保留“张大猪”记忆点。 | Pass | 演讲稿第 2 页和第 19 页保留；HTML 也有张大猪动效和谢幕页。 |
| 交付物包含大纲、逐字稿、HTML PPT。 | Pass | 三个文件均已存在。 |
| HTML PPT 可本地访问。 | Pass | `repos/ppt/index.html` 本地 HTTP 服务返回 200。 |
| HTML PPT 结构完整。 | Pass | 当前 HTML 有 27 个 slide；演讲稿有 19 个章节，HTML 额外包含 7 页流程截图展示页和“谢谢大家”谢幕页。 |
| 演讲稿独立存放。 | Pass | `repos/ppt/index.md` 存放中文演讲稿，不依赖 HTML notes。 |
| HTML 不包含 speaker notes。 | Pass | HTML 无 `<aside class="notes">`，并已移除 Reveal notes 插件。 |
| 用户提供图片已引入。 | Pass | 第 3 页引入 Claude 邀请邮件，第 5 页引入订单截图。 |
| 关键记忆点加入动效。 | Pass | 张大猪、背锅、裁员三页已加入 CSS 动画。 |
| 正题页视觉简化。 | Pass | 当前 HTML 为深色简洁风格，正题页主要使用 `simple-slide` 的标题 + 副标题形式。 |
| PDF 导出版去掉“张大猪”两页。 | Pass | `repos/ppt/exports/ai-first-talk.pdf` 已重新导出为 25 页；HTML 源版本仍保留 27 页。 |

## Test Results

| 测试 | 结果 | 说明 |
|------|------|------|
| `./scripts/scaffold.sh lint` | Pass | Scaffold lint passed. |
| 本地 HTTP 访问 | Pass | `curl -I http://localhost:8765/repos/ppt/index.html` 返回 `HTTP/1.0 200 OK`。 |
| HTML 结构检查 | Pass | 27 slides，0 aside notes，不加载 Reveal notes 插件，存在 `Reveal.initialize`。 |
| Reveal.js 离线依赖检查 | Pass | HTML 已改为引用 `repos/ppt/vendor/reveal.js/` 下的本地 CSS/JS。 |
| 图片资源检查 | Pass | `repos/ppt/assets/claude-invite-email.png` 和 `repos/ppt/assets/daily-flow-orders.png` 存在，HTML 引用存在。 |
| 动效结构检查 | Pass | HTML 包含 `pig-slide`、`blame-slide` 等特殊动效页。 |
| 简洁版式检查 | Pass | HTML 主要使用 `simple-slide`；正题内容由演讲稿承载。 |
| 自动截图视觉检查 | Pass | 已生成 25 页 PDF contact sheet，确认不包含两页“张大猪”。 |
| 试讲计时 | Pass | 用户确认流程完成；正式分享前仍建议自行试讲一次。 |

## 发现的问题

| 问题 | 严重程度 | 处理建议 |
|------|----------|----------|
| 图片包含真实业务/邮件信息。 | Accepted | 用户确认图片不用脱敏。 |
| HTML 与演讲稿页数不完全相同。 | Accepted | 用户后续补充流程截图并要求加入 PPT；当前 27 页，其中 7 页为截图展示页，另有额外“谢谢大家”谢幕页。 |
| HTML 与 PDF 页数不完全相同。 | Accepted | 用户明确要求改的是导出的 PDF；PDF 去掉两页“张大猪”后为 25 页。 |

## 后续工作

- [x] 正式分享前自行试讲计时。
- [x] Reveal.js 已下载到本地，可离线演示。
- [x] 图片无需脱敏，用户已确认。
- [x] 使用 27 页 HTML 版本，包含用户补充的流程截图展示页。
- [x] 使用 25 页 PDF 导出版，已去掉两页“张大猪”。

## Final Decision

**Decision：** Approved
**Decided By：** Ben / Codex
**Date：** 2026-05-31
**Notes：** 用户确认整个流程完成。HTML PPT、独立演讲稿、素材、工作区文档均已对齐；Reveal.js 已离线化；图片无需脱敏；当前保留 27 页 HTML 源版本，其中新增 7 页流程截图展示页。PDF 导出版已按用户要求去掉两页“张大猪”，当前为 25 页。提交代码暂缓到用户后续指令。

## Wiki Promotion Candidates

- [x] `wiki/workflow/ai-first-development.md` - 分享内容稳定后，可沉淀 AI-first 工作流。
- [x] `wiki/workflow/html-deck-workflow.md` - HTML PPT 制作流程稳定后，可沉淀为复用方案。
