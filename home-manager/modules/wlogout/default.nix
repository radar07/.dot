{
  programs.wlogout = {
    enable = true;
    layout = [
      {
        label = "lock";
        action = "hyprlock";
        text = "Lock";
        keybind = "l";
      }
      {
        label = "logout";
        action = "killall -9 Hyprland";
        text = "Exit";
        keybind = "e";
      }
      {
        label = "shutdown";
        action = "poweroff";
        text = "Shutdown";
        keybind = "s";
      }
      {
        label = "reboot";
        action = "reboot";
        text = "Reboot";
        keybind = "r";
      }
    ];
    style = ''
            * {
        font-family: "FiraCode Nerd Font", FontAwesome, Roboto, Helvetica, Arial,
          sans-serif;
        background-image: none;
        transition: 20ms;
        box-shadow: none;
      }

      window {
        background-color: rgba(12, 12, 12, 0.8);
      }

      button {
        color: #ffffff;
        font-size: 20px;

        background-repeat: no-repeat;
        background-position: center;
        background-size: 25%;
        border-style: solid;
        border: 3px solid #ffffff;
        box-shadow:
          0 4px 8px 0 rgba(0, 0, 0, 0.2),
          0 6px 20px 0 rgba(0, 0, 0, 0.19);
      }

      button:focus,
      button:active,
      button:hover {
        color: #ffffff;
        border: 3px solid #ffffff;
      }

      /* 
      ----------------------------------------------------- 
      Buttons
      ----------------------------------------------------- 
      */

      #FIXME: fix the icons
      #lock {
        margin: 10px;
        border-radius: 20px;
        background-image: image(url("./icons/lock.png"));
      }

      #logout {
        margin: 10px;
        border-radius: 20px;
        background-image: image(url("./icons/logout.png"));
      }

      #shutdown {
        margin: 10px;
        border-radius: 20px;
        background-image: image(url("./icons/shutdown.png"));
      }

      #reboot {
        margin: 10px;
        border-radius: 20px;
        background-image: image(url("./icons/reboot.png"));
      }
    '';
  };
}
