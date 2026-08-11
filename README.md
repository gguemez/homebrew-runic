# Runic — Homebrew tap

    brew install --cask gguemez/runic/runic

or, if you prefer to tap first:

    brew tap gguemez/runic
    brew install --cask runic

Upgrades come with `brew upgrade --cask runic`. The cask tracks
[`appcast.json`](https://dl.runic.guemez.net/appcast.json) — the same feed the app
itself checks — so it can never advertise a version that was never published.

**Runic** is a native macOS editor that opens a multi-gigabyte file in well under
a second, scrolls it at 60 fps, and uses almost no memory doing it.
[Website](https://runic.guemez.net) · [Issues](https://github.com/gguemez/Runic/issues)

Requires macOS 13 Ventura or later. Universal (Apple Silicon and Intel), signed
with a Developer ID certificate and notarized by Apple.

## Why a tap rather than homebrew/cask

`homebrew/cask` requires software to be *notable* before it is accepted — a
threshold a newly released app has not met yet. A tap needs no one's approval and
works identically for anyone installing it; the only difference is the one-time
tap name in the command. Submitting upstream is worth doing later, when the bar
is met.
