# Export Html Deck To Pdf Requirements

**Status:** Approved
**Owner:** Ben / Codex
**Updated:** 2026-05-31

## Phase Scope

**Standalone:** No
**Reason:** HTML PPT 已经完成，用户希望在正式分享前把它打包成可分发、可离线查看的 PDF，并将这个导出动作补齐为可追溯流程。
**Expected Output:** 生成最终 PDF，并补齐 raw-input、requirements、tech-spec、implementation 与 wiki 记录。
**Next Phase:** tech-spec

## Goal

把 `repos/ppt/index.html` 导出为一份静态 PDF，同时把导出方法沉淀为可复用的 HTML deck 工作流知识。

## Background

当前 PPT 是 Reveal.js HTML deck，适合现场演示和保留动效，但分享前通常还需要一个更稳定的静态文件用于备份、发送或打印。用户最初询问是否能打包成真正的 PPT，随后明确 PDF 也可以，因此本次优先产出 PDF。

## Users / Actors

| Actor | Need |
|-------|------|
| Ben | 正式分享前拥有一份可分发、可离线打开的 PDF 版本。 |
| 听众 / 分享组织者 | 可以在不运行 HTML 的情况下查看完整内容。 |
| 后续 AI Agent | 能从文档里复用 HTML deck 导出 PDF 的方法和检查项。 |

## Tickets

| Ticket ID | Source | Summary | Status |
|-----------|--------|---------|--------|
| `PPT-TICKET-002` | ../raw-input/export-html-deck-to-pdf.md | 将 HTML PPT 导出为 PDF，并补齐流程文档和 wiki。 | Done |

## Functional Requirements

| ID | Requirement |
|----|-------------|
| `PPT-REQ-016` | PDF 必须基于当前 `repos/ppt/index.html` 生成。 |
| `PPT-REQ-017` | PDF 应保留 16:9 演示比例，并覆盖 HTML deck 的全部页面。 |
| `PPT-REQ-018` | 导出时不应显示 Reveal.js 控件、进度条或全屏按钮。 |
| `PPT-REQ-019` | 最终 PDF 应放在 `repos/ppt/exports/` 下，作为 PPT 项目的正式导出产物。 |
| `PPT-REQ-020` | 导出流程、验证结果和可复用规则应写入 workspace 文档与 wiki。 |
| `PPT-REQ-021` | 最终 PDF 导出版应去掉“张大猪”相关两页。 |

## Non-Functional Requirements

- PDF 是静态交付物，不要求保留动画、点击放大或浏览器交互。
- 导出过程应优先保证视觉还原，而不是追求可编辑性。
- 导出文件应可离线打开。
- 过程文档使用中文，方便在中文分享中演示工作流。

## Acceptance Criteria

| Requirement ID | Criterion | Status |
|----------------|-----------|--------|
| `PPT-REQ-016` | 已从 `repos/ppt/index.html` 渲染导出。 | Pass |
| `PPT-REQ-017` | PDF 页数为 25 页，页面尺寸为 16:9。 | Pass |
| `PPT-REQ-018` | 导出截图时已隐藏演示控件、进度条和全屏按钮。 | Pass |
| `PPT-REQ-019` | 最终文件位于 `repos/ppt/exports/ai-first-talk.pdf`。 | Pass |
| `PPT-REQ-020` | 已补齐本组流程文档，并更新 `wiki/workflow/html-deck-workflow.md`。 | Pass |
| `PPT-REQ-021` | PDF 最终为 25 页，已去掉两页“张大猪”。 | Pass |

## Scope

### In Scope

- 从 HTML PPT 生成 PDF。
- 保存最终 PDF 到 `repos/ppt/exports/`。
- 最终 PDF 导出版去掉“张大猪”相关两页。
- 记录导出命令、验证方式、风险和 wiki 规则。
- 更新相关 README，让入口文档能找到 PDF。

### Out of Scope

- 不制作 `.pptx` 版本。
- 不把 HTML 动画转换为 PDF 动画。
- 不重写 PPT 内容和演讲稿。

## Dependencies

- `repos/ppt/index.html`
- 本地静态 HTTP 服务。
- Chromium / Playwright 渲染能力。
- Python PDF 组装能力。

## Open Questions

- [x] 是否接受 PDF 而不是 PPTX？用户已确认“或者打包成 PDF”。
- [x] 导出相关文档是否可以用中文？用户已确认可以。

## Source Traceability

| Requirement ID | Ticket ID | Source | Notes |
|----------------|-----------|--------|-------|
| `PPT-REQ-016` | `PPT-TICKET-002` | ../raw-input/export-html-deck-to-pdf.md | 用户要求打包当前 PPT。 |
| `PPT-REQ-017` | `PPT-TICKET-002` | ../raw-input/export-html-deck-to-pdf.md | 分享用 PDF 需要完整覆盖 deck。 |
| `PPT-REQ-018` | `PPT-TICKET-002` | ../raw-input/export-html-deck-to-pdf.md | 由 PDF 交付质量推导。 |
| `PPT-REQ-019` | `PPT-TICKET-002` | ../raw-input/export-html-deck-to-pdf.md | `repos/ppt` 是最终产物目录。 |
| `PPT-REQ-020` | `PPT-TICKET-002` | ../raw-input/export-html-deck-to-pdf.md | 用户明确要求补齐流程和 wiki。 |
| `PPT-REQ-021` | `PPT-TICKET-002` | ../raw-input/export-html-deck-to-pdf.md | 用户明确要求导出的 PDF 去掉“张大猪”两页。 |

## Approval

**Approved By:** Ben
**Approval Date:** 2026-05-31
**Notes:** 用户已要求继续按流程补齐导出文档。

## Wiki Promotion Candidates

- [x] wiki/workflow/html-deck-workflow.md - HTML deck 的静态 PDF 导出规则。
