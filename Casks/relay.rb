cask "relay" do
  version "0.0.0"
  sha256 "0000000000000000000000000000000000000000000000000000000000000000"

  url "https://github.com/essedev/relay/releases/download/v#{version}/Relay-#{version}.dmg"
  name "Relay"
  desc "Terminale macOS nativo agent-aware"
  homepage "https://github.com/essedev/relay"

  depends_on macos: ">= :sonoma"

  app "Relay.app"

  zap trash: [
    "~/.relay",
    "~/Library/Preferences/dev.relay.app.plist",
  ]
end
