{ pkgs, ... }:

{
  programs.niri.enable = true;

  # Optional: use the unstable build from the flake
  # programs.nir.package = pkgs.niri-unstable;
}
