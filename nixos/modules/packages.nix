{ pkgs, ... }:

{
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    git
    gh
    lazygit
    vim
    neovim
    gcc
    gnumake
    cmake
    wget
    unzip
    eza
    zoxide
    tmux
    nixd
    nixfmt-rfc-style
  ];
}
