{ pkgs, ... }:

{
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    anki-bin
    bun
    clang-tools
    rustup
    git
    gh
    lazygit
    vim
    neovim
    openjdk21
    jetbrains.idea-community
    pnpm
    networkmanager
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
