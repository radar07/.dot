{
  programs.wofi = {
    enable = true;
    settings = {
      show = "drun";
      width = 500;
      height = 500;
      always_parse_args = true;
      show_all = false;
      insensitive = true;
      allow_images = true;
      normal_window = true;
      allow_markup = true;
      prompt = "🔍 Search program";
    };
  };
}
