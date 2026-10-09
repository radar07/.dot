{
  programs.alacritty = {
    enable = true;
    settings = {
      general = {
        live_config_reload = true;
      };

      # Colors (Kanagawa Wave)
      # Source https//github.com/rebelot/kanagawa.nvim

      colors.primary = {
        background = "#1f1f28";
        foreground = "#dcd7ba";
      };

      colors.normal = {
        black = "#090618";
        red = "#c34043";
        green = "#76946a";
        yellow = "#c0a36e";
        blue = "#7e9cd8";
        magenta = "#957fb8";
        cyan = "#6a9589";
        white = "#c8c093";
      };

      colors.bright = {
        black = "#727169";
        red = "#e82424";
        green = "#98bb6c";
        yellow = "#e6c384";
        blue = "#7fb4ca";
        magenta = "#938aa9";
        cyan = "#7aa89f";
        white = "#dcd7ba";
      };

      colors.selection = {
        background = "#2d4f67";
        foreground = "#c8c093";
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
