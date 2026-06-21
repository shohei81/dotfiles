{ ... }:
{
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "shohei81";
        email = "me@shohei81.dev";
      };
      push.default = "simple";
      init.defaultBranch = "main";
    };
  };
}
