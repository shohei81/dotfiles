{ ... }:
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      # nix-darwin: 設定を編集したら `switch` で適用、`update` で input更新+適用。
      # darwin-rebuild の activation は root 必須なので sudo 付き。
      # `nix flake update` は lock を書き換えるのでユーザー権限で実行(sudoの前)。
      switch = "sudo darwin-rebuild switch --flake $HOME/nix-config";
      update = "nix flake update --flake $HOME/nix-config && sudo darwin-rebuild switch --flake $HOME/nix-config";

      ls = "lsd";
      ".." = "cd ..";
      "..." = "cd ../..";

      g = "git";
      ga = "git add";
      gb = "git branch";
      gc = "git commit";
      gd = "git diff";
      gp = "git push";
      gs = "git status";

      n = "nvim";
      ff = "fd | fzf";
      nf = "nvim $(fd | fzf)";
      nd = "nvim $(fd -t d | fzf)";
    };

    initContent = ''
      # --- Kiro CLI (pre block) ---
      [[ -f "$HOME/Library/Application Support/kiro-cli/shell/zshrc.pre.zsh" ]] && builtin source "$HOME/Library/Application Support/kiro-cli/shell/zshrc.pre.zsh"

      # --- Homebrew (needed for casks: ghostty, gcloud, fonts, mactex) ---
      if [ -x /opt/homebrew/bin/brew ]; then
        eval "$(/opt/homebrew/bin/brew shellenv)"
      fi

      # --- Google Cloud SDK (installed via Homebrew cask) ---
      if [ -f "/opt/homebrew/share/google-cloud-sdk/path.zsh.inc" ]; then
        . "/opt/homebrew/share/google-cloud-sdk/path.zsh.inc"
      fi
      if [ -f "/opt/homebrew/share/google-cloud-sdk/completion.zsh.inc" ]; then
        . "/opt/homebrew/share/google-cloud-sdk/completion.zsh.inc"
      fi

      # --- Rust (cargo) ---
      [ -f "$HOME/.cargo/env" ] && . "$HOME/.cargo/env"

      # --- bun completions (bun は sessionPath で PATH に追加済み) ---
      [ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

      # --- VS Code / Kiro shell integration ---
      [[ "$TERM_PROGRAM" == "vscode" ]] && . "$(code --locate-shell-integration-path zsh)" 2>/dev/null
      [[ "$TERM_PROGRAM" == "kiro" ]] && . "$(kiro --locate-shell-integration-path zsh)" 2>/dev/null

      # --- Helper functions (旧 zshrc から復元) ---
      mkcd() { mkdir -p "$1" && cd "$1"; }

      # claude を agent-logs の consent ラッパー経由で起動
      claude() { if command -v agent-logs &>/dev/null; then agent-logs consent-dialog; [ $? -eq 3 ] && return 0; fi; command claude "$@"; }

      # --- Greeting (custom fastfetch logo) ---
      if command -v fastfetch >/dev/null 2>&1; then
        printf '\033[38;5;194m%s\033[0m\n' "$(cat <<'UNCERTAIN'
██╗   ██╗███╗   ██╗ ██████╗███████╗██████╗ ████████╗ █████╗ ██╗███╗   ██╗
██║   ██║████╗  ██║██╔════╝██╔════╝██╔══██╗╚══██╔══╝██╔══██╗██║████╗  ██║
██║   ██║██╔██╗ ██║██║     █████╗  ██████╔╝   ██║   ███████║██║██╔██╗ ██║
██║   ██║██║╚██╗██║██║     ██╔══╝  ██╔══██╗   ██║   ██╔══██║██║██║╚██╗██║
╚██████╔╝██║ ╚████║╚██████╗███████╗██║  ██║   ██║   ██║  ██║██║██║ ╚████║
 ╚═════╝ ╚═╝  ╚═══╝ ╚═════╝╚══════╝╚═╝  ╚═╝   ╚═╝   ╚═╝  ╚═╝╚═╝╚═╝  ╚═══╝

████████╗███████╗ █████╗
╚══██╔══╝██╔════╝██╔══██╗
   ██║   █████╗  ███████║
   ██║   ██╔══╝  ██╔══██║
   ██║   ███████╗██║  ██║
   ╚═╝   ╚══════╝╚═╝  ╚═╝
UNCERTAIN
)"
        fastfetch --logo none --structure "OS:Shell:Display:TerminalFont:CPU:GPU:Memory:Disk:LocalIp:Battery:Colors"
      fi

      # --- Kiro CLI (post block) ---
      [[ -f "$HOME/Library/Application Support/kiro-cli/shell/zshrc.post.zsh" ]] && builtin source "$HOME/Library/Application Support/kiro-cli/shell/zshrc.post.zsh"
    '';
  };

  programs.starship.enable = true;

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
    enableZshIntegration = true;
  };

  # zoxide: smarter `cd`. enableZshIntegration wires up the `z` / `zi` commands
  # (the plain binary alone does nothing without this init).
  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };

  # yazi: enableZshIntegration が `y` 関数(終了時にcd)を提供する。
  programs.yazi = {
    enable = true;
    enableZshIntegration = true;
  };
}
