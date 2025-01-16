{
  imports = [
    ./alacritty
    ./bat
    ./btop
    ./fastfetch
    ./git
    ./lazygit
    ./mpv
    ./neovim
    ./starship
    ./tmux
    ./vim
    ./zathura
    ./zed
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
