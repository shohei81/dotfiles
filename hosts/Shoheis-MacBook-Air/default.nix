{ username, ... }:
{
  imports = [
    ../../modules/darwin/system.nix
    ../../modules/darwin/homebrew.nix
  ];

  networking.hostName = "Shoheis-MacBook-Air";
  networking.localHostName = "Shoheis-MacBook-Air";

  # Recent nix-darwin needs the primary user for user-scoped defaults & homebrew.
  system.primaryUser = username;

  users.users.${username} = {
    name = username;
    home = "/Users/${username}";
  };
}
