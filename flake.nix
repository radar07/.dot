{
  description = "My NixOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    ghostty = {
      url = "github:ghostty-org/ghostty";
    };
  };

  outputs = { self, nixpkgs, home-manager, ghostty, ... }@inputs: {
    nixosConfigurations.shiro = nixpkgs.lib.nixosSystem {
      system = "x86-64_linux";
      modules = [
        ./nixos/configuration.nix
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.radar = import ./home-manager/home.nix;
        }
        {
          environment.systemPackages = [
            ghostty.packages.x86_64-linux.default
          ];
        }
      ];
    };
  };
}
