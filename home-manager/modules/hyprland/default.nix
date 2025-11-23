{ pkgs, ... }:

{
  home.packages = with pkgs; [
    brightnessctl
    bc
    hypridle
    swaynotificationcenter
    xdg-desktop-portal-hyprland
  ];

  services.wlsunset = {
    enable = true;
    sunrise = "06:00";
    sunset = "19:00";
  };

  services.hyprpaper = {
    enable = true;
    settings = {
      preload = "~/Pictures/Wallpapers/nixos-dark-rainbow.png";
      wallpaper = [
        "eDP-1, ~/Pictures/Wallpapers/nixos-dark-rainbow.png"
        "HDMI-A-1, ~/Pictures/Wallpapers/nixos-dark-rainbow.png"
      ];
    };
  };

  services.hypridle = {
    enable = true;
    settings = {
      general = {
        after_sleep_cmd = "hyprctl dispatch dpms on";
        # before_sleep_cmd = "loginctl lock-session";
        ignore_dbus_inhibit = false;
        lock_cmd = "hyprlock";
      };

      listener = [
        {
          timeout = 600;
          on-timeout = "brightnessctl -s set 10";
          on-resume = "brightnessctl -r";
        }
        {
          timeout = 720;
          on-timeout = "hyprlock";
        }
        {
          timeout = 750;
          on-timeout = "hyprctl dispatch dpms off";
          on-resume = "hyprctl dispatch dpms on";
        }
        {
          timeout = 1800;
          on-timeout = "systemctl suspend";
        }
      ];
    };
  };

  wayland.windowManager.hyprland = {
    enable = true;

    xwayland.enable = true;
    systemd.enable = true;

    package = pkgs.hyprland;

    settings = {
      "$mod" = "SUPER";
      "$menu" = "wofi drun";
      # "$terminal" = "ghostty";
      # "$terminal" = "alacritty";
      "$terminal" = "wezterm";
      "$fileManager" = "nautilus";
      # "$browser" = "firefox";
      "$browser" = "zen";

      env = [
        "XCURSOR_SIZE,16"
        "XCURSOR_THEME,Adwaita"
        "HYPRCURSOR_SIZE,16"
        "HYPRCURSOR_THEME,Adwaita"

        "NIXOS_OZONE_WL,1"
        "MOZ_ENABLE_WAYLAND,1"
        "WLR_NO_HARDWARE_CURSORS,1"

        "XDG_SESSION_TYPE,wayland"
        "XDG_SESSION_DESKTOP,Hyprland"
        "XDG_SESSION_DESKTOP,Hyprland"

        "OZONE_PLATFORM,Hyprland"

        "QT_QPA_PLATFORM,wayland;xcb"
        "QT_QPA_PLATFORMTHEME,qt6ct"
        "QT_WAYLAND_DISABLE_WINDOWDECORATION,1"
        "QT_AUTO_SCREEN_SCALE_FACTOR,1"
      ];

      exec-once = [
        "waybar"
        "hypridle"
      ];

      monitor = [
        "eDP-1, 1920x1080@60, 0x0, 1"
        "HDMI-A-1, 3840x2160@60, 1920x0, 1"
      ];

      general = {
        gaps_in = 0;
        gaps_out = 0;
        border_size = 1;
        "col.active_border" = "rgba(5277c3ff)";
        "col.inactive_border" = "rgba(ffffff00)";
        resize_on_border = false;
        allow_tearing = false;
      };

      decoration = {
        rounding = 2;
        active_opacity = 1.0;
        inactive_opacity = 0.8;
        blur = {
          enabled = false;
          size = 3;
          passes = 1;
        };
      };

      windowrule = [
        "float, class:blueman-manager, title:blueman-manager"
      ];

      master = {
        new_status = "master";
      };

      animations = {
        enabled = false;
      };

      binds = { };

      input = {
        kb_layout = "us";
        # follow_mouse = 1;
        touchpad = {
          natural_scroll = true;
        };
        sensitivity = 0.7; # -1.0 - 1.0, 0 means no modification.
      };

      bind = [
        "$mod, RETURN, exec, $terminal"
        "$mod, M, exec, $fileManager"
        "$mod, W, exec, $browser"
        "$mod, SPACE, exec, $menu"
        "$mod, ESCAPE, exec, hyprlock"
        "$mod, Q, killactive,"
        "$mod SHIFT, Q, exit,"
        "$mod, V, togglefloating,"
        "$mod, P, pseudo"
        "$mod, T, togglesplit"
        "$mod, F, fullscreen, 0"
        "$mod SHIFT, B, exec, ~/.config/hypr/scripts/reload-waybar.sh" # Reload Waybar
        "$mod SHIFT, W, exec, ~/.config/hypr/scripts/reload-hyprpaper.sh" # Reload hyprpaper after a changing the wallpaper

        "$mod, h, movefocus, l"
        "$mod, l, movefocus, r"
        "$mod, k, movefocus, u"
        "$mod, j, movefocus, d"

        "$mod SHIFT, h, resizeactive, -15 0"
        "$mod SHIFT, j, resizeactive, 0 15"
        "$mod SHIFT, k, resizeactive, 0 -15"
        "$mod SHIFT, l, resizeactive, 15 0"

        "$mod SHIFT, Print, exec, grimblast --notify copy area"
        "$mod, Print, exec, grimblast --notify copy active"
      ]
      ++ (builtins.concatLists (
        builtins.genList (
          i:
          let
            ws = i + 1;
          in
          [
            "$mod, code:1${toString i}, workspace, ${toString ws}"
            "$mod SHIFT, code:1${toString i}, movetoworkspace, ${toString ws}"
          ]
        ) 9
      ));

      bindm = [
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
      ];
      bindel = [
        ",XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
        ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
        ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ",XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"

        ",XF86MonBrightnessUp, exec, brightnessctl s 3%+"
        ",XF86MonBrightnessDown, exec, brightnessctl s 3%-"
      ];
    };
  };
}
