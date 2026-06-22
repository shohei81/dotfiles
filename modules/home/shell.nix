{ ... }:
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      # nix-darwin: 設定を編集したら `switch` で適用、`update` で input更新+適用
      switch = "darwin-rebuild switch --flake $HOME/nix-config";
      update = "nix flake update --flake $HOME/nix-config && darwin-rebuild switch --flake $HOME/nix-config";

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

      # --- VS Code / Kiro shell integration ---
      [[ "$TERM_PROGRAM" == "vscode" ]] && . "$(code --locate-shell-integration-path zsh)" 2>/dev/null
      [[ "$TERM_PROGRAM" == "kiro" ]] && . "$(kiro --locate-shell-integration-path zsh)" 2>/dev/null

      # --- Auto-attach tmux on interactive shells (skip inside editors / nested) ---
      if command -v tmux >/dev/null 2>&1 \
        && [[ $- == *i* ]] \
        && [ -z "$TMUX" ] \
        && [ "$TERM_PROGRAM" != "vscode" ] \
        && [ "$TERM_PROGRAM" != "kiro" ]; then
        tmux attach -t main 2>/dev/null || exec tmux new -s main
      fi

      # --- Greeting ---
      command -v fastfetch >/dev/null 2>&1 && fastfetch
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
}
