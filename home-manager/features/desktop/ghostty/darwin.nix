{ ... }:

{
  # Append macOS-specific ghostty settings
  # Note: ghostty on macOS is installed via Homebrew cask (see hosts/kuro/configuration.nix)
  # This file manages only the config written to ~/.config/ghostty/config
  xdg.configFile."ghostty/config".text = ''

    # macOS
    window-decoration = true
    macos-option-as-alt = left
  '';
}
