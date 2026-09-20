cask "runic" do
  version "0.62.1"
  sha256 "a0798b15b7adbb8acec0f3327f009424c0f0f75735da75e8ced8e75f02852ffc"

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
