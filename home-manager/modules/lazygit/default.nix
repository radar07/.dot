{
  programs.lazygit = {
    enable = true;
    settings = {
      gui = {
        nerdFontsVersion = "3";
        showIcons = true;
      };
      git = {
        diffRenderers = [
          {
            command = "delta --dark --paging=never";
          }
        ];
      };
    };
  };
}
