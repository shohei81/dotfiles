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

      # 認証は gh のトークンに一本化する。先頭の空文字でシステム既定の
      # osxkeychain ヘルパーをリセットしてから gh を指定（これで push 時に
      # キーチェーンのパスワードを聞かれなくなる）。
      credential.helper = [
        ""
        "!gh auth git-credential"
      ];
    };
  };
}
