# 独立个人博客交接

## 当前目标

按 Firefly 主题先搭好可构建、可托管的独立博客，作者为“半醒的鱼”，使用 Cloudflare Pages 的 Git 自动部署。

用户仍推迟：正式站点基础信息、导航与分类设计、关于页正文。2026-11-01 用户授权上传 `D:\04-文档\个人随笔` 中的 11 篇随笔；文章正文保留原文，按用户后续要求删除正文内原始日期行，原日期继续保留在 `published` 元数据中以维持时间排序；11 篇统一归类为“随笔”。站点标题暂用作者名，简介为空；首页横幅显示用户提供的文案“从心而观，其间似远。”，头像使用用户提供的图片。

## 源码与环境

- 工作目录：`D:\02-项目\codex项目组\个人博客`。
- 个人仓库：<https://github.com/yushen13/Firefly>，默认分支 `master`。
- 上游：<https://github.com/CuteLeaf/Firefly>。
- 初始上游提交：`cd920b035b475fe9a6cd3a88afb42cf9440bb8a9`。
- Firefly 6.16.8，Astro 7.3.2；Node 24.22.1，packageManager 保留 pnpm 11.22.0，首次安装实际执行器为 pnpm 11.25.0，锁文件未更改。
- 机器默认 Node 20.9.0 不满足主题要求，请用 `./scripts/blog.ps1 <命令>`。

## 已做调整

- 作者名配置为“半醒的鱼”，移除上游作者的个人签名和联系方式。
- 用户提供的头像保存为 `public/images/avatar.png` 并用于个人资料；首页横幅隐藏主标题，静态显示“从心而观，其间似远。”。
- 上游示例文章、动态、项目及原始关于页保存在 `examples/upstream`。正式文章集合已加入 11 篇用户随笔的 Markdown 版本；Word 标题与发布日期写入 frontmatter，正文原始日期行已按用户要求移除，独立标题和引文转换为 Firefly 支持的 Markdown 格式。
- 关于页仅为“关于页内容稍后补充”。外观设置面板保持开启；音乐导航入口已开启，使用本地歌单模式，已同步个人网站的 5 首曲目、封面和 LRC 歌词，显示歌词开关开启，保留每首歌的歌词起始显示时间；侧栏播放器保持关闭。可选个人展示页、示例公告和背景视频入口关闭，保留主题样式及版权归属。
- `.node-version`、`.nvmrc` 固定 Node；`wrangler.jsonc` 声明 Pages 静态目录 `dist`。
- GitHub Pages 部署和全仓 Biome 工作流改为手动；构建工作流使用 Node 24 和完整 `pnpm run build`。
- 详细 Cloudflare 参数见 `docs/cloudflare-pages.md`。

## 验证与部署状态

新增首页空列表提示后，本地 Astro 检查为 0 errors / 0 warnings / 0 hints（259 文件），TypeScript 检查通过，完整构建通过，Pagefind 生成成功。本轮头像与横幅修改后，`./scripts/blog.ps1 build` 再次通过；生成结果含用户头像和指定标语，横幅标题元素已移除。
先前本地及线上 Chrome 均通过 1440px / 390px 检查，没有横向溢出、页面脚本错误或上游示例文章。本轮没有生成首页预览，按用户要求仅更新头像与横幅文案。最新线上首页和头像资源均返回 HTTP 200，首页 HTML 含指定标语且不含横幅主标题元素。
线上首页、关于页、归档、分类、标签、RSS、站点地图与 Pagefind 资源共 8 个地址均返回 200。产物 canonical、RSS、站点地图使用正式 Pages 地址，不含本地站点 URL。
日志和截图在忽略目录 `.artifacts`，其中 `live-qa.json` 为线上检查结果，`live-1440.png`、`live-390.png` 为截图。2026-11-01 随笔导入与后续调整后，Cloudflare 构建成功；正式文章索引返回 11 篇，发布日期从新到旧排序。11 个文章详情页均返回 HTTP 200，原始正文日期行均已移除；首页“随笔”分类、分类筛选、音乐入口及外观设置按钮均已在线确认。2026-11-03 音乐同步后，Cloudflare 再次构建成功；首页音乐配置含 5 首歌曲，音频、封面、歌词共 15 个线上资源均返回 HTTP 200。

Cloudflare 官方设备登录、GitHub App 授权均已由用户完成，8000011 问题已解决。
已创建关联 `yushen13/Firefly` 的 Pages 项目 `banxingdeyu-blog`，站点 <https://banxingdeyu-blog.pages.dev> 已正式上线。
本次 5 首音乐与歌词同步提交：`48b58fd711886aaed2917585a7f44be7a7a7be83`。
最新生产部署 ID：`22ca7dc4-1983-4814-823f-fb502d65b7bf`，Cloudflare 返回 production / build / deploy / success。此前随笔归类和正文日期清理提交为 `989f67a3828ee78ca898669ba37f377ceff108e5`；文章导入提交为 `458d49b4126ff5f4fec89c917cee276c8a8834cd`；初次部署提交 `a6cba13a57081ebf3fe59a9e81d15431e6f5bfd5` 的部署 ID 为 `80289e66-ec08-4222-88ce-99e3affbbfa5`。

## 音乐歌单

- 已公开发布的歌单资源位于 `public/assets/music/personal-site/{audio,covers,lyrics}/`；五首歌曲顺序与个人网站一致。该目录下文件是由用户确认同步的公开媒体。
- 继续添加本地歌曲：把音频放进 `public/assets/music/`，在 `src/config/musicConfig.ts` 的 `local.playlist` 中添加 `{ name: "曲名", artist: "作者", url: "/assets/music/文件名.mp3" }`；可选填写 `cover`、`lrc` 和 `lyricsStart`（秒）。文件 URL 相对于 `public` 目录。
- 网易云歌单：提供歌单链接或 ID 后，将 `mode` 改为 `"meting"`，填写 `meting.id`；当前 `server` 为 `"netease"`、`type` 为 `"playlist"`。
- 添加完成后提交 GitHub，Cloudflare Pages 会自动构建发布。
生产分支为 `master`，Git 自动部署已启用，其他分支自动预览已启用。最终交接记录通过 `[skip ci]` 文档提交同步，不重复构建已验证的源码。

凭据不在仓库中；`.artifacts` 和 `.wrangler` 为忽略目录。本地检查所用预览进程在交接时关闭，线上访问不受影响。
