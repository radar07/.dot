{ pkgs, ... }:

{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.radar = {
    isNormalUser = true;
    description = "Pranav RK";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    packages = with pkgs; [
    ];
    shell = pkgs.zsh;
  };

  programs.zsh = {
    enable = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      ls = "eza --color=always --grid --icons --group-directories-first";
      la = "eza -a --color=always --grid --icons --group-directories-first";
      ll = "eza -l --color=always --grid --icons --group-directories-first";
      lla = "eza -al --color=always --grid --icons --group-directories-first";

      cp = "cp -i";
      mv = "mv -i";
      rm = "rm -i";

      tmux = "tmux -u";

      ff = "fastfetch";
    };
  };

  # Install firefox.
  programs.firefox.enable = true;

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
    pinentryPackage = pkgs.pinentry-gnome3;
  };

  programs.hyprland = {
    enable = true;
  };
}
