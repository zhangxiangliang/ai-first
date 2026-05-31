# PPT HTML Deck

这是 `workspaces/ppt` 工作空间对应的可运行 HTML PPT 产物。

## 文件

| 文件 | 用途 |
|------|------|
| `index.html` | 可在浏览器中演示的 HTML PPT 源版本，保持 27 页。 |
| `index.md` | 中文演讲稿，保持 19 个章节。 |
| `exports/ai-first-talk.pdf` | 可分发的静态 PDF 导出版，去掉两页“张大猪”后为 25 页。 |
| `vendor/reveal.js/` | 本地 Reveal.js 依赖，支持离线演示。 |

说明：只有 PDF 导出版去掉了两页“张大猪”。HTML PPT 和中文演讲稿都保留原样：HTML 仍为 27 页，演讲稿仍为 19 个章节。

## 依赖

PPT 使用本地 vendored Reveal.js，不依赖 CDN。

## 对应工作空间

- `../../workspaces/ppt/README.md`
- `../../workspaces/ppt/implementation/ai-first-to-ai-100-talk.md`
- `../../workspaces/ppt/review/ai-first-to-ai-100-talk.md`

## 本地预览

从项目根目录启动静态服务：

```sh
python3 -m http.server 8765
```

然后打开：

```text
http://localhost:8765/repos/ppt/index.html
```

## PDF 导出

当前导出文件：

```text
repos/ppt/exports/ai-first-talk.pdf
```

PDF 是静态快照版本，用于分享前发送、备份或离线查看；现场演示仍优先使用 `index.html`，因为 HTML 保留动画和图片点击放大能力。
