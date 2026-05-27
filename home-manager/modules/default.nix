{
  imports = [
    ./alacritty
    ./bat
    ./btop
    ./fastfetch
    ./ghostty
    ./git
    ./gpg
    ./hyprland
    ./hyprlock
    ./lazygit
    ./mpv
    ./neovim
    ./noctalia
    ./starship
    ./swaync
    ./tmux
    ./vim
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
