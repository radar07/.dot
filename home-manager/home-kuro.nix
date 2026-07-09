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
    # Note: ghostty is installed via Homebrew cask (see hosts/kuro/configuration.nix)
    # This only writes the config file.
    ./features/desktop/ghostty
    ./features/desktop/ghostty/darwin.nix
    ./features/desktop/mpv
    ./features/desktop/wezterm
    ./features/desktop/zathura
  ];

  nixpkgs = {
    config = {
      allowUnfree = true;
      allowUnfreePredicate = _: true;
    };
  };

  home.username = "radar";
  home.homeDirectory = "/Users/radar";
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
    jujutsu
    btop
    htop
    lazygit
    unzip
    zip

    # Applications available on macOS via nixpkgs
    obsidian
    vlc
    keepassxc
    bruno

    # Programming languages / runtimes
    cargo
    nodePackages_latest.nodejs
    python3
    go
    tree-sitter
    terraform
    uv
  ];

  # No GTK / Qt theming on macOS
  # No wayland tools (grim, slurp, wl-clipboard, etc.)
  # No vesktop, podman-desktop, podman-tui — use native macOS apps or Homebrew casks
}
