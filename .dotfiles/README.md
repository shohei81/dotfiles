# Dotfiles

このリポジトリは、開発環境を統一するための設定ファイルを管理します。

## インストール

新しい環境で `dotfiles` をセットアップするには、以下のコマンドを実行します。

\Brewfile
COMMIT_EDITMSG
FETCH_HEAD
HEAD
ORIG_HEAD
config
description
hooks
index
info
install.sh
logs
objects
refs``

このスクリプトは以下の内容を実行します。

1. **Homebrew のインストール**
   - macOS で Homebrew がインストールされていない場合、自動的にインストールします。
   - Homebrew のパッケージを `Brewfile` に基づいてインストールします。

2. **Zsh のセットアップ**
   - `.zshrc`, `.zprofile` などの設定ファイルを適用します。
   - 必要なプラグイン（`zsh-autosuggestions`, `zsh-completions` など）を Homebrew でインストールします。

3. **VS Code 拡張機能のインストール**
   - `vscode-extensions.txt` に記載された拡張機能を一括でインストールします。

4. **dotfiles の適用**
   - 既存の設定ファイルと競合する場合、自動的に `~/.dotfiles-backup/` にバックアップします。
   - `dotfiles` リポジトリのファイルを `/Users/shoheiyoshida` に適用します。

## メンテナンス

定期的、あるいは必要に応じて実行すべきコマンドを以下にまとめます。

### 1. dotfiles の更新

新しい設定ファイルを追加・変更した場合、以下を実行してリポジトリに反映します。

\``

\On branch main
Your branch is up to date with 'origin/main'.

nothing to commit (use -u to show untracked files)``

### 2. Homebrew のパッケージリストの更新

新しいパッケージを追加・削除した場合、リストを更新します。

\``

\On branch main
Your branch is up to date with 'origin/main'.

nothing to commit (use -u to show untracked files)``

### 3. VS Code 拡張機能の更新

新しい拡張機能を追加・削除した場合、リストを更新します。

\``

\On branch main
Your branch is up to date with 'origin/main'.

nothing to commit (use -u to show untracked files)``

### 4. dotfiles の適用（リポジトリからの変更を適用）

他の環境で更新された `dotfiles` を適用する場合、以下を実行します。

\Already up to date.
Your branch is up to date with 'origin/main'.``

## ライセンス

このリポジトリの内容は MIT ライセンスの下で提供されます。

