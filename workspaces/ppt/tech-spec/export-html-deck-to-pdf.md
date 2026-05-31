# Export Html Deck To Pdf Tech Spec

**Status:** Approved
**Owner:** Ben / Codex
**Updated:** 2026-05-31

## Phase Scope

**Standalone:** No
**Reason:** HTML deck 导出 PDF 涉及浏览器渲染、隐藏演示控件、页面尺寸校验和最终产物位置，需要留下可复用技术方案。
**Expected Output:** 一份静态 PDF 导出方案和验证计划。
**Next Phase:** implementation

## Requirement Links

- ../requirements/export-html-deck-to-pdf.md

## Summary

使用本地 HTTP 服务打开 Reveal.js HTML deck，通过 Playwright / Chromium 按页截图，再把每页截图组装成 16:9 PDF。HTML 继续作为可交互源文件，PDF 作为分享前的静态交付物。

## Current System

当前 `repos/ppt/index.html` 是 Reveal.js HTML PPT：

- HTML 源版本共有 27 页。
- PDF 导出版按用户要求去掉“张大猪”相关两页，最终为 25 页。
- 使用本地 `vendor/reveal.js/`，可离线演示。
- 部分页面包含动画、真实截图和点击放大图片能力。
- `repos/ppt/index.md` 是独立中文演讲稿。

HTML 适合现场演示，但不适合直接发送给所有听众或组织者，因此需要导出一份静态 PDF。

## Proposed Approach

1. 在项目根目录启动本地静态 HTTP 服务。
2. 用 Chromium 打开 `http://127.0.0.1:8765/repos/ppt/index.html`。
3. 在页面中隐藏 Reveal.js controls、progress 和自定义 fullscreen button。
4. 调用 `Reveal.slide(index)` 逐页跳转。
5. 对每页截取 16:9 PNG。
6. 使用 PDF 组装库把 PNG 按顺序写入 PDF。
7. 校验页数、页面尺寸和缩略图总览。

## Architecture

```text
repos/ppt/index.html
  -> local HTTP server
  -> Playwright / Chromium render
  -> outputs/ppt-pdf-export/slides/slide-XX.png
  -> reportlab PDF assembly
  -> repos/ppt/exports/ai-first-talk.pdf
```

## Data Model Changes

- 无数据模型变更。

## API Changes

- 无 API 变更。

## UI / UX Changes

- HTML PPT 源文件可以继续保留原始 27 页版本。
- PDF 为静态快照，并按用户要求排除“张大猪”相关两页，因此不保留动画、点击放大和全屏按钮。

## Task Breakdown

| Task | Files / Areas | Acceptance |
|------|---------------|------------|
| 启动本地服务 | repo root | HTML 可通过本地 HTTP 地址访问。 |
| 渲染每页截图 | `outputs/ppt-pdf-export/slides/` | 生成 25 张 slide PNG，排除两页“张大猪”。 |
| 组装 PDF | `repos/ppt/exports/ai-first-talk.pdf` | PDF 生成成功，可离线打开。 |
| 验证导出质量 | PDF / contact sheet | 页数、比例和视觉总览通过。 |
| 补齐流程文档 | `workspaces/ppt/*/export-html-deck-to-pdf.md` | raw-input、requirements、tech-spec、implementation 完整。 |
| 沉淀 wiki | `wiki/workflow/html-deck-workflow.md` | 新增 PDF 导出规则和检查项。 |

## Testing Strategy

### Automated Tests

- [x] 使用脚本确认截图数量为 25。
- [x] 使用 `pypdf` 确认最终 PDF 页数为 25。
- [x] 抽查 PDF 页面尺寸为 960 x 540 point，保持 16:9。

### Manual Tests

- [x] 查看 contact sheet，确认 25 页缩略图均存在。
- [x] 确认最终 PDF 位置正确。
- [x] 确认导出过程没有把控件、进度条和全屏按钮写进页面。

## Rollback Plan

- 删除 `repos/ppt/exports/ai-first-talk.pdf` 即可移除导出产物。
- HTML 源文件不受影响，可重新运行导出流程生成新的 PDF。
- 如果文档描述需要撤回，更新本组 workflow 文档和 wiki 记录即可。

## Risks

- **PDF 不保留交互：** 接受。HTML 是演示源文件，PDF 是静态备份和分发文件。
- **截图导出可能漏页：** 通过 Reveal 页数、截图数量和 PDF 页数三重校验降低风险。
- **字体或图片加载异常：** 使用本地 HTTP 服务并在截图前等待页面渲染完成。
- **敏感图片进入 PDF：** 用户已确认图片无需脱敏。

## Review

**Reviewed By:** Ben / Codex
**Review Date:** 2026-05-31
**Decision:** Approved
**Notes:** 用户要求打包 PDF，并在完成后补齐流程文档和 wiki。

## Wiki Promotion Candidates

- [x] wiki/workflow/html-deck-workflow.md - HTML deck 通过截图方式导出静态 PDF 的技术模式。
