{ pkgs, ... }:

{
  imports = [
    ./modules
  ];

  nixpkgs = {
    overlays = [
    ];

    config = {
      allowUnfree = true;
      allowUnfreePredicate = _: true;
    };
  };

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

  gtk = {
    enable = true;
    theme = {
      name = "Adwaita Dark";
      package = pkgs.adwaita-qt;
    };
    iconTheme = {
      name = "la-capitaine-icon-theme";
      package = pkgs.la-capitaine-icon-theme;
    };
  };

  home.stateVersion = "24.11";

  programs.home-manager.enable = true;
}
