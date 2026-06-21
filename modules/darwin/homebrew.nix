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
      # Starting at "none" for the initial setup; tighten once things are stable.
      cleanup = "none";
    };

    taps = [ ];

    brews = [ ];

    casks = [
      "ghostty" # terminal (config lives in config/ghostty/, managed by home-manager)
      "gcloud-cli" # gcloud CLI (renamed from google-cloud-sdk); sourced in modules/home/shell.nix
      "mactex" # LaTeX (full mactex already installed; no-gui variant conflicts with it)
      "font-hack-nerd-font"
      "font-ipaexfont"
    ];

    # masApps = { }; # add Mac App Store apps here if you want them declarative
  };
}
