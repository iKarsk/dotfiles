#!/bin/bash

if [ ! -d "$HOME/fzf-git.sh" ]; then
  echo "📥  Cloning fzf-git.sh..."
  git clone --depth=1 https://github.com/junegunn/fzf-git.sh.git "$HOME/fzf-git.sh"
fi

if ! command -v claude > /dev/null 2>&1; then
  echo "📥  Installing Claude Code..."
  curl -fsSL https://claude.ai/install.sh | bash
fi
