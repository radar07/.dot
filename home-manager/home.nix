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
    papirus-folders

    adwaita-qt # Qt theme matching GTK Adwaita
    adwaita-qt6 # Qt6 support
    adwaita-icon-theme # Base icon theme (dependency)
    libsForQt5.qtstyleplugin-kvantum # Optional: better Qt theming

    gdb
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
    manga-tui

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
    discord
    obsidian
    obs-studio
    vlc

    # comics reader
    mcomix

    # password manager
    keepassxc

    # programming
    cargo
    lua54Packages.luarocks
    nodePackages_latest.nodejs
    python3
    go
    (lua.withPackages (
      ps: with ps; [
        busted
        luafilesystem
      ]
    ))
    love
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
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };
    gtk3 = {
      extraConfig.gtk-application-prefer-dark-theme = true;
    };
    gtk4 = {
      extraConfig.gtk-application-prefer-dark-theme = true;
    };
  };

  qt = {
    enable = true;
    platformTheme.name = "adwaita";
    style.name = "adwaita-dark";
  };

  home.pointerCursor = {
    gtk.enable = true;
    x11.enable = true;
    name = "catppuccin-mocha-dark-cursors";
    package = pkgs.catppuccin-cursors.mochaDark;
    size = 16;
  };

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      gtk-theme = "adw-gtk3-dark";
      color-scheme = "prefer-dark";
    };
  };

  home.stateVersion = "26.05";

  programs.home-manager.enable = true;
}
