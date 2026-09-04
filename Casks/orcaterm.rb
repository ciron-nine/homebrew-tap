cask "orcaterm" do
  # Upstream only publishes a fixed-name "latest" DMG (content replaced on
  # each release), so we track :latest without a checksum pin — every
  # install/reinstall fetches the newest upstream artifact.
  # Verified: Tencent Technology (Shanghai) Co., Ltd. Developer ID + notarized.
  version :latest
  sha256 :no_check
  url "https://orcaterm-desktop-1258344699.cos.ap-guangzhou.myqcloud.com/release/latest/OrcaTerm-latest-mac-universal.dmg",
      verified: "orcaterm-desktop-1258344699.cos.ap-guangzhou.myqcloud.com/release/"
  name "OrcaTerm"
  desc "Tencent Cloud intelligent terminal — SSH/SFTP/RDP client built with Tauri"
  homepage "https://orcaterm.cloud.tencent.com/"

  auto_updates true
  depends_on macos: ">= :big_sur"

  app "OrcaTerm.app"
end
