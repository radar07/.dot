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
    zola
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

    # screenshot
    grim
    slurp
    grimblast

    # screen recorder
    wf-recorder

    # clipboard
    wl-clipboard

    # applications
    alacritty
    vesktop
    obsidian
    obs-studio
    vlc

    # password manager
    keepassxc

    # programming
    cargo
    nodePackages_latest.nodejs
    python3
    go
    gcc
    tree-sitter
  ];

  gtk = {
    enable = true;
    theme = {
      name = "adw-gtk3-dark";
      package = pkgs.adw-gtk3;
    };
    iconTheme = {
      name = "papirus-icon-theme";
      package = pkgs.papirus-icon-theme;
    };
  };

  home.sessionVariables.GTK_THEME = "Adwaita-dark";

  home.stateVersion = "24.11";

  programs.home-manager.enable = true;
}
