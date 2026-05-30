{
  inputs,
  config,
  ...
}:

{
  imports = [
    inputs.noctalia.homeModules.default
  ];

  programs.noctalia-shell = {
    enable = true;

    settings = {
      bar = {
        density = "compact";
        position = "top";
        barType = "simple";
        backgroundOpacity = 0.10;
        showCapsule = true;
        widgets = {
          left = [
            {
              id = "Launcher";
            }
            {
              id = "Workspace";
              hideUnoccupied = false;
              labelMode = "index";
            }
            {
              id = "MediaMini";
            }
          ];
          center = [
            {
              id = "Clock";
              formatHorizontal = "HH:mm ddd, MMM dd";
              formatVertical = "HH mm";
              useMonospacedFont = true;
              usePrimaryColor = false;
            }
          ];
          right = [
            {
              id = "SystemMonitor";
            }
            {
              id = "Tray";
            }
            {
              id = "NotificationHistory";
            }
            {
              id = "Battery";
            }
            {
              id = "Volume";
            }
            {
              id = "ControlCenter";
              useDistroLogo = true;
              icon = "noctalia"; # used when distro logo is set to false
              enableColorization = true;
            }
          ];
        };
      };

      ui = {
        fontDefault = "FiraCode Nerd Font";
      };

      colorSchemes = {
        predefinedScheme = "Rosepine";
      };

      location = {
        analogClockInCalendar = "true";
        name = "Bengaluru, India";
        autoLocate = true;
      };

      dock = {
        enabled = false;
      };

      network = {

      };
    };
    # this may also be a string or a path to a JSON file.
  };
}
