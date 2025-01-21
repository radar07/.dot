{
  imports = [
    ./alacritty
    ./bat
    ./btop
    ./fastfetch
    ./ghostty
    ./git
    ./hyprland
    ./lazygit
    ./mpv
    ./neovim
    ./starship
    ./tmux
    ./vim
    ./wofi
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
