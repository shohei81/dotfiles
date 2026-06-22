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

    # python toolchain (replaces pyenv / pipx)
    uv

    # node toolchain (replaces nodebrew/nvm). global npm installs go to
    # ~/.npm-global via NPM_CONFIG_PREFIX (see modules/home/default.nix)
    nodejs

    # clojure (needs a JDK)
    clojure
    jdk

    # migrated from Homebrew (previously installed via `brew install`)
    jq
    lazygit
    glow
    hugo
    ffmpeg
    imagemagick
    poppler-utils # pdftotext などの CLI
    qrencode
    resvg
    rlwrap
    _7zz # 7-Zip (7zz)
    llama-cpp
    cmake
    swig

    # fun
    sl
  ];
}
