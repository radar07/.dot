{ pkgs, ... }:

{
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    anki-bin
    clang-tools
    git
    gh
    lazygit
    vim
    neovim
    manga-tui
    mangayomi
    lxappearance
    gcc
    gnumake
    cmake
    wget
    unzip
    eza
    zoxide
    tmux
    nixd
    nixfmt-rfc-style
  ];
}
