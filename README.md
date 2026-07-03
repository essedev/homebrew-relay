# homebrew-relay

Homebrew tap per [Relay](https://github.com/essedev/relay), terminale macOS nativo agent-aware.

## Installazione

```sh
brew install --cask essedev/relay/relay
```

(auto-tappa; equivale a `brew tap essedev/relay && brew install --cask relay`.)

## Aggiornamento

```sh
brew update && brew upgrade --cask relay
```

## Nota primo avvio

L'app non e distribuita con Developer ID Apple. Al primo avvio macOS la blocca:
apri **Impostazioni di Sistema > Privacy e Sicurezza** e premi **Apri comunque**.

Il cask viene aggiornato automaticamente a ogni release di Relay.
