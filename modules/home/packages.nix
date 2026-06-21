{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # core CLI
    bat
    fd
    fzf
    ripgrep
    lsd
    tree
    wget
    gh
    ghq
    just
    pandoc
    parallel
    fastfetch

    # python toolchain (replaces pyenv / pipx / nodebrew)
    uv

    # clojure (needs a JDK)
    clojure
    jdk

    # fun
    sl
  ];
}
