{
  programs.waybar = {
    enable = true;

    settings = [
      {
        modules-left = [
          "custom/logo"
          "hyprland/workspaces"
          "custom/scripts"
        ];

        modules-center = [
          "clock"
        ];

        modules-right = [
          "bluetooth"
          "network"
          "pulseaudio#microphone"
          "pulseaudio"
          "battery"
          "tray"
          "custom/notification"
        ];

        "custom/logo" = {
          format = " ";
          tooltip = false;
        };

        "hyprland/workspaces" = {
          disable-scroll = true;
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
          on-click = "activate";
        };

        "hyprland/window" = {
          format = "<span font='9' rise='-4444'>{}</span>";
          max-length = 20;
        };

        "custom/separator#line" = {
          format = " | ";
          interval = "once";
          tooltip = false;
        };

        "bluetooth" = {
          format = " 󰂯 ";
          format-disabled = " 󰂲 ";
          format-connected = " 󰂱 ";
          on-click = "blueman-manager";
        };

        "battery" = {
          interval = 5;

          format = "{icon} {capacity}% ";
          format-icons = [
            ""
            ""
            ""
            ""
            ""
          ];
          format-charging = "{icon} {capacity}%";
          format-plugged = "{icon} {capacity}%";
          tooltip-format = " {power}W - {timeTo}";

          states = {
            full = 100;
            great = 97;
            good = 85;
            ok = 50;
            warning = 30;
            low = 20;
            critical = 10;
          };
        };

        "clock" = {
          interval = 1;
          format = " {:%I:%M %p}";
          format-alt = " {:%H:%M:%p  %Y, %d %B, %A}";
          tooltip-format = "<tt><small>{calendar}</small></tt>";
          calendar = {
            mode = "year";
            mode-mon-col = 3;
            weeks-pos = "right";
            on-scroll = 1;
            format = {
              months = "<span color='#b4befe'><b>{}</b></span>";
              days = "<span color='#cdd6f4'><b>{}</b></span>";
              weeks = "<span color='#89b4fa'><b>W{}</b></span>";
              weekdays = "<span color='#f38ba8'><b>{}</b></span>";
              today = "<span color='#f38ba8'><b><u>{}</u></b></span>";
            };
          };
        };

        "network" = {
          format-wifi = "  {essid}";
          format-ethernet = "  Ethernet";
          format-linked = "  Linked (No IP)";
          format-disconnected = "  Disconnected";
          tooltip = false;
        };

        "custom/notification" = {
          tooltip = false;
          format = "{icon}";
          format-icons = {
            notification = "<span foreground='red'><sup></sup></span> ";
            none = " ";
            dnd-notification = "<span foreground='red'><sup></sup></span> ";
            dnd-none = " ";
            inhibited-notification = "<span foreground='red'><sup></sup></span> ";
            inhibited-none = " ";
            dnd-inhibited-notification = "<span foreground='red'><sup></sup></span> ";
            dnd-inhibited-none = " ";
          };
          return-type = "json";
          exec-if = "which swaync-client";
          exec = "swaync-client -swb";
          on-click = "swaync-client -t -sw";
          on-click-right = "swaync-client -d -sw";
          escape = true;
        };

        "pulseaudio" = {
          format = "{icon} {volume}%";
          format-muted = "  {volume}%";
          format-bluetooth = " {volume}%";
          format-bluetooth-muted = "  {volume}%";
          format-icons = {
            headphone = " ";
            headset = " ";
            default = [ " " ];
          };
          on-click = "pavucontrol";
        };

        "pulseaudio#microphone" = {
          format = "{format_source}";
          format-source = " {volume}%";
          format-source-muted = "  Muted";
          on-click-right = "pavucontrol -t 4";
          tooltip-format = "{source_desc} | {source_volume}%";
          scroll-step = 5;
        };

        "tray" = {
          icon-size = 20;
          spacing = 10;
          cursor = true;
        };

        "custom/scripts" = {
          format = "{}";
          exec = "$HOME/.dot/scripts/interview-countdown.sh";
          interval = 3600;
          tooltip-format = "Interview Preparation Countdown\nTarget: April 30, 2026";
          on-click = "notify-send 'Interview Prep' 'Keep going! You got this! 💪'";
        };
      }
    ];
    style = ''
      * {
        font-family: "FiraCode Nerd Font";
        font-size: 95%;
        font-weight: bold;
        min-height: 0;
      }

      #waybar {
        background: alpha(#1e1e2e, 0.8);
      }

      window,
      tooltip {
        background-color: #1e1e2e;
      }

      #workspaces {
        margin: 1px 0;
      }

      #workspaces button {
        color: #cdd6f4;
        border: none;
        padding: 0px 5px;
        transition: none;
        font-size: 1.2em;
      }

      #workspaces button.active {
        color: #cdd6f4;
        border: 2px solid #cba657;
        border-radius: 15px;
        padding: 0 8px;
        margin: 0 2px;
      }

      #workspaces button.urgent {
        color: #11111b;
        border-radius: 10px;
      }

      #workspaces button:hover {
        color: #cdd6f4;
        border-bottom: 1px solid #cba657;
        padding: 0 8px;
        transition: none;
      }

      #battery,
      #bluetooth,
      #clock,
      #custom-logo,
      #custom-notification,
      #custom-scripts,
      #network,
      #pulseaudio,
      #pulseaudio#microphone,
      #tray {
        color: #cdd6f4;
        border-radius: 8px;
        padding-top: 5px;
        padding-bottom: 5px;
        padding-right: 6px;
        padding-left: 6px;
      }

      #custom-logo {
        color: #89b4fa;
        font-size: 1.2em;
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
