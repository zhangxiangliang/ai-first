# AI First 到 AI 100 分享 Tech Spec

**状态：** Approved
**Owner：** Codex
**更新日期：** 2026-05-28

## 阶段范围

**是否独立阶段：** 否  
**原因：** 在真正生成 PPT 大纲、逐字稿和 HTML PPT 前，需要先确认技术方案、输出文件、审核方式和实施边界。  
**预期产出：** 一份可审核的实施方案。  
**下一阶段：** implementation 文档阶段，但必须在用户审核通过后进入。

## 关联需求

- `../requirements/ai-first-to-ai-100-talk.md`
- `../context/ai-first-to-ai-100-talk.md`

## 摘要

本项目最终产出一套可在浏览器中演示的 HTML PPT，以及配套的 PPT 大纲和独立演讲稿。分享时间为 10-20 分钟，面向即将毕业的大学生。

这套 PPT 的一个重要设计点是“原汤化原食”：PPT 本身就是通过 AI-first 工作流产生的，而 PPT 内容又会向听众解释这套工作流。

## 当前系统状态

当前工作空间已有：

- `raw-input/`：原始录音转文字稿。
- `discovery/`：主题、受众、风险和开放问题。
- `requirements/`：需求、范围、验收标准。
- `context/`：确认信息、转写纠错、叙事骨架。
- `tech-spec/`：当前文档。

当前已经在 `repos/ppt/` 下生成 HTML PPT 产物。该产物是静态 HTML，不依赖包管理器或构建步骤。

## 推荐方案

在 `workspaces/ppt/implementation/` 下创建实施阶段文档，在 `repos/ppt/` 下放置真正可运行的 HTML PPT 产物。

建议按以下顺序推进：

1. 先创建 PPT 大纲文档，确认故事结构和每页目的。
2. 再创建逐字稿文档，对齐每页 slide。
3. 用户审核大纲和逐字稿。
4. 用户明确要求继续后，在 `repos/ppt/` 生成完整 HTML PPT。
5. 根据用户反馈调整视觉风格、图片素材、动效和页面结构。
6. 打开 HTML PPT 做视觉检查、导航检查和时间检查。
7. 进入 review 阶段记录问题和修改建议。

## HTML PPT 技术选择

### 方案 A：Reveal.js

Reveal.js 是开源 HTML presentation framework，适合做浏览器里的演示幻灯片。本项目当前已将 Reveal.js vendor 到 `repos/ppt/vendor/reveal.js/`，支持离线演示。

优点：

- 自带翻页、进度、键盘导航。
- 适合 16:9 演示场景。
- 后续可以导出或打印成 PDF。

当前状态：

- 已使用本地 `vendor/reveal.js/dist/reveal.css`。
- 已使用本地 `vendor/reveal.js/dist/theme-black.css`。
- 已使用本地 `vendor/reveal.js/dist/reveal.js`。

### 方案 B：自定义 HTML/CSS/JS

优点：

- 完全可控。
- 可以做成单文件或少量本地文件。
- 没有框架依赖。

缺点：

- 需要自己实现翻页、进度、speaker notes 等能力。
- 后续维护成本更高。

### 初始建议

当前采用本地 vendored Reveal.js，不使用 speaker notes。演讲稿单独维护在 `repos/ppt/index.md`。

## 目标文件结构

```text
workspaces/ppt/
├── raw-input/
│   └── ai-first-to-ai-100-talk.md
├── discovery/
│   └── ai-first-to-ai-100-talk.md
├── requirements/
│   └── ai-first-to-ai-100-talk.md
├── context/
│   └── ai-first-to-ai-100-talk.md
├── tech-spec/
│   └── ai-first-to-ai-100-talk.md
├── implementation/
│   ├── ai-first-to-ai-100-talk.md
│   ├── ai-first-to-ai-100-talk-outline.md
│   └── ai-first-to-ai-100-talk-script.md
└── review/
    └── ai-first-to-ai-100-talk.md

repos/
└── ppt/
    ├── README.md
    ├── index.html
    ├── index.md
    ├── vendor/
    │   └── reveal.js/
    └── assets/
```

说明：

- `implementation/ai-first-to-ai-100-talk.md`：实施阶段的状态记录，不是最终 PPT。
- `outline.md`：PPT 大纲。
- `script.md`：逐字稿工作区版本。
- `repos/ppt/index.md`：最终演讲稿，和 HTML PPT 对齐。
- `repos/ppt/index.html`：最终 HTML PPT，可在浏览器中演示。
- `repos/ppt/vendor/reveal.js/`：本地 Reveal.js 依赖。
- `repos/ppt/assets/`：图片、截图或其他视觉素材。

