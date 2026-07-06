cask "relay" do
  version "0.5.1"
  sha256 "4e7f06d0beeb4e0ffa684e5760ac9151a853c1cd517f6527a694fed3de23714f"

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
