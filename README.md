# ciron-nine/tap

Personal Homebrew tap.

## Install OrcaTerm (Tencent Cloud 智能终端)

```bash
brew tap ciron-nine/tap
brew install --cask ciron-nine/tap/orcaterm
```

OrcaTerm 是腾讯云官方的 SSH/SFTP/RDP 终端客户端（Tauri 构建）。
DMG 下载自腾讯云官方 COS 的**版本化 archive 路径**，已验证腾讯
`Developer ID Application: Tencent Technology (Shanghai) Company Limited`
签名并通过 Apple 公证（Notarized）。

## 版本更新

- 检查新版本：`brew livecheck --cask ciron-nine/tap/orcaterm`
  （自动从 latest DMG 里提取真实版本号）
- 腾讯发新版后：更新 cask 的 `version` + `sha256` 两行并 push
- archive 历史版本从 v1.0.0 起完整保留，旧版可随时回装
