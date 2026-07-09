{ pkgs, ... }:

{
  imports = [
    # CLI tools (cross-platform)
    ./features/cli/bat
    ./features/cli/btop
    ./features/cli/fastfetch
    ./features/cli/git
    ./features/cli/gpg
    ./features/cli/lazygit
    ./features/cli/starship
    ./features/cli/tmux
    ./features/cli/vim
    ./features/cli/zsh

    # Dev tools (cross-platform)
    ./features/dev/neovim
    ./features/dev/zed

    # Desktop — cross-platform
    ./features/desktop/ghostty
    ./features/desktop/ghostty/linux.nix
    ./features/desktop/mpv
    ./features/desktop/wezterm
    ./features/desktop/zathura

    # Desktop — Linux-only
    ./features/desktop/linux/hyprland
    ./features/desktop/linux/hyprlock
    ./features/desktop/linux/noctalia
  ];

  nixpkgs = {
    config = {
      allowUnfree = true;
      allowUnfreePredicate = _: true;
    };
  };

  home.username = "radar";
  home.homeDirectory = "/home/radar";
  home.stateVersion = "26.05";

  programs.home-manager.enable = true;

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };

  home.packages = with pkgs; [
    # Theming
    papirus-folders
    adwaita-qt
    adwaita-qt6
    adwaita-icon-theme
    libsForQt5.qtstyleplugin-kvantum

    # Alternate browser
    chromium

    # Wayland screenshot / recording / clipboard
    grim
    slurp
    grimblast
    wf-recorder
    wl-clipboard

    # Applications (Linux)
    alacritty
    vesktop
    obsidian
    obs-studio
    vlc
    mcomix
    calibre
    keepassxc
    bruno
    darktable
    qbittorrent

    # Containers (Linux)
    podman
    podman-tui
    podman-desktop

    # CLI tools
    gdb
    fastfetch
    gnupg
    gh
    zoxide
    yazi
    tre-command
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
    unzip
    zip

    # Programming languages / runtimes
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
    tree-sitter
    terraform
    uv
  ];

  # GTK theming (Linux-only)
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
}
