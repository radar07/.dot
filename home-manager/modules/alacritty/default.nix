{
  programs.alacritty = {
    enable = true;
    settings = {
      general = {
        live_config_reload = true;
      };

      # Colors (Gruvbox Material Hard Dark)

      # Default colors
      colors.primary = {
        background = "#1d2021";
        foreground = "#d4be98";
      };

      # Normal colors
      colors.normal = {
        black = "#32302f";
        red = "#ea6962";
        green = "#a9b665";
        yellow = "#d8a657";
        blue = "#7daea3";
        magenta = "#d3869b";
        cyan = "#89b482";
        white = "#d4be98";
      };

      # Bright colors (same as normal colors)
      colors.bright = {
        black = "#32302f";
        red = "#ea6962";
        green = "#a9b665";
        yellow = "#d8a657";
        blue = "#7daea3";
        magenta = "#d3869b";
        cyan = "#89b482";
        white = "#d4be98";
      };

      env = {
        TERM = "xterm-256color";
      };

      cursor.style = {
        blinking = "Never";
      };

      font = {
        size = 12.0;
      };

      font.bold = {
        family = "Fira Code Nerd Font";
      };

      font.bold_italic = {
        family = "Fira Code Nerd Font";
      };

      font.italic = {
        family = "Fira Code Nerd Font";
      };

      font.normal = {
        family = "Fira Code Nerd Font";
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
