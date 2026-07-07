# homebrew-relay

Homebrew tap for [Relay](https://github.com/essedev/relay), an agent-aware native macOS terminal.

## Install

```sh
brew install --cask essedev/relay/relay
```

(Auto-taps; equivalent to `brew tap essedev/relay && brew install --cask relay`.)

## Update

```sh
brew update && brew upgrade --cask relay
```

## First launch note

The app is not distributed with an Apple Developer ID. On first launch macOS blocks it:
open **System Settings > Privacy & Security** and click **Open Anyway**.

The cask is updated automatically on every Relay release.
