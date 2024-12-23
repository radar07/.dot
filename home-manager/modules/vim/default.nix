{ pkgs, ... }:

{
  programs.vim = {
    enable = true;
    extraConfig = builtins.readFile ./vimrc;

    plugins = with pkgs.vimPlugins; [
      gruvbox-community
    ];
  };
}
