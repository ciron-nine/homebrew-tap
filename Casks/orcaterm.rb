cask "orcaterm" do
  version "1.4.9"
  sha256 "680452b12a7b3d875fe63e40cf68bca1d1b7be9bf3b1984d2cfe6ed6ab35f69e"

  url "https://orcaterm-desktop-1258344699.cos.ap-guangzhou.myqcloud.com/release/archive/v#{version}/OrcaTerm-#{version}-mac-universal.dmg",
      verified: "orcaterm-desktop-1258344699.cos.ap-guangzhou.myqcloud.com/release/archive/"
  name "OrcaTerm"
  desc "Tencent Cloud intelligent terminal — SSH/SFTP/RDP client built with Tauri"
  homepage "https://orcaterm.cloud.tencent.com/"

  livecheck do
    url "https://orcaterm-desktop-1258344699.cos.ap-guangzhou.myqcloud.com/release/latest/OrcaTerm-latest-mac-universal.dmg"
    strategy :extract_plist
  end

  auto_updates true
  depends_on macos: ">= :big_sur"

  app "OrcaTerm.app"
end
