{ pkgs, ... }:

{
  programs.lazygit = {
    enable = true;
    settings = {
      gui = {
        nerdFontsVersion = "3";
        showIcons = true;
      };
      git = {
        paging = {
          pager = "delta --dark --paging=never";
        };
      };
    };
  };
}
