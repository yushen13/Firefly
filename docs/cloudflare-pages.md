# Cloudflare Pages 部署

个人仓库：<https://github.com/yushen13/Firefly>
上游主题：<https://github.com/CuteLeaf/Firefly>

Pages 项目：`banxingdeyu-blog`，站点地址：<https://banxingdeyu-blog.pages.dev>。

首次正式部署已成功；`master` 推送自动部署与分支预览已启用。当前产物已通过线上桌面、手机和主要地址检查，记录见 `docs/handoff.md`。

这是静态 Astro 博客，部署目标为 Cloudflare **Pages + Git 集成**。不要创建 Direct Upload 项目，否则不能直接切换为 Git 自动部署。

## 首次部署配置

在 Cloudflare 的 Workers & Pages 中选择创建应用 → Pages → 导入现有 Git 仓库，授权 GitHub 后选择 `yushen13/Firefly`。

| 配置 | 值 |
| --- | --- |
| 生产分支 | `master` |
| Framework preset | Astro |
| 根目录 | 仓库根目录，留空 |
| 构建命令 | `pnpm run build` |
| 构建输出目录 | `dist` |
| `NODE_VERSION` | `24.22.1` |
| `PNPM_VERSION` | `11.22.0` |

保持 `CF_WORKERS` 未设置。本项目在该变量存在时会启用 Cloudflare Workers 适配器并改变输出结构；Pages 静态托管不需要它。

Pages 项目创建后，将真实的 `https://<项目名>.pages.dev` 写入 `src/config/siteConfig.ts` 的 `site_url`，再触发正式构建。绑定自定义域名后也要更新这里，保证 canonical、RSS、站点地图和结构化数据正确。

站点 URL 已设为 `https://banxingdeyu-blog.pages.dev`。站点标题暂用已提供的作者名“半醒的鱼”，正式标题、副标题、简介与头像等待补充。

发布后检查首页、关于页、归档页、空分类/标签页、RSS、站点地图和 Pagefind 文件；后续推送 `master` 会自动重新部署。

不要使用 `pnpm astro build` 替代 `pnpm run build`：完整命令还会生成搜索索引及优化产物。

官方文档：<https://developers.cloudflare.com/pages/framework-guides/deploy-an-astro-site/>

## Windows 本地使用

此机器默认 Node 20 不符合主题要求。已提供脚本自动选择现有 Node 24：

```powershell
./scripts/blog.ps1 install
./scripts/blog.ps1 dev
./scripts/blog.ps1 check
./scripts/blog.ps1 type-check
./scripts/blog.ps1 build
./scripts/blog.ps1 preview
```

源码内容可在本地开发服务器预览，全文搜索需在完整构建后预览。
Cloudflare 凭据由官方 Wrangler 登录流程管理，不写入本仓库。
