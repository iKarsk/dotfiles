#!/bin/bash
set -eufo pipefail

echo "🚀  Setting up @iKarsk's dotfiles"

if xcode-select -p &> /dev/null; then
  echo "✅  Xcode Command Line Tools already installed"
else
  echo "🔧  Installing Xcode Command Line Tools..."
  xcode-select --install &> /dev/null
  while ! xcode-select -p &> /dev/null; do sleep 5; done
  echo "✅  Xcode Command Line Tools installed"
fi

if which -s "brew"; then
  echo "✅  Homebrew is already installed."
else
  echo "🍺  Installing Homebrew"
  NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  echo "✅  Homebrew installed successfully."

  # Make brew available in the current session
  if [[ -f "/opt/homebrew/bin/brew" ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"   # Apple Silicon
  elif [[ -f "/usr/local/bin/brew" ]]; then
    eval "$(/usr/local/bin/brew shellenv)"       # Intel
  fi
fi

if which -s "chezmoi"; then
  echo "✅  chezmoi is already installed."
else
  echo "📦  Installing chezmoi"
  brew install chezmoi
fi

if [ -d "$HOME/.local/share/chezmoi/.git" ]; then
  echo "ℹ️  Dotfiles already initialized, pulling latest changes..."
  chezmoi update
else
  echo "🏠  Initializing dotfiles..."
  chezmoi init --apply iKarsk
fi
