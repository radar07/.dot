{ pkgs, ... }:

{
  imports = [
    ./bat
    ./git
    ./lazygit
    ./starship
    ./tmux
    ./vim
    ./zsh
  ];

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };
}
