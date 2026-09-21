cask "runic" do
  version "0.63.0"
  sha256 "76f6274ed5aedf86d94dd3f6743293e952b3b7b50ab8bc5e997f21c3e7b1ed99"

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
