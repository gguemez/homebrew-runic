cask "runic" do
  version "0.61.0"
  sha256 "e814cc5a5e54fb5f94ee6db907ae4a2dc37f8d5768de9c597eae69cd58a22a7a"

  url "https://dl.runic.guemez.net/Runic-#{version}.dmg",
      verified: "dl.runic.guemez.net/"
  name "Runic"
  desc "Editor that opens multi-gigabyte files in under a second"
  homepage "https://runic.guemez.net/"

  # The same feed the app itself checks for updates, so the cask can never
  # advertise a version that was never published.
  livecheck do
    url "https://dl.runic.guemez.net/appcast.json"
    strategy :json do |json|
      json["version"]
    end
  end

  depends_on macos: :ventura

  app "Runic.app"

  # Everything Runic creates outside the bundle. keymap.json and
  # decoration-rules.json are user-authored, so this is destructive by design —
  # which is why it is `zap` (opt-in via --zap) and not `uninstall`.
  zap trash: [
    "~/Library/Application Support/Runic",
    "~/Library/Preferences/net.guemez.Runic.plist",
    "~/Library/Saved Application State/net.guemez.Runic.savedState",
    "~/Library/Caches/net.guemez.Runic",
  ]
end
