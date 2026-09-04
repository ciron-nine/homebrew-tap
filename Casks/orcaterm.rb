cask "orcaterm" do
  version "1.4.9"
  sha256 "680452b12a7b3d875fe63e40cf68bca1d1b7be9bf3b1984d2cfe6ed6ab35f69e"

  # Upstream only publishes a fixed-name "latest" DMG (content replaced on
  # each release). The sha256 below pins the current upstream artifact; update
  # both version and sha256 when Tencent ships a new build.
  # Verified: Tencent Technology (Shanghai) Co., Ltd. Developer ID + notarized.
  url "https://orcaterm-desktop-1258344699.cos.ap-guangzhou.myqcloud.com/release/latest/OrcaTerm-latest-mac-universal.dmg",
      verified: "orcaterm-desktop-1258344699.cos.ap-guangzhou.myqcloud.com/release/"
  name "OrcaTerm"
  desc "Tencent Cloud intelligent terminal — SSH/SFTP/RDP client built with Tauri"
  homepage "https://orcaterm.cloud.tencent.com/"

  livecheck do
    skip "Upstream only ships a fixed-name 'latest' DMG; no versioned URL or version feed published"
  end

  auto_updates true
  depends_on macos: ">= :big_sur"

  app "OrcaTerm.app"
end
