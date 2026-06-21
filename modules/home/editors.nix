{ config, pkgs, ... }:
let
  # The repo's on-disk location. Editable (out-of-store) symlinks point here,
  # so these configs stay editable in place AND are declared by nix.
  # Keep this repo checked out at ~/nix-config (see README).
  repo = "${config.home.homeDirectory}/nix-config";
in
{
  home.packages = [ pkgs.neovim ];

  # neovim: keep the existing lazy.nvim config; lazy-lock.json pins plugins.
  xdg.configFile."nvim".source =
    config.lib.file.mkOutOfStoreSymlink "${repo}/config/nvim";

  # ghostty reads ~/.config/ghostty/config on macOS (XDG).
  xdg.configFile."ghostty/config".source =
    config.lib.file.mkOutOfStoreSymlink "${repo}/config/ghostty/config";
}
