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
    pastel
    hugo
    zola
    tre-command

    # archives
    unzip
    zip

    # cli tools
    ripgrep
    ast-grep
    fd
    eza
    delta
    tldr
    ijq
    asdf-vm
    jujutsu

    btop
    htop

    lazygit

    qbittorrent

    # containers
    podman
    podman-tui
    podman-desktop

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
    lua54Packages.luarocks
    nodePackages_latest.nodejs
    python3
    go
    gcc
    tree-sitter
    terraform
    uv
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
