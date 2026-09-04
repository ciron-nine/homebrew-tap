#!/bin/bash
# update-orcaterm.sh — 腾讯发新版后一键更新本 tap 的 cask
# 用法: ./update-orcaterm.sh [--push]
set -euo pipefail

URL="https://orcaterm-desktop-1258344699.cos.ap-guangzhou.myqcloud.com/release/latest/OrcaTerm-latest-mac-universal.dmg"
CASK="$(dirname "$0")/../Casks/orcaterm.rb"
TMP=$(mktemp -d)
trap 'rm -rf "$TMP"' EXIT
MNT="$TMP/mnt"; mkdir -p "$MNT"

echo "==> 下载 latest DMG..."
curl -sL --fail -o "$TMP/o.dmg" "$URL"

echo "==> 计算 sha256..."
SHA=$(shasum -a 256 "$TMP/o.dmg" | awk '{print $1}')

echo "==> 读取 app 版本..."
hdiutil attach -nobrowse -readonly -mountpoint "$MNT" "$TMP/o.dmg" >/dev/null
VER=$(plutil -extract CFBundleShortVersionString raw "$MNT/OrcaTerm.app/Contents/Info.plist")
hdiutil detach "$MNT" -quiet

echo "==> 上游版本: $VER  sha256: $SHA"
OLD_VER=$(sed -n 's/^  version "\(.*\)"$/\1/p' "$CASK")
OLD_SHA=$(sed -n 's/^  sha256 "\(.*\)"$/\1/p' "$CASK")

if [ "$VER" = "$OLD_VER" ] && [ "$SHA" = "$OLD_SHA" ]; then
  echo "==> 无变化 (当前 cask 已是 $VER)，退出"
  exit 0
fi

sed -i '' \
  -e "s/^  version \".*\"$/  version \"$VER\"/" \
  -e "s/^  sha256 \".*\"$/  sha256 \"$SHA\"/" "$CASK"

git -C "$(dirname "$CASK")/.." add Casks/orcaterm.rb
git -C "$(dirname "$CASK")/.." -c user.name="ciron-nine" \
  -c user.email="ciron-nine@users.noreply.github.com" \
  commit -m "orcaterm $VER" >/dev/null && echo "==> 已提交: orcaterm $VER"

if [ "${1:-}" = "--push" ]; then
  git -C "$(dirname "$CASK")/.." push origin main >/dev/null && echo "==> 已推送到 GitHub，用户 brew upgrade 即可"
else
  echo "==> 未推送 (加 --push 参数自动推送)"
fi
