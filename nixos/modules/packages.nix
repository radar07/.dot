{ pkgs, ... }:

{
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;


  environment.systemPackages = with pkgs; [
    git
    vim
    wget
    unzip
  ];
}
