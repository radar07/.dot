{
  programs.fastfetch = {
    enable = true;
    settings = {
      logo = {
        # source = "~/Downloads/Tengen-Toppa-Gurren.png";
        # width = 30;
      };
      modules = [
        "title"
        "Separator"
        "OS"
        "Host"
        "Kernel"
        "Uptime"
        "Packages"
        "Shell"
        "DE"
        "WM"
        "CPU"
        "GPU"
        "Memory"
        "Swap"
        "Disk"
        "Break"
        "Colors"
      ];
    };
  };
}
