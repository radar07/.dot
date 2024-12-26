{ pkgs, ... }:

{
  imports = [
    ./bat
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
