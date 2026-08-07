cask "relay" do
  version "0.15.0"
  sha256 "5c6892b4213d03ac6e0eadace7a0566419753d4d1d3407124bebc992e600b266"

  url "https://github.com/essedev/relay/releases/download/v#{version}/Relay-#{version}.dmg"
  name "Relay"
  desc "Agent-aware native macOS terminal"
  homepage "https://github.com/essedev/relay"

  depends_on macos: :sonoma

  app "Relay.app"

  # Rimuove la quarantena dopo l'install: niente warning Gatekeeper "app non verificata"
  # (Relay non è notarizzato). Bypassa il controllo solo per Relay.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/Relay.app"]
  end

  zap trash: [
    "~/.relay",
    "~/Library/Preferences/dev.relay.app.plist",
  ]
end
