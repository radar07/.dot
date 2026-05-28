{
  description = "My NixOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    ghostty.url = "github:ghostty-org/ghostty";

    zen-browser = {
      url = "github:youwen5/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    noctalia = {
      url = "github:noctalia-dev/noctalia-shell";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      ghostty,
      zen-browser,
      home-manager,
      ...
    }@inputs:
    let
      inherit (self) outputs;

      # Supported systems
      systems = [
        "x86_64-linux"
      ];

      forAllSystems = nixpkgs.lib.genAttrs systems;
    in
    {
      # packages = forAllSystems (system: import ./pkgs nixpkgs.legacyPackages.${system});

      nixosConfigurations.shiro = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs outputs; };
        system = "x86-64_linux";
        modules = [
          ./nixos/configuration.nix
          (
            { pkgs, ... }:
            {
              environment.systemPackages = [
                zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
                ghostty.packages.${pkgs.stdenv.hostPlatform.system}.default
              ];
            }
          )
        ];
      };

      homeConfigurations."shiro" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
        extraSpecialArgs = { inherit inputs outputs; };
        modules = [
          ./home-manager/home.nix
        ];
      };
    };
}
