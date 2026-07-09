{
  programs.lazygit = {
    enable = true;
    settings = {
      gui = {
        nerdFontsVersion = "3";
        showIcons = true;
      };
      git = {
        pagers = [
          {
            pager = "delta --dark --paging=never";
          }
        ];
      };
    };
  };
}
