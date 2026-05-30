{
  imports = [
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
    ./tmux
    ./vim
    ./wezterm
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
