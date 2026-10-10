{ pkgs, ... }:

{
  home.packages = with pkgs; [
    brightnessctl
    bc
    grim
    slurp
    wl-clipboard
    xwayland-satellite # X11 apps
    # optional: swayidle swaylock if you prefer them over hypridle/hyprlock
  ];

  # Keep your existing services if they work for you
  services.wlsunset = {
    enable = true;
    sunrise = "06:00";
    sunset = "19:00";
  };

  # hypridle is Hyprland-specific. Use swayidle for Niri (or keep both and only enable one per session).
  services.swayidle = {
    enable = true;
    timeouts = [
      {
        timeout = 600;
        command = "${pkgs.brightnessctl}/bin/brightnessctl -s set 10";
        resumeCommand = "${pkgs.brightnessctl}/bin/brightnessctl -r";
      }
      {
        timeout = 720;
        command = "${pkgs.hyprlock}/bin/hyprlock"; # or switch to swaylock
      }
      {
        timeout = 750;
        command = "niri msg action power-off-monitors";
        resumeCommand = "niri msg action power-on-monitors";
      }
      {
        timeout = 1800;
        command = "systemctl suspend";
      }
    ];
  };

  programs.niri = {
    enable = true;

    settings = {
      environment = {
        XCURSOR_SIZE = "18";
        XCURSOR_THEME = "catppuccin-mocha-dark-cursors";
        GTK_THEME = "adw-gtk3-dark";
        NIXOS_OZONE_WL = "1";
        MOZ_ENABLE_WAYLAND = "1";
        XDG_SESSION_TYPE = "wayland";
        XDG_SESSION_DESKTOP = "niri";
        XDG_CURRENT_DESKTOP = "niri";
        QT_QPA_PLATFORM = "wayland;xcb";
        QT_QPA_PLATFORMTHEME = "adwaita";
        QT_STYLE_OVERRIDE = "adwaita-dark";
        QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
        QT_AUTO_SCREEN_SCALE_FACTOR = "1";
        GTK_IM_MODULE = "fcitx";
        QT_IM_MODULE = "fcitx";
        XMODIFIERS = "@im=fcitx";
        SDL_IM_MODULE = "fcitx";
        GLFW_IM_MODULE = "ibus";
      };

      spawn-at-startup = [
        { sh = "dbus-update-activation-environment --systemd --all"; }
        { sh = "systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"; }
        { sh = "gsettings set org.gnome.desktop.interface color-scheme prefer-dark"; }
        { sh = "noctalia-shell"; }
      ];

      input = {
        keyboard = {
          xkb = {
            layout = "us";
          };
        };
        touchpad = {
          natural-scroll = true;
          accel-speed = 0.7;
        };
      };

      outputs = {
        "eDP-1" = {
          mode = {
            width = 1920;
            height = 1080;
            refresh = 60.0;
          };
          scale = 1.0;
          position = {
            x = 0;
            y = 0;
          };
        };
        "HDMI-A-1" = {
          mode = {
            width = 1920;
            height = 1080;
            refresh = 60.0;
          };
          focus-at-startup = true;
          scale = 1.0;
          position = {
            x = 1920;
            y = 0;
          };
        };
      };

      window-rules = [
        {
          matches = [
            { app-id = "ghostty"; }
          ];
          draw-border-with-background = false;
        }
      ];

      layout = {
        gaps = 5;
        default-column-width = {
          proportion = 1.0;
        };
        focus-ring = {
          enable = true;
          width = 2;
          active.color = "#76946aff";
          inactive.color = "#00000000"; # transparent-ish
        };
        border = {
          width = 0.5; # you had almost no border visual
        };
      };

      prefer-no-csd = true;

      binds = with pkgs.lib; {
        # Apps
        "Mod+Return".action.spawn = "alacritty";
        "Mod+M".action.spawn = "pcmanfm";
        "Mod+W".action.spawn = "zen";
        "Mod+Space".action.spawn = [
          "noctalia-shell"
          "ipc"
          "call"
          "launcher"
          "toggle"
        ];
        "Mod+Escape".action.spawn = "hyprlock"; # or "swaylock"

        "Mod+O".action.toggle-overview = { };

        # Window management
        "Mod+Q".action.close-window = { };
        "Mod+Shift+Q".action.quit = { };
        "Mod+V".action.toggle-window-floating = { };
        "Mod+F".action.fullscreen-window = { };

        # Focus (vim-style) – columns + windows
        "Mod+H".action.focus-column-left = { };
        "Mod+L".action.focus-column-right = { };
        "Mod+K".action.focus-window-up = { };
        "Mod+J".action.focus-window-down = { };

        # Move
        "Mod+Shift+H".action.move-column-left = { };
        "Mod+Shift+L".action.move-column-right = { };
        "Mod+Shift+K".action.move-window-up = { };
        "Mod+Shift+J".action.move-window-down = { };

        # Resize (Niri uses consume/expel + width presets more than pixel resize)
        "Mod+Ctrl+H".action.set-column-width = "-10%";
        "Mod+Ctrl+L".action.set-column-width = "+10%";
        "Mod+Ctrl+K".action.set-window-height = "-10%";
        "Mod+Ctrl+J".action.set-window-height = "+10%";

        # Screenshots (grim + slurp; install grimblast if you prefer it)
        "Mod+Shift+Print".action.spawn = [
          "sh"
          "-c"
          "grim -g \"$(slurp)\" - | wl-copy"
        ];
        "Mod+Print".action.spawn = [
          "sh"
          "-c"
          "grim - | wl-copy"
        ];

        # Input method
        "Mod+Ctrl+Space".action.spawn = [
          "fcitx5-remote"
          "-t"
        ];

        # Workspaces 1–9 (Niri workspaces are named / indexed differently)
        "Mod+1".action.focus-workspace = 1;
        "Mod+2".action.focus-workspace = 2;
        "Mod+3".action.focus-workspace = 3;
        "Mod+4".action.focus-workspace = 4;
        "Mod+5".action.focus-workspace = 5;
        "Mod+6".action.focus-workspace = 6;
        "Mod+7".action.focus-workspace = 7;
        "Mod+8".action.focus-workspace = 8;
        "Mod+9".action.focus-workspace = 9;

        "Mod+Shift+1".action.move-window-to-workspace = 1;
        "Mod+Shift+2".action.move-window-to-workspace = 2;
        "Mod+Shift+3".action.move-window-to-workspace = 3;
        "Mod+Shift+4".action.move-window-to-workspace = 4;
        "Mod+Shift+5".action.move-window-to-workspace = 5;
        "Mod+Shift+6".action.move-window-to-workspace = 6;
        "Mod+Shift+7".action.move-window-to-workspace = 7;
        "Mod+Shift+8".action.move-window-to-workspace = 8;
        "Mod+Shift+9".action.move-window-to-workspace = 9;

        # Media / brightness (same as your bindel)
        "XF86AudioRaiseVolume".action.spawn = [
          "wpctl"
          "set-volume"
          "@DEFAULT_AUDIO_SINK@"
          "5%+"
        ];
        "XF86AudioLowerVolume".action.spawn = [
          "wpctl"
          "set-volume"
          "@DEFAULT_AUDIO_SINK@"
          "5%-"
        ];
        "XF86AudioMute".action.spawn = [
          "wpctl"
          "set-mute"
          "@DEFAULT_AUDIO_SINK@"
          "toggle"
        ];
        "XF86AudioMicMute".action.spawn = [
          "wpctl"
          "set-mute"
          "@DEFAULT_AUDIO_SOURCE@"
          "toggle"
        ];
        "XF86MonBrightnessUp".action.spawn = [
          "brightnessctl"
          "s"
          "3%+"
        ];
        "XF86MonBrightnessDown".action.spawn = [
          "brightnessctl"
          "s"
          "3%-"
        ];
      };
    };
  };
}
