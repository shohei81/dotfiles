#!/usr/bin/env zsh
set -euo pipefail

# 1) Homebrew
if ! command -v brew >/dev/null 2>&1; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  eval "$($(brew --prefix)/bin/brew shellenv)"
fi

# 2) chezmoi
if ! command -v chezmoi >/dev/null 2>&1; then
  brew install chezmoi
fi

# 3) Apply dotfiles
chezmoi init --apply git@github.com:shohei81/dotfiles.git

# 4) Homebrew bundle (optional)
if [ -f "$HOME/Brewfile" ]; then
  brew bundle --file "$HOME/Brewfile"
fi

# 5) VS Code extensions (optional)
if command -v code >/dev/null 2>&1 && [ -f "$HOME/vscode-extensions.txt" ]; then
  xargs -n1 code --install-extension < "$HOME/vscode-extensions.txt"
fi

echo "Done. Restart your terminal to load shell config."
