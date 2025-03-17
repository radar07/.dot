{
  programs.alacritty = {
    enable = true;
    settings = {
      general = {
        live_config_reload = true;
      };

      # Colors (Tokyo Night)
      # Source https//github.com/zatchheems/tokyo-night-alacritty-theme

      # Default colors
      colors.primary = {
        background = "#1a1b26";
        foreground = "#a9b1d6";
      };

      # Normal colors
      colors.normal = {
        black = "#32344a";
        red = "#f7768e";
        green = "#9ece6a";
        yellow = "#e0af68";
        blue = "#7aa2f7";
        magenta = "#ad8ee6";
        cyan = "#449dab";
        white = "#787c99";
      };

      # Bright colors
      colors.bright = {
        black = "#444b6a";
        red = "#ff7a93";
        green = "#b9f27c";
        yellow = "#ff9e64";
        blue = "#7da6ff";
        magenta = "#bb9af7";
        cyan = "#0db9d7";
        white = "#acb0d0";
      };

      env = {
        TERM = "xterm-256color";
      };

      cursor.style = {
        blinking = "Never";
      };

      font = {
        size = 14.0;
      };

      font.bold = {
        family = "JetbrainsMono Nerd Font";
      };

      font.bold_italic = {
        family = "JetbrainsMono Nerd Font";
      };

      font.italic = {
        family = "JetbrainsMono Nerd Font";
      };

      font.normal = {
        family = "JetbrainsMono Nerd Font";
      };

      font.offset = {
        x = 0;
        y = 0;
      };

      font.glyph_offset = {
        x = 0;
        y = 0;
      };

      scrolling = {
        history = 10000;
        multiplier = 10;
      };

      selection = {
        save_to_clipboard = true;
        # semantic_escape_chars = ",│`|:\"" ()[]{}<>";
      };

      window = {
        dynamic_title = false;
        opacity = 0.95;
      };

      window.padding = {
        x = 2;
        y = 2;
      };
    };
  };
}
