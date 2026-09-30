cask "relay-terminal" do
  version "0.22.0"
  sha256 "b2653cd1ea4379b9c36e86e7fe10ca4bd8bd5ec837253ea1ece8bc0b625396b9"

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
