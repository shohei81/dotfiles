# nix-config

macOS (Apple Silicon) を **nix-darwin + home-manager + flakes** で宣言的に管理する構成。
旧 chezmoi dotfiles を置き換えたもの。

## 構成

```
flake.nix                         # 入口。inputs(nixpkgs/nix-darwin/home-manager)を固定
hosts/Shoheis-MacBook-Air/        # このMac固有のシステム設定
modules/
  darwin/system.nix               # nix/macOS defaults
  darwin/homebrew.nix             # cask宣言(ghostty,gcloud,mactex,fonts) ※cleanup=zap
  home/packages.nix               # CLIツール群(nixpkgs)
  home/shell.nix                  # zsh/starship/direnv/fzf, tmux自動attach
  home/git.nix
  home/tmux.nix                   # prefix=C-a, vi, resurrect/continuum
  home/editors.nix                # nvim/ghostty を編集可能シンボリックリンクで配置
config/
  nvim/                           # lazy.nvim構成(そのまま流用)
  ghostty/config
manual/vscode/                    # ★nix管理外: settings.json と拡張一覧(参照用)
```

## 前提

- このリポジトリは **`~/nix-config`** に置く（`modules/home/editors.nix` の symlink パスがこれを前提）。
- 言語環境: Python は **uv**、プロジェクト固有のバージョン固定は flake devShell + direnv。
  pyenv / pipx / nodebrew は廃止。

## 新規 Mac でのセットアップ

```sh
# 1) Nix をインストール（Determinate Systems installer 推奨。flakes 既定有効）
curl -fsSL https://install.determinate.systems/nix | sh -s -- install

# 2) Homebrew をインストール（cask 用。nix-darwin が宣言管理する）
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# 3) このリポジトリを ~/nix-config に取得
git clone https://github.com/shohei81/dotfiles.git ~/nix-config
cd ~/nix-config

# 4) 初回ビルド & 適用
nix run nix-darwin -- switch --flake ~/nix-config#Shoheis-MacBook-Air
```

> ⚠️ 初回 `switch` は `cleanup = "zap"` により **宣言にない既存 brew formula（bat, neovim, pyenv 等）を削除**します。CLI は nix 側に移っているので想定挙動です。

## 日常運用

```sh
# 設定を変えたら適用
darwin-rebuild switch --flake ~/nix-config

# 入力(nixpkgs等)を更新
nix flake update
darwin-rebuild switch --flake ~/nix-config
```

nvim / ghostty の設定は `config/` 内を直接編集すれば即反映（rebuild 不要）。

## nix管理外（手動）

VS Code は方針により nix 管理外。設定と拡張は参照用に `manual/vscode/` に保管:

```sh
# 設定を反映したい場合（手動コピー）
cp manual/vscode/settings.json "$HOME/Library/Application Support/Code/User/settings.json"
# 拡張をまとめて導入
xargs -n1 code --install-extension < manual/vscode/extensions.txt
```

## プロジェクト固有の開発環境（任意）

プロジェクト直下に `.envrc`（`use flake`）を置けば direnv が自動で devShell を有効化。
`flake.nix` を持たないディレクトリは何もしない（グローバルの uv/nix ツールがそのまま使える）。
