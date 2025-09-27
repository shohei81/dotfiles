# dotfiles (chezmoi)

Usage on a new Mac:

1. Install Homebrew if missing (see https://brew.sh)
2. Install chezmoi: `brew install chezmoi`
3. Apply: `chezmoi init --apply git@github.com:shohei81/dotfiles.git`
4. Install packages: `brew bundle --file ~/Brewfile` (if exists)
5. VS Code extensions: `xargs -n1 code --install-extension < ~/vscode-extensions.txt` (if `code` exists)

Repo layout follows chezmoi conventions, e.g. `dot_zshrc` -> `~/.zshrc`, `dot_config/nvim` -> `~/.config/nvim`.
