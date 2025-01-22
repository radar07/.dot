{ pkgs, ... }:

{
  home.packages = with pkgs; [
    brightnessctl
    hypridle
    swaynotificationcenter
    waypaper
  ];

  wayland.windowManager.hyprland = {
    enable = true;

    xwayland.enable = true;
    systemd.enable = true;

    package = pkgs.hyprland;

    settings = {
      "$mod" = "SUPER";
      "$menu" = "wofi drun";
      "$terminal" = "ghostty";
      "$fileManager" = "nautilus";
      "$browser" = "firefox";

      env = [
        "XCURSOR_SIZE,14"
        "HYPRCURSOR_SIZE,14"
        "HYPRCURSOR_THEME,capitaine-cursors"

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
        "waypaper --restore"
        "hypridle"
      ];

      monitor = [
        "eDP-1, 1920x1080@60, 0x0, 1"
      ];

      general = {
        gaps_in = 2;
        gaps_out = 2;
        border_size = 1;
        "col.active_border" = "rgb(969696)";
        "col.inactive_border" = "rgb(595959)";
        resize_on_border = false;
        allow_tearing = false;
      };

      decoration = {
        active_opacity = 1.0;
        inactive_opacity = 0.8;
        blur = {
          enabled = false;
          size = 3;
          passes = 1;
        };
      };

      animations = {
        enabled = false;
      };

      binds = { };

      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };

      gestures = {
        workspace_swipe = false;
      };

      input = {
        kb_layout = "us";
        follow_mouse = 1;
        touchpad = {
          natural_scroll = true;
        };
        sensitivity = 0.7; # -1.0 - 1.0, 0 means no modification.
      };

      bind =
        [
          "$mod, RETURN, exec, $terminal"
          "$mod, M, exec, $fileManager"
          "$mod, W, exec, $browser"
          "$mod, D, exec, $menu"
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

        ",XF86MonBrightnessUp, exec, brightnessctl s 5%+"
        ",XF86MonBrightnessDown, exec, brightnessctl s 5%-"
      ];
    };
  };
}
