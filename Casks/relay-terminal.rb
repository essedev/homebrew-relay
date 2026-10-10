cask "relay-terminal" do
  version "0.26.0"
  sha256 "b8b6bca7683d01338e4f44c918c3f7f8f423f0e1dacc7470edc35f8f86556108"

  url "https://github.com/essedev/relay/releases/download/v#{version}/Relay-#{version}.dmg"
  name "Relay"
  desc "Agent-aware terminal for running coding agents in parallel"
  homepage "https://github.com/essedev/relay"

  depends_on macos: :sequoia

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
