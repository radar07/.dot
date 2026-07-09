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
    git
    gh
    lazygit
    vim
    neovim
    openjdk21
    jetbrains.idea-oss
    jetbrains.pycharm-oss
    dbeaver-bin
    shotcut
    meld
    vscode
    vscodium
    pnpm
    networkmanager
    pcmanfm
    pavucontrol
    blueman
    bluetooth_battery
    solaar
    usbutils
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
