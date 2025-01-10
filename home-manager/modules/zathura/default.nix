{
  programs.zathura = {
    enable = true;
    extraConfig = ''
      set selection-clipboard clipboard
      set statusbar-h-padding 0
      set statusbar-v-padding 0

      set page-padding 5

      map R rotate
      map r reload
      map u scroll half-up
      map d scroll half-down

      map K zoom in
      map J zoom out
    '';
  };
}
