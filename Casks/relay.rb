cask "relay" do
  version "0.7.4"
  sha256 "9e317904c24a90b2cf22deb1a7bd64ce056ec8892522a2ce5c0eeb2363ef83a0"

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
