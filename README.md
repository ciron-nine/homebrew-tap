# ciron-nine/tap

Personal Homebrew tap.

## Install OrcaTerm (Tencent Cloud 智能终端)

```bash
brew tap ciron-nine/tap
brew install --cask ciron-nine/tap/orcaterm
```

OrcaTerm 是腾讯云官方的 SSH/SFTP/RDP 终端客户端（Tauri 构建）。
DMG 直接下载自腾讯云官方 COS 源，已验证腾讯
`Developer ID Application: Tencent Technology (Shanghai) Company Limited`
签名并通过 Apple 公证（Notarized）。

## 版本说明

腾讯只提供固定文件名的 `latest` 下载链接（内容随版本更新被覆盖），
因此本 cask 使用 `version :latest` + `sha256 :no_check`：

- `brew install` 每次都会下载当时 CDN 上的最新版
- 重新安装最新版：`brew reinstall --cask ciron-nine/tap/orcaterm`
- app 内置腾讯官方自动更新器，日常新版本由腾讯直接推送，无需 brew 操作
