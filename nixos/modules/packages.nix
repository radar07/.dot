{ pkgs, ... }:

{
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    anki-bin
    bun
    spotify
    clang
    clang-tools
    rustup
    # godot_4
    # godot_4-export-templates-bin
    git
    gh
    lazygit
    vim
    neovim
    helix
    openjdk21
    jetbrains.idea-oss
    # jetbrains.pycharm-oss
    dbeaver-bin
    shotcut
    meld
    vscode
    vscodium
    pnpm
    deno
    networkmanager
    pcmanfm
    pavucontrol
    blueman
    libnotify
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
    nixfmt
  ];
}
