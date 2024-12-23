{ config, pkgs, ... }:

{
  imports = [
    ./modules
  ];

  home.username = "radar";
  home.homeDirectory = "/home/radar";

  home.packages = with pkgs; [
    fastfetch
    gnupg
    gh
    zoxide
    yazi
    ani-cli
    hugo
    tre-command

    # archives
    unzip
    zip

    # cli tools
    fzf
    ripgrep
    fd
    eza
    delta
    tldr

    btop
    htop

    lazygit

    qbittorrent

    # containers
    podman
    podman-tui

    # applications
    alacritty
    zathura

    # password manager
    keepassxc
  ];

  home.stateVersion = "24.11";

  programs.home-manager.enable = true;
}
