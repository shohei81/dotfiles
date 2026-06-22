{ ... }:
{
  # Homebrew is managed declaratively by nix-darwin. brew itself must already be
  # installed (see README). All CLI tools come from nix (modules/home/packages.nix);
  # Homebrew only carries GUI casks / fonts / SDKs that are awkward under nix.
  homebrew = {
    enable = true;

    onActivation = {
      autoUpdate = true;
      upgrade = true;
      # cleanup policy for packages NOT declared below:
      #   "none"      -> keep them (safe during migration; lets manual brew persist)
      #   "uninstall" -> remove them, keep their data
      #   "zap"       -> remove them and their data (fully declarative)
      # "uninstall": remove undeclared formulae/casks (keeps their data dirs).
      # This cleans up the old brew CLIs that have moved to nix. Everything we
      # still want is declared below; switch to "zap" later for a full wipe.
      cleanup = "uninstall";
    };

    taps = [ ];

    brews = [
      "deck" # Markdown -> Google Slides (no nixpkgs equivalent; nix's `deck` is unrelated)

      # Dependencies of the gcloud-cli cask. brew bundle doesn't auto-detect these
      # as cask deps, so without declaring them `cleanup` tries to remove them and
      # `brew uninstall` aborts the whole cleanup ("Refusing to uninstall ...").
      "ca-certificates"
      "mpdecimal"
      "openssl@3"
      "readline"
      "sqlite"
    ];

    casks = [
      "ghostty" # terminal (config lives in config/ghostty/, managed by home-manager)
      "gcloud-cli" # gcloud CLI (renamed from google-cloud-sdk); sourced in modules/home/shell.nix
      "mactex" # LaTeX (full mactex already installed; no-gui variant conflicts with it)
      "kiro-cli" # used by shell integration in modules/home/shell.nix
      "dotnet-sdk" # .NET SDK
      "blackhole-2ch" # virtual audio driver
      "font-hack-nerd-font"
      "font-ipaexfont"
      "font-symbols-only-nerd-font"
    ];

    # masApps = { }; # add Mac App Store apps here if you want them declarative
  };
}
