{
  imports = [
    ./alacritty
    ./bat
    ./btop
    ./fastfetch
    ./ghostty
    ./git
    # ./helix
    ./hyprland
    ./hyprlock
    ./lazygit
    ./mpv
    ./neovim
    ./starship
    ./swaync
    ./tmux
    ./vim
    ./waybar
    ./wezterm
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
