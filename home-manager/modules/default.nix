{
  imports = [
    ./alacritty
    ./bat
    ./btop
    ./fastfetch
    ./ghostty
    ./git
    ./hyprland
    ./hyprlock
    ./lazygit
    ./mpv
    ./neovim
    ./starship
    ./tmux
    ./vim
    ./waybar
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