## 内容结构要求

HTML PPT 应该围绕同一个问题展开：

> 编码 100% 交给 AI，人做什么？

这个问题需要回答两次：

1. 工作流答案：人负责讲清楚问题、提供上下文、定义验收、判断结果、沉淀项目记忆。
2. 职业/人生答案：人要做自己，主动尝试、验证想法、建立判断和作品。

## UI / UX 要求

当前 HTML PPT 应该：

- 使用 16:9 演示布局。
- 保证投影环境下文字清晰。
- 正题页面使用“标题 + 副标题”的简洁形式。
- 用“编码 100% 交给 AI，人做什么？”作为视觉锚点。
- 明确区分两次回答：
  - 第一次：AI 工作流教学。
  - 第二次：职业和人生建议。
- 保留“张大猪”的开头和结尾。
- 将 Claude 邀请邮件和订单截图作为真实素材引入。
- 为“张大猪”“背锅”“裁员”三个记忆点添加动效。
- HTML 中不放 speaker notes，演讲稿独立放在 `repos/ppt/index.md`。
- 整体风格应幽默、真诚、像个人分享，不要像通用 AI 趋势报告。

## 任务拆分

| 任务 | 文件 / 区域 | 验收标准 |
|------|-------------|----------|
| 写 implementation 状态文档 | `implementation/ai-first-to-ai-100-talk.md` | 记录任务、状态、决策、偏差，不生成最终内容。 |
| 写 PPT 大纲 | `implementation/ai-first-to-ai-100-talk-outline.md` | 覆盖 10-20 分钟，两次回答结构清楚。 |
| 写逐字稿 | `implementation/ai-first-to-ai-100-talk-script.md` | 中文口语自然，和 slide 对齐。 |
| 生成 HTML PPT | `repos/ppt/index.html` | 可在浏览器中演示；当前为 27 页，包含 7 页流程截图展示页和额外谢幕页。 |
| 维护演讲稿 | `repos/ppt/index.md` | 当前为 19 个演讲稿章节，对应 HTML PPT 主体；HTML 额外包含“谢谢大家”谢幕页。 |
| 添加视觉素材 | `repos/ppt/assets/` | 素材服务叙事，不做无意义装饰。 |
| Review | `review/ai-first-to-ai-100-talk.md` | 检查时间、可读性、叙事、风险和用户反馈。 |

## 验证策略

### 自动检查

- [ ] 运行 `./scripts/scaffold.sh lint`。
- [ ] 检查 HTML 引用的本地资源是否存在。

### 人工检查

- [ ] 浏览器打开 HTML PPT。
- [ ] 检查 16:9 布局。
- [ ] 检查文字是否溢出。
- [ ] 检查键盘翻页。
- [ ] 计时试讲，确认 10-20 分钟内可完成。
- [ ] 检查两次回答是否清楚。
- [ ] 检查 HTML 27 页和演讲稿 19 个章节之间的对应关系是否符合演示习惯。

## 回滚方案

文档产物限制在 `workspaces/ppt/` 内；可运行 HTML PPT 放在 `repos/ppt/`。若方案不合适，可以删除或重写 `repos/ppt/` 的实现产物，并修订 implementation/review 阶段文件，不影响 raw-input、discovery、requirements、context 和 tech-spec。

## 风险

- 使用 CDN 可能导致离线演示失败。缓解方式：实施时改为本地 vendor Reveal.js。
- 逐字稿可能超过 20 分钟。缓解方式：根据试讲结果删减小生意、流程解释或裁员段落。
- 工作流部分可能太抽象。缓解方式：使用这个 PPT 项目本身作为示例。
- AI 代写/PPT 小生意部分可能被理解成鼓励低质量交付。缓解方式：强调市场验证和勇于尝试，不把低质量当目标。
- 裁员和公司例子可能显得负面。缓解方式：作为个人观察讲，不点名，不做攻击。
- Reveal.js 已离线化。后续若升级 Reveal.js，需要同步更新 `repos/ppt/vendor/reveal.js/`。

## 审核

**审核人：** 张向亮
**审核日期：** 2026-05-28
**结论：** Approved
**说明：** 用户确认 Tech Spec 后已进入 implementation，并已生成当前 HTML PPT 与独立演讲稿。当前文档已按最终实现同步更新。

## Wiki Promotion Candidates

- [x] `wiki/workflow/html-deck-workflow.md` - 如果这套 HTML PPT 流程被验证有效，可以沉淀为复用方法。
