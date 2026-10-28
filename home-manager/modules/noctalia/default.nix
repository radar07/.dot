{
  inputs,
  ...
}:

{
  imports = [
    inputs.noctalia.homeModules.default
  ];

  programs.noctalia = {
    enable = true;

    settings = {
      # Theme
      theme = {
        mode = "dark";
        source = "builtin";
        builtin = "Kanagawa"; # or "Catppuccin", "Noctalia", etc.
      };

      # Wallpaper
      wallpaper = {
        enabled = true;
      };
      wallpaper.default.path = "/home/radar/Pictures/Wallpapers/nixos-dark-rainbow.png";

      # Shell / UI
      shell = {
        font_family = "FiraCode Nerd Font";
      };

      # Bar
      bar.default = {
        position = "top";
        background_opacity = 0.10;
        capsule = true;

        # Make the bar full width
        margin_ends = 0;
        margin_edge = 0;

        start = [
          "workspaces"
          "media"
        ];

        center = [
          "clock"
        ];

        end = [
          "system-monitor"
          "tray"
          "notifications"
          "battery"
          "volume"
          "control-center"
        ];
      };

      # Widget-specific settings
      widget.workspaces = {
        hide_unoccupied = false;
        label_mode = "index";
      };

      widget.clock = {
        format = "{:%H:%M %a, %b %d}";
      };

      # Dock
      dock = {
        enabled = false;
      };

      # Location / region
      location = {
        auto_locate = true;
      };

      # Language (if supported in your version)
      # shell or accessibility section may have language options — check docs
    };
  };
}
