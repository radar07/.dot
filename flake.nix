{
  description = "My NixOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser = {
      url = "github:youwen5/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    noctalia = {
      url = "github:noctalia-dev/noctalia-shell";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    niri = {
      url = "github:bugeats/niri-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      zen-browser,
      niri,
      home-manager,
      ...
    }@inputs:
    let
      systems = [ "x86_64-linux" ];

      forAllSystems = nixpkgs.lib.genAttrs systems;

      # Helper for NixOS hosts
      mkHost =
        {
          name,
          system ? "x86_64-linux",
          extraModules ? [ ],
        }:
        nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = { inherit inputs; };
          modules = [
            ./hosts/${name}/configuration.nix
            ./modules/nixos
          ]
          ++ extraModules;
        };

      # Helper for Home Manager configs
      mkHome =
        {
          name,
          system ? "x86_64-linux",
          extraModules ? [ ],
        }:
        home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.${system};
          extraSpecialArgs = { inherit inputs; };
          modules = [
            ./modules/home-manager/home.nix
          ]
          ++ extraModules;
        };
    in
    {
      nixosConfigurations = {
        shiro = mkHost {
          name = "shiro";
          extraModules = [
            niri.nixosModules.niri
            (
              { pkgs, ... }:
              {
                environment.systemPackages = [
                  zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
                ];
              }
            )
          ];
        };
      };

      homeConfigurations = {
        shiro = mkHome {
          name = "shiro";
          extraModules = [
            niri.homeModules.niri
          ];
        };
      };

      # Optional: packages and devShells later
      # packages = forAllSystems (system: import ./pkgs nixpkgs.legacyPackages.${system});
    };
}
