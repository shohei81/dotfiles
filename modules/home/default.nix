{ username, ... }:
{
  imports = [
    ./packages.nix
    ./shell.nix
    ./git.nix
    ./tmux.nix
    ./editors.nix
  ];

  home.username = username;
  home.homeDirectory = "/Users/${username}";

  # nix 管理外の home-local ツール用の PATH（旧 ~/.zshrc から復元）。
  # - ~/.local/bin : curl|sh インストーラや `uv tool install`(claude, agent-logs…)
  # - ~/.npm-global/bin : `npm install -g` の出力先(下の NPM_CONFIG_PREFIX と対)
  # - ~/.bun/bin, ~/.juliaup/bin, ~/.antigravity/…, ~/.dotnet/tools : 各ツール
  home.sessionPath = [
    "$HOME/.local/bin"
    "$HOME/.npm-global/bin"
    "$HOME/.bun/bin"
    "$HOME/.juliaup/bin"
    "$HOME/.antigravity/antigravity/bin"
    "$HOME/.dotnet/tools"
  ];

  home.sessionVariables = {
    EDITOR = "nvim";
    # nix の node は npm のグローバル prefix が /nix/store(読取専用)なので、
    # `npm install -g` 用に書き込めるディレクトリへ向ける。
    NPM_CONFIG_PREFIX = "/Users/${username}/.npm-global";
    BUN_INSTALL = "/Users/${username}/.bun";
  };

  # Set to the nix release you first installed with; don't bump casually.
  home.stateVersion = "25.05";

  programs.home-manager.enable = true;
}
