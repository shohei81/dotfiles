# Homebrew の設定
eval "$(/opt/homebrew/bin/brew shellenv)"

# Nixの設定（必要な場合）
export PATH="$HOME/.nix-profile/bin:/nix/var/nix/profiles/default/bin:$PATH"

# システムのデフォルトパス
export PATH="$PATH:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"

# Created by `pipx` on 2025-01-28 03:58:55
export PATH="$PATH:/Users/shoheiyoshida/.local/bin"
