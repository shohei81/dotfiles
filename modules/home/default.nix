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

  # Set to the nix release you first installed with; don't bump casually.
  home.stateVersion = "25.05";

  programs.home-manager.enable = true;
}
