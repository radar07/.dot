{ pkgs, ... }:
{
  xdg.portal = {
    enable = true;

    # Use proper portals for Hyprland
    extraPortals = with pkgs; [
      xdg-desktop-portal-hyprland
      xdg-desktop-portal-gtk
    ];

    # Configure portal backends
    config = {
      common = {
        default = [ "gtk" ];
      };
      hyprland = {
        default = [
          "hyprland"
          "gtk"
        ];
        "org.freedesktop.impl.portal.Settings" = [ "hyprland" ];
      };
    };

    # Force XDG portals to use GTK implementation for most things
    xdgOpenUsePortal = true;
  };
  # Ensure GTK settings are available system-wide
  programs.dconf.enable = true;

  # Required for portals
  services.dbus.enable = true;
}
