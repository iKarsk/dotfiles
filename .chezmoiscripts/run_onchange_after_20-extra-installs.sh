#!/bin/bash

if [ ! -d "$HOME/fzf-git.sh" ]; then
  echo "📥  Cloning fzf-git.sh..."
  git clone --depth=1 https://github.com/junegunn/fzf-git.sh.git "$HOME/fzf-git.sh"
fi

if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
  echo "📥  Installing TPM and tmux plugins..."
  git clone --depth=1 https://github.com/tmux-plugins/tpm.git "$HOME/.tmux/plugins/tpm"
  "$HOME/.tmux/plugins/tpm/bin/install_plugins"
fi

if ! command -v claude > /dev/null 2>&1; then
  echo "📥  Installing Claude Code..."
  curl -fsSL https://claude.ai/install.sh | bash
fi
