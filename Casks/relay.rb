cask "relay" do
  version "0.1.0"
  sha256 "537c2d1fd71e2e0dcdba4119100a0ea0430975882c5b8ab976cefcf221cf2ce6"

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
