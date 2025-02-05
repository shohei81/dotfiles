# コマンド補完
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
  autoload -Uz compinit
  compinit
fi

eval "$(starship init zsh)"

# Homebrewのパス
export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:$PATH"

# pyenv の設定（ここに統一）
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# PostgreSQL の設定
export PATH="/opt/homebrew/opt/postgresql@16/bin:$PATH"
export LDFLAGS="-L/opt/homebrew/opt/postgresql@16/lib"
export CPPFLAGS="-I/opt/homebrew/opt/postgresql@16/include"
export PKG_CONFIG_PATH="/opt/homebrew/opt/postgresql@16/lib/pkgconfig"

# Google Cloud SDK の設定
if [ -f '/Users/shoheiyoshida/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/shoheiyoshida/google-cloud-sdk/path.zsh.inc'; fi

#unix command aliases
alias ls='lsd'
alias ..='cd ..'
alias ...='cd ../..'

# git aliases
alias g='git'
alias ga='git add'
alias gb='git branch'
alias gc='git commit'
alias gd='git diff'
alias gp='git push'
alias gs='git status'

# ターミナル立ち上げ時にfastfetchを実行
if (( $+commands[fastfetch] )); then
    fastfetch
fi
# Created by `pipx` on 2025-01-28 03:58:55
export PATH="$PATH:/Users/shoheiyoshida/.local/bin"
alias dotfiles='/usr/bin/git --git-dir=/Users/shoheiyoshida/.dotfiles --work-tree=/Users/shoheiyoshida'
