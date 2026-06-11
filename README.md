# Dotfiles

Managed with [chezmoi](https://www.chezmoi.io/).

## Quick start

To set up a new machine or update an existing one, run:

```sh
curl -fsSL https://setup.krystiankar.ski | bash
```

## Day to day

```sh
chezmoi edit ~/.zshrc      # edit a config (opens the chezmoi source)
chezmoi apply              # apply changes and run the install hooks
chezmoi update             # pull the latest from GitHub and apply
```
