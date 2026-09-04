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

> 注意：腾讯目前只提供固定文件名的 latest 下载链接，本 cask 通过
> sha256 锁定当前版本（1.4.9）。腾讯发布新版后需要更新本 tap 才能升级。
