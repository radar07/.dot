{ inputs, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./modules
  ];

  environment.systemPackages = [
    inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
    inputs.ghostty.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];
}
