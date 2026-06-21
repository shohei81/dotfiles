{
  description = "shohei's nix-darwin + home-manager configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    nix-darwin = {
      url = "github:nix-darwin/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{
      self,
      nixpkgs,
      nix-darwin,
      home-manager,
    }:
    let
      system = "aarch64-darwin";
      username = "shohei";
    in
    {
      # Build/switch with:
      #   darwin-rebuild switch --flake ~/nix-config#Shoheis-MacBook-Air
      # (the attr name matches `scutil --get LocalHostName`, so `--flake ~/nix-config`
      #  without #name also resolves automatically)
      darwinConfigurations."Shoheis-MacBook-Air" = nix-darwin.lib.darwinSystem {
        inherit system;
        specialArgs = { inherit inputs username; };
        modules = [
          ./hosts/Shoheis-MacBook-Air/default.nix

          home-manager.darwinModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            # Back up pre-existing dotfiles (e.g. chezmoi-era ~/.zshrc) instead of
            # aborting, so home-manager can take them over. Files get a .backup suffix.
            home-manager.backupFileExtension = "backup";
            home-manager.extraSpecialArgs = { inherit inputs username; };
            home-manager.users.${username} = import ./modules/home;
          }
        ];
      };
    };
}
