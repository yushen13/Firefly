# 独立个人博客交接

## 当前目标

按 Firefly 主题先搭好可构建、可托管的独立博客，作者为“半醒的鱼”，使用 Cloudflare Pages 的 Git 自动部署。

用户明确推迟：正式站点基础信息、导航与分类设计、关于页正文、第一篇真实文章。当前站点标题暂用作者名，简介为空，头像为明确的临时占位图；未编造个人经历和文章。

## 源码与环境

- 工作目录：`D:\02-项目\codex项目组\个人博客`。
- 个人仓库：<https://github.com/yushen13/Firefly>，默认分支 `master`。
- 上游：<https://github.com/CuteLeaf/Firefly>。
- 初始上游提交：`cd920b035b475fe9a6cd3a88afb42cf9440bb8a9`。
- Firefly 6.16.8，Astro 7.3.2；Node 24.22.1，packageManager 保留 pnpm 11.22.0，首次安装实际执行器为 pnpm 11.25.0，锁文件未更改。
- 机器默认 Node 20.9.0 不满足主题要求，请用 `./scripts/blog.ps1 <命令>`。

## 已做调整

- 作者名配置为“半醒的鱼”，移除上游作者的个人签名和联系方式。
- 上游示例文章、动态、项目及原始关于页保存在 `examples/upstream`，正式集合为空；首页提供空列表提示。
- 关于页仅为“关于页内容稍后补充”。可选个人展示页、音乐入口、示例公告和背景视频入口关闭，保留主题样式及版权归属。
- `.node-version`、`.nvmrc` 固定 Node；`wrangler.jsonc` 声明 Pages 静态目录 `dist`。
- GitHub Pages 部署和全仓 Biome 工作流改为手动；构建工作流使用 Node 24 和完整 `pnpm run build`。
- 详细 Cloudflare 参数见 `docs/cloudflare-pages.md`。

## 验证与部署状态

新增首页空列表提示后，本地 Astro 检查为 0 errors / 0 warnings / 0 hints（259 文件），TypeScript 检查通过，完整构建通过，Pagefind 生成成功。
1440px / 390px 首轮预览没有横向溢出和页面脚本错误；首页、关于页、归档、分类、标签、RSS、站点地图与搜索资源均返回 200。正式 URL 写入后继续复验产物。

Cloudflare 官方设备登录、GitHub App 授权均已由用户完成，8000011 问题已解决。
已创建关联 `yushen13/Firefly` 的 Pages 项目 `banxingdeyu-blog`，`site_url` 为 <https://banxingdeyu-blog.pages.dev>。当前等待代码同步和首次正式部署验证。

凭据不在仓库中；`.artifacts` 和 `.wrangler` 为忽略目录。后续任务需要更新本节为实际完成状态。
