{ pkgs, ... }:

{
  programs.niri = {
    enable = true;

    # Optional: use the unstable build from the flake
    package = pkgs.niri;
  };
}
