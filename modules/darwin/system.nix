{ ... }:
{
  # --- Nix daemon ---------------------------------------------------------
  # Recommended setup uses the Determinate Systems installer, which manages the
  # nix daemon and /etc/nix/nix.conf itself (flakes enabled by default). In that
  # case nix-darwin must NOT manage nix:
  nix.enable = false;
  #
  # If you instead used the *official* nix installer, flip the above to `true`
  # and uncomment this so flakes stay enabled:
  # nix.settings.experimental-features = [ "nix-command" "flakes" ];

  nixpkgs.hostPlatform = "aarch64-darwin";
  nixpkgs.config.allowUnfree = true;

  # nix-darwin wires /etc/zshrc so login shells see nix paths. Keep enabled
  # even though per-user zsh config lives in home-manager.
  programs.zsh.enable = true;

  # --- macOS system defaults (tweak freely) -------------------------------
  system.defaults = {
    NSGlobalDomain = {
      InitialKeyRepeat = 15; # faster key repeat
      KeyRepeat = 2;
      AppleShowAllExtensions = true;
      ApplePressAndHoldEnabled = false; # key repeat instead of accent popup
    };
    finder = {
      AppleShowAllFiles = true;
      ShowPathbar = true;
      FXEnableExtensionChangeWarning = false;
    };
    dock = {
      autohide = true;
      show-recents = false;
    };
  };

  # Bump only when nix-darwin release notes tell you to migrate.
  system.stateVersion = 5;
}
