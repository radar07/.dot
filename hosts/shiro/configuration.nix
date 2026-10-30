{ inputs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ../../modules/nixos
    inputs.sops-nix.nixosModules.sops
  ];

  sops.defaultSopsFile = ../../secrets/radar.yml;
  sops.age.keyFile = "/home/radar/.config/sops/age/keys.txt";

  sops.secrets.github_signing_key = {
    owner = "radar";
    mode = "0600";
  };
}
