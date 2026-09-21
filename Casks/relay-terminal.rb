cask "relay-terminal" do
  version "0.20.0"
  sha256 "f41ad02d704c10dd10ac6e2f2f7cceeb359a575188d42de9ad2b4d8d2cc8c4b7"

  url "https://github.com/essedev/relay/releases/download/v#{version}/Relay-#{version}.dmg"
  name "Relay"
  desc "Agent-aware terminal for running coding agents in parallel"
  homepage "https://github.com/essedev/relay"

  depends_on macos: :sonoma

  # I due eseguibili vivono dentro il bundle (Relay.app/Contents/MacOS). Senza i symlink
  # `relay-cli hooks setup` e `relay --demo`, documentati nel README, non sarebbero raggiungibili
  # da shell per chi installa col cask.
  app "Relay.app"
  binary "#{appdir}/Relay.app/Contents/MacOS/relay-cli"
  binary "#{appdir}/Relay.app/Contents/MacOS/relay"

  # Rimuove la quarantena dopo l'install: niente warning Gatekeeper "app non verificata"
  # (Relay non è notarizzato). Bypassa il controllo solo per Relay.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-cr", "{{appdir}}/Relay.app"]
  end

  zap trash: [
    "~/.relay",
    "~/Library/Preferences/dev.relay.app.plist",
  ]
end
