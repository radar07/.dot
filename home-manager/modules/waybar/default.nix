{
  programs.waybar = {
    enable = true;

    settings = [
      {
        layer = "top";
        exclusive = true;
        position = "top";
        spacing = 1;
        fixed-center = true;
        ipc = true;
        margin-top = 3;
        margin-left = 3;
        margin-right = 3;

        modules-left = [
          "hyprland/workspaces"
        ];

        modules-center = [
          "clock"
        ];

        modules-right = [
          "network#speed"
          "custom/separator#line"
          "pulseaudio#microphone"
          "pulseaudio"
          "custom/separator#line"
          "battery"
          "tray"
          "custom/notification"
        ];

        "hyprland/workspaces" = {
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
          show-special = false;
          on-click = "activate";
          on-scroll-up = "hyprctl dispatch workspace e+1";
          on-scroll-down = "hyprctl dispatch workspace e-1";
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
          format-charging = " {icon} {capacity}% ";
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
          format = " {:%I:%M:%S %p}";
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

        "network#speed" = {
          interval = 1;
          format = "{ifname}";
          format-wifi = "  {bandwidthUpBytes}  {bandwidthDownBytes}   {essid}";
          format-ethernet = "  {bandwidthUpBytes}  {bandwidthDownBytes} 󰈁 {ipaddr}";
          format-disconnected = "󰌙";
          tooltip-format = "{ipaddr}";
          format-linked = "󰈁 {ifname} (No IP)";
          tooltip-format-wifi = "{essid} {icon} {signalStrength}%";
          tooltip-format-ethernet = "{ifname} ";
          tooltip-format-disconnected = "Disconnected";
          min-length = 1;
          max-length = 40;
          format-icons = [
            "󰤯"
            "󰤟"
            "󰤢"
            "󰤥"
            "󰤨"
          ];
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
          format-bluetooth = "{icon} 󰂰 {volume}%";
          format-muted = "󰖁";
          on-click = "$HOME/.config/hypr/scripts/Volume.sh --toggle";
          format-icons = {
            headphone = "";
            hands-free = "";
            headset = "";
            phone = "";
            portable = "";
            car = "";
            default = [
              ""
              ""
              "󰕾"
              ""
            ];
            ignored-sinks = [
              "Easy Effects Sink"
            ];
          };
        };

        "pulseaudio#microphone" = {
          format = "{format_source}";
          format-source = " {volume}%";
          format-source-muted = "";
          on-click-right = "pavucontrol -t 4";
          tooltip-format = "{source_desc} | {source_volume}%";
          scroll-step = 5;
        };

        "tray" = {
          icon-size = 20;
          spacing = 4;
        };
      }
    ];
    style = ''
      * {
        font-family: "FiraCode Nerd Font";
        font-weight: bold;
        min-height: 0;
        /* set font-size to 100% if font scaling is set to 1.00 using nwg-look */
        font-size: 95%;
      }

      window#waybar {
        background: transparent;
        border-radius: 5px;
        color: whitesmoke;
      }

      window#waybar.hidden {
        opacity: 0.5;
      }

      window#waybar.empty,
      window#waybar.empty #window {
        padding: 0px;
        border: 0px;
        background-color: transparent;
      }

      tooltip {
        color: #cdd6f4;
        background: #1e1e2e;
        border-radius: 10px;
        border-width: 2px;
        border-style: solid;
        border-color: #11111b;
      }

      tooltip label {
        color: #cdd6f4;
        padding-right: 2px;
        padding-left: 2px;
      }

      .modules-right,
      .modules-center,
      .modules-left {
        border-radius: 5px 5px 5px 5px;
        background-color: #1e1e2e;
        padding-top: 0px;
        padding-bottom: 0px;
        padding-right: 4px;
        padding-left: 4px;
      }

      #taskbar button,
      #workspaces button {
        color: #1e1e2e;
        background-color: #cdd6f4;
        padding: 0px 5px;
        margin: 4px 1px;
        border-radius: 15px;
        animation: gradient_f 20s ease-in infinite;
        transition: all 0.5s cubic-bezier(0.55, -0.68, 0.48, 1.682);
      }

      #taskbar button.active,
      #workspaces button.active {
        color: #1e1e2e;
        border-radius: 15px;
        background-color: #cdd6f4;
        min-width: 40px;
        background-size: 400% 400%;
        opacity: 1;
        transition: all 0.3s cubic-bezier(0.55, -0.68, 0.48, 1.682);
      }

      #workspaces button.focused {
        color: #b4befe;
      }

      #workspaces button.urgent {
        color: #11111b;
        border-radius: 10px;
      }

      #taskbar button:hover,
      #workspaces button:hover {
        color: #b4befe;
        border-radius: 15px;
        padding-left: 2px;
        padding-right: 2px;
        animation: gradient_f 20s ease-in infinite;
        transition: all 0.3s cubic-bezier(0.55, -0.68, 0.48, 1.682);
      }
      #battery,
      #bluetooth,
      #clock,
      #disk,
      #idle_inhibitor,
      #tray,
      #window,
      #workspaces {
        color: #cdd6f4;
        border-radius: 8px;
        padding-top: 5px;
        padding-bottom: 5px;
        padding-right: 6px;
        padding-left: 6px;
      }

      #temperature.critical {
        background-color: #ff0000;
      }

      @keyframes blink {
        to {
          color: #000000;
        }
      }

      /*-----Indicators----*/
      #custom-hypridle.notactive,
      #idle_inhibitor.activated {
        color: #39ff14;
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
