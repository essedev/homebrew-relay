cask "relay" do
  version "0.2.3"
  sha256 "e8aa5a54e93bcc800949f3711c8135c6bd52590e6a620c7eb079b754eb89e915"

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
