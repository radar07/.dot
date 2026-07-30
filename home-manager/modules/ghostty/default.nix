{ pkgs, ... }:

{
  programs.ghostty = {
    enable = true;

    settings = {
      # Fonts
      # font-family = "FiraCode Nerd Font Mono";

      font-size = 14;

      # font-style = Medium;
      # font-variation = "wght=700";

      # font-feature=zero;
      # font-feature=cv02;
      # font-feature=ss02;
      # font-feature=ss03;
      # font-feature=ss05;

      window-inherit-font-size = true;

      mouse-hide-while-typing = true;

      theme = "Kanagawabones";

      background-opacity = 0.98;

      window-theme = "ghostty";
      window-save-state = "always";
      window-decoration = false;

      # Keybinds
      keybind = [
        "super+shift+r=reload_config"
        ## Tabs
        "super+shift+t=new_tab"
        "super+shift+l=next_tab"
        "super+shift+h=previous_tab"

        "super+shift+comma=move_tab:-1"
        "super+shift+period=move_tab:1"
        "super+shift+m=toggle_split_zoom"

        ## Splits
        "ctrl+h=goto_split:left"
        "ctrl+j=goto_split:bottom"
        "ctrl+k=goto_split:top"
        "ctrl+l=goto_split:right"
        "ctrl+shift+enter=new_split:auto"

        ## Clipboard
        "ctrl+shift+c=copy_to_clipboard"
        "ctrl+shift+v=paste_from_clipboard"
      ];

      # GTK
      gtk-single-instance = true;
      gtk-tabs-location = "bottom";
      gtk-wide-tabs = false;

      shell-integration-features = "cursor,sudo";
      copy-on-select = true;
    };
  };
}
