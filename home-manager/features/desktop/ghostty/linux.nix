{ ... }:

{
  # Append Linux / GTK-specific ghostty settings
  xdg.configFile."ghostty/config".text = ''

    # Linux / GTK
    window-decoration = false
    gtk-single-instance = true
    gtk-tabs-location = bottom
    gtk-wide-tabs = false
  '';
}
