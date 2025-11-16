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
    (lua.withPackages (
      ps: with ps; [
        busted
        luafilesystem
      ]
    ))
    love
    rustup
    git
    gh
    lazygit
    vim
    neovim
    helix
    openjdk21
    jetbrains.idea-community
    jetbrains.pycharm-community
    dbeaver-bin
    shotcut
    meld
    vscode
    vscodium
    pnpm
    deno
    networkmanager
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
    nixfmt-rfc-style
  ];
}
