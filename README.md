# dotfiles

Personal macOS (Apple Silicon) dotfiles, managed with [chezmoi](https://chezmoi.io).

Manages: zsh (`.zshrc` / `.zprofile` / `.zshenv`), git, Neovim (lazy.nvim),
tmux, Ghostty, and a `Brewfile` (Homebrew package manifest).

## New machine setup

```sh
# 1. Install Homebrew  → https://brew.sh
# 2. Install chezmoi and apply this repo:
sh -c "$(curl -fsSL https://chezmoi.io/get)" -- init --apply shohei81
# 3. Install packages:
brew bundle --file ~/Brewfile
```

## Daily use

```sh
chezmoi edit ~/.zshrc     # edit a dotfile (opens the source copy)
chezmoi apply             # apply source -> home
chezmoi re-add            # pull in changes you made directly in ~/
chezmoi cd                # cd into the source repo, then:
  git add -A && git commit -m "..." && git push
```

`chezmoi managed` lists tracked files; `chezmoi diff` shows pending changes.

## Notes

- Multi-machine differences (when needed) can be handled with chezmoi
  templates (`.tmpl`) and per-machine data — not used yet, kept simple.
- The `nix-legacy` branch preserves a previous nix-darwin + home-manager
  experiment, in case it's ever useful.
