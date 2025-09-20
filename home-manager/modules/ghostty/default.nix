{ pkgs, ... }:

{
  home.packages = with pkgs; [
    ghostty
  ];

  xdg.configFile."ghostty/config".text = ''
    # Fonts
    # font-family = "Iosevka Nerd Font"

    font-size = 14

    font-variation = wght=450
    window-inherit-font-size = true

    mouse-hide-while-typing = true

    theme = kanagawabones

    background-opacity = 0.95
    background-blur-radius = true

    window-padding-y = 2,0
    window-padding-balance = true

    window-theme = ghostty
    window-save-state = always
    window-decoration = false

    # Keybinds
    keybind = super+shift+r=reload_config

    ## Tabs
    keybind = super+shift+t=new_tab
    keybind = super+shift+l=next_tab
    keybind = super+shift+h=previous_tab

    keybind = super+shift+comma=move_tab:-1
    keybind = super+shift+period=move_tab:1
    keybind = super+shift+m=toggle_split_zoom

    ## Splits
    # keybind = ctrl+h=goto_split:left
    # keybind = ctrl+j=goto_split:bottom
    # keybind = ctrl+k=goto_split:top
    # keybind = ctrl+l=goto_split:right
    # keybind = ctrl+shift+enter=new_split:auto

    ## Clipboard
    keybind = ctrl+shift+c=copy_to_clipboard
    keybind = ctrl+shift+v=paste_from_clipboard

    # GTK
    gtk-single-instance = true
    gtk-tabs-location = bottom
    gtk-wide-tabs = false

    shell-integration-features = cursor,sudo
    copy-on-select = true
  '';
}
