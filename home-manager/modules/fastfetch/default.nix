{ pkgs, ... }:

{
  programs.fastfetch = {
    enable = true;
    settings = {
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
