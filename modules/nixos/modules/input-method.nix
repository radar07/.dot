{ pkgs, ... }:

{
  # Configure input method for Japanese support
  i18n.inputMethod = {
    enable = true;
    type = "fcitx5";
    fcitx5 = {
      # Use Wayland input method support
      waylandFrontend = true;

      # Add Japanese input engines
      addons = with pkgs; [
        fcitx5-mozc # Google Japanese Input (Mozc)
        fcitx5-gtk # GTK integration
        qt6Packages.fcitx5-configtool # GUI configuration tool
      ];
    };
  };

  # Set environment variables for input method
  environment.variables = {
    GTK_IM_MODULE = "fcitx";
    QT_IM_MODULE = "fcitx";
    XMODIFIERS = "@im=fcitx";
    # Wayland-specific
    GLFW_IM_MODULE = "ibus"; # Some apps need this for compatibility
  };
}
