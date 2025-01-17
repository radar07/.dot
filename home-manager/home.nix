{ pkgs, ... }:

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
    vesktop
    obsidian
    obs-studio
    vlc

    # password manager
    keepassxc

    # programming
    nodePackages_latest.nodejs
    python3
    go
    gcc
    tree-sitter
  ];

  home.stateVersion = "24.11";

  programs.home-manager.enable = true;
}
