cask "relay-terminal" do
  version "0.24.0"
  sha256 "aa63457441f8db4acc6e81744261063172cbf7fd9d72aefcc23c38c79d831f43"

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
