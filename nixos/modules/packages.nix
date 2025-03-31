{ pkgs, ... }:

{
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    anki-bin
    bun
    spotify
    clang-tools
    rustup
    git
    gh
    lazygit
    vim
    neovim
    openjdk21
    jetbrains.idea-community
    dbeaver-bin
    vscode
    vscodium
    pnpm
    networkmanager
    blueman
    libnotify
    manga-tui
    mangayomi
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
