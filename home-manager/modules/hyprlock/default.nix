{
  # FIXME: hyprlock not waiting on password(pam authentication)
  programs.hyprlock = {
    enable = true;
    settings = {
      general = {
        grace = 5;
      };
      background = {
        path = "~/Pictures/Wallpapers/pixel-galaxy.png";
        blur_passes = 3;
        contrast = 0.8916;
        brightness = 0.8172;
        vibrancy = 0.1696;
        vibrancy_darkness = 0.0;
      };
      input-field = {
        size = "280, 80";
        outline_thickness = 2;
        dots_size = 0.2; # Scale of input-field height, 0.2 - 0.8
        dots_spacing = 0.2; # Scale of dots' absolute size, 0.0 - 1.0
        dots_center = true;
        outer_color = "rgba(0, 0, 0, 0)";
        inner_color = "rgba(0, 0, 0, 0.5)";
        font_color = "rgb(200, 200, 200)";
        fade_on_empty = false;
        placeholder_text = ''<i><span foreground="##cdd6f4">Password...</span></i>'';
        hide_input = false;
        position = "0, -120";
        halign = "center";
        valign = "center";
      };
    };
    extraConfig = ''
      # TIME
      label {
          monitor =
          text = cmd[update:1000] echo "$(date +"%-H:%M")"
          font_size = 120
          font_family = FiraCode Nerd Font Bold
          position = 0, -300
          halign = center
          valign = top
      }

      # USER
      label {
          monitor =
          text = Hi there, $USER
          font_size = 25
          font_family = FiraCode Nerd Font
          position = 0, -40
          halign = center
          valign = center
      }

    '';
  };
}
