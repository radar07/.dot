{
  programs.wezterm = {
    enable = true;

    extraConfig = ''
      local wezterm = require("wezterm")
      local config = {}

      -- In newer versions of wezterm, use the config_builder which will
      -- help provide clearer error messages
      if wezterm.config_builder then
        config = wezterm.config_builder()
      end

      config.color_scheme = "kanagawabones"

      config.font_size = 14
      config.font = wezterm.font_with_fallback({
        { family = "FiraCode Nerd Font", weight = 450 },
        { family = "JetBrains Mono Nerd Font", weight = "Regular" },
      })

      -- FiraCode
      config.harfbuzz_features = { "zero", "cv02", "ss02", "ss03", "ss05" }

      config.window_background_opacity = 0.95

      config.warn_about_missing_glyphs = false

      config.use_fancy_tab_bar = false

      config.tab_bar_at_bottom = true

      config.hide_tab_bar_if_only_one_tab = true

      config.scrollback_lines = 10000

      config.max_fps = 120

      return config
    '';
  };
}
