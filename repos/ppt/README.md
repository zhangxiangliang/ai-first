# PPT HTML Deck

这是 `workspaces/ppt` 工作空间对应的可运行 HTML PPT 产物。

## 文件

| 文件 | 用途 |
|------|------|
| `index.html` | 可在浏览器中演示的 HTML PPT，当前 27 页。 |
| `index.md` | 中文演讲稿，当前 19 个章节。 |
| `vendor/reveal.js/` | 本地 Reveal.js 依赖，支持离线演示。 |

说明：HTML 包含 7 页流程截图展示页和 1 页“谢谢大家”谢幕页，所以 HTML 页数多于演讲稿章节数。

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
