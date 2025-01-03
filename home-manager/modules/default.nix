{ pkgs, ... }:

{
  imports = [
    ./alacritty
    ./bat
    ./btop
    ./fastfetch
    ./git
    ./lazygit
    ./neovim
    ./starship
    ./tmux
    ./vim
    ./zsh
  ];

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };
  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };
}
