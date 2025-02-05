#!/bin/zsh

echo "🚀 Setting up your dotfiles and environment..."

# 1️⃣ Homebrew のインストール
if ! command -v brew &> /dev/null; then
    echo "🍺 Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# 2️⃣ Homebrew パッケージのインストール
echo "📦 Installing Homebrew packages..."
brew bundle --file=$HOME/.dotfiles/Brewfile

# 3️⃣ dotfiles のセットアップ
echo "🔧 Configuring dotfiles..."
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME'

# 競合する既存のファイルをバックアップ
mkdir -p $HOME/.dotfiles-backup
dotfiles checkout 2>&1 | grep -E "\s+\." | awk '{print $1}' | while read file; do
    mv "$HOME/$file" "$HOME/.dotfiles-backup/$file"
done

dotfiles checkout
dotfiles config --local status.showUntrackedFiles no

# 4️⃣ VS Code の拡張機能をインストール
if command -v code &> /dev/null; then
    echo "🛠 Installing VS Code extensions..."
    xargs -n1 code --install-extension < $HOME/.dotfiles/vscode-extensions.txt
fi

# 5️⃣ シェルの設定を適用
echo "🐚 Configuring shell..."
ln -sf $HOME/.dotfiles/zsh/.zshrc $HOME/.zshrc
ln -sf $HOME/.dotfiles/zsh/.zprofile $HOME/.zprofile

echo "✅ Setup complete! Restart your shell for changes to take effect."
