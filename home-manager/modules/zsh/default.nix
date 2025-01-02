{ pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    history = {
      size = 1000000;
    };

    initExtra = (builtins.readFile ./zshrc);

    shellAliases = {
      # Colorize grep output (good for log files)
      grep = "grep --color=auto";
      egrep = "egrep --color=auto";
      fgrep = "fgrep --color=auto";
      # eza instead of ls
      ls = "eza --color=always --grid --icons --group-directories-first";
      la = "eza -a --color=always --grid --icons --group-directories-first";
      ll = "eza -l --color=always --grid --icons --group-directories-first";
      lla = "eza -al --color=always --grid --icons --group-directories-first";

      # confirm before overwriting
      cp = "cp -i";
      mv = "mv -i";
      rm = "rm -i";

      cat = "bat";

      # to show unicode characters in tmux sessions
      tmux = "tmux -u";

      ff = "fastfetch";

      # git shell aliases
      g = "git";
      m = "git checkout master";
      mm = "git checkout main";

      # easier to read disk
      df = "df -h";

      # lazygit
      lg = "lazygit";

      # cd for directory jumping
      cd = "z";

      # vim for neovim
      vim = "nvim";
    };

    # plugins = {};
    # sessionVariables = {};
  };
}
