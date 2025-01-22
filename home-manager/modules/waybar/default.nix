{
  programs.waybar = {
    enable = true;

    settings = [
      {
        modules-left = [
          "custom/logo"
          "hyprland/workspaces"
        ];

        modules-center = [
          "clock"
        ];

        modules-right = [
          "pulseaudio"
          "pulseaudio#microphone"
          "network"
          "battery"
          "tray"
          "custom/notification"
          "custom/exit"
        ];

        "custom/logo" = { };

        "hyprland/workspaces" = {
          on-click = "activate";
          active-only = false;
          all-outputs = true;
          format = "{icon}";
          format-icons = {
            "1" = "一";
            "2" = "二";
            "3" = "三";
            "4" = "四";
            "5" = "五";
            "6" = "六";
            "7" = "七";
            "8" = "八";
            "9" = "九";
            "10" = "十";
          };
        };

        "clock" = {
          tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
          format = "  {:%a %I:%M %p}";
          format-alt = "  {:%a %I:%M   %Y, %d %B, %A}";
        };

        "pulseaudio" = {
          format = "{icon} {volume}%";
          format-bluetooth = "{icon}  {volume}%";
          format-muted = " Muted";
          format-icons = {
            headphone = "";
            hands-free = "";
            headset = "";
            phone = "";
            portable = "";
            car = "";
            default = [
              ""
              ""
              "󰕾"
              ""
            ];
          };
          scroll-step = 5.0;
          on-click-right = "pavucontrol -t 3";
          smooth-scrolling-threshold = 1;
        };

        "pulseaudio#microphone" = {
          format = "{format_source}";
          format-source = "  {volume}%";
          format-source-muted = " 󰍭 Muted";
          on-click-right = "pavucontrol -t 4";
          scroll-step = 5;
        };

        "network" = {
          format = "{ifname}";
          format-wifi = "  {essid}";
          format-ethernet = "󰈁 {ipaddr}";
          format-disconnected = "Disconnected ⚠";
          tooltip-format = " {ifname} via {gwaddri}";
          tooltip-format-wifi = "  {essid} ({signalStrength}%)";
          tooltip-format-ethernet = "  {ifname} ({ipaddr}/{cidr})";
          tooltip-format-disconnected = "󰈂 Disconnected";
          max-length = 50;
          on-click = "nm-connection-editor";
        };

        "battery" = {
          states = {
            good = 80;
            warning = 30;
            critical = 15;
          };
          format = "{icon} {capacity}%";
          format-charging = "⚡ {capacity}%";
          format-plugged = "  {capacity}%";
          format-alt = "{icon} {time}";
          format-icons = [
            " "
            " "
            " "
            " "
            " "
          ];
        };

        "tray" = {
          icon-size = 17;
          spacing = 5;
        };

        "custom/notification" = { };

        "custom/exit" = {
          tooltip = false;
          format = "{icon}";
          format-icons = {
            notification = " <span foreground='red'><sup></sup></span>";
            none = " ";
            dnd-notification = " <span foreground='red'><sup></sup></span>";
            dnd-none = " ";
            inhibited-notification = " <span foreground='red'><sup></sup></span>";
            inhibited-none = " ";
            dnd-inhibited-notification = " <span foreground='red'><sup></sup></span>";
            dnd-inhibited-none = " ";
          };
          return-type = "json";
          exec-if = "which swaync-client";
          exec = "swaync-client -swb";
          on-click = "swaync-client -t -sw";
          on-click-right = "swaync-client -d -sw";
          escape = true;
        };
      }
    ];
    style = ''
            * {
        font-family: "Fira Code Nerd Font";
        font-weight: bold;
        min-height: 0;
        /* set font-size to 100% if font scaling is set to 1.00 using nwg-look */
        font-size: 96%;
        font-feature-settings: '"zero", "ss01", "ss02", "ss03", "ss04", "ss05", "cv31"';
        padding: 0px;
        margin-top: 1px;
        margin-bottom: 1px;
      }

      window#waybar {
        background: rgba(0, 0, 0, 0);
      }

      window#waybar.hidden {
        opacity: 0.5;
      }

      tooltip {
        background: rgba(0, 0, 0, 0.6);
        border-radius: 10px;
      }

      tooltip label {
        color: #cba6f7;
        margin-right: 2px;
        margin-left: 2px;
      }

      /*-----module groups----*/
      .modules-right {
        background-color: rgba(0, 0, 0, 0.6);
        border-radius: 10px;
      }

      .modules-center {
        background-color: rgba(0, 0, 0, 0.6);
        border-radius: 10px;
      }

      .modules-left {
        background-color: rgba(0, 0, 0, 0.6);
        border-radius: 10px;
      }

      #workspaces button {
        padding: 2px;
        color: #fff;
        margin-right: 5px;
      }

      #workspaces button.active {
        color: #000;
        background-color: #fff;
        border-radius: 15px 15px 15px 15px;
      }

      #workspaces button.focused {
        color: #d8dee9;
      }

      #workspaces button.urgent {
        color: #11111b;
        border-radius: 10px;
      }

      #workspaces button:hover {
        color: #000;
        border-radius: 15px;
      }

      #pulseaudio,
      #pulseaudio#microphone {
        color: #fff;
        border-radius: 10px;
      }

      #clock,
      #battery,
      #network,
      #wireplumber,
      #mode,
      #tray,
      #idle_inhibitor,
      #bluetooth,
      #workspaces,
      #custom-notification,
      #idle_inhibitor {
        color: #fff;
        padding: 0px 10px;
        border-radius: 10px;
      }
      #custom-exit {
        color: #f00;
      }

      @keyframes blink {
        to {
          color: #000000;
        }
      }

      #battery.critical:not(.charging) {
        color: #f53c3c;
        animation-name: blink;
        animation-duration: 0.5s;
        animation-timing-function: linear;
        animation-iteration-count: infinite;
        animation-direction: alternate;
      }
    '';
  };
}
