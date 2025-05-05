# I don't want Nix to manage my Helix configuration...
{ pkgs, config, ... }:

{
  home.packages = with pkgs; [
  ];

  home.file.".config/helix".source =
    config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dot/helix";
}
