{
  programs.ashell = {
    enable = true;

    settings = {
      appearance = {
        font_name = "UbuntuMono Nerd Font";
      };
      modules = {
        center = [
          "Clock"
        ];
        left = [
          "Workspaces"
        ];
        right = [
          "SystemInfo"
          "Tray"
          [
            "Privacy"
            "Settings"
          ]
          "Notification"
        ];
      };
      workspaces = {
        workspace_names = [
          "一"
          "二"
          "三"
          "四"
          "五"
          "六"
          "七"
          "八"
          "九"
        ];
      };
      CustomModule = [
        {
          name = "Notification";
          icon = "";
          command = "swaync-client -t -sw";
          listen_cmd = "swaync-client -swb";
          icons.dnd = "";
          alert = ".*notification";
        }
      ];
    };
  };
}
