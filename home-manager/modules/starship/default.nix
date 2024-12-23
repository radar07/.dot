{ pkgs, ... }:

{
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      character = {
        success_symbol = "[ζ](bold green)";
        error_symbol = "[ζ](bold red)";
        vimcmd_symbol = "[](bold green)";
      };
      package = {
        disabled = true;
      };
      aws = {
        format = "";
      };
    };
  };
}
