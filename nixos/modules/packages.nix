{ pkgs, ... }:

{
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    anki-bin
    bun
    spotify
    clang
    clang-tools
    rustup
    git
    gh
    lazygit
    vim
    neovim
    helix
    openjdk21
    jetbrains.idea-community
    jetbrains.pycharm-community
    windsurf
    dbeaver-bin
    vscode
    vscodium
    pnpm
    deno
    networkmanager
    blueman
    libnotify
    manga-tui
    lxappearance
    gcc
    gnumake
    cmake
    ninja
    meson
    wget
    unzip
    eza
    zoxide
    tmux
    nixd
    nixfmt-rfc-style
  ];
}
