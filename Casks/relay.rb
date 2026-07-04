cask "relay" do
  version "0.2.6"
  sha256 "b241f8c3062cbc9cf7b5e0761bd50a8c149e2ab530de04b28a1154c0c1c279ac"

  url "https://github.com/essedev/relay/releases/download/v#{version}/Relay-#{version}.dmg"
  name "Relay"
  desc "Terminale macOS nativo agent-aware"
  homepage "https://github.com/essedev/relay"

  depends_on macos: :sonoma

  app "Relay.app"

  # Rimuove la quarantena dopo l'install: niente warning Gatekeeper "app non verificata"
  # (Relay non e notarizzato). Bypassa il controllo solo per Relay.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/Relay.app"]
  end

  zap trash: [
    "~/.relay",
    "~/Library/Preferences/dev.relay.app.plist",
  ]
end
