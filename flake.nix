{
  description = "My NixOS / nix-darwin configuration";

  inputs = {
    # NixOS (Linux) — uses nixos-unstable
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    # macOS — uses nixpkgs-unstable (required by nix-darwin master)
    nixpkgs-darwin.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    nix-darwin = {
      url = "github:nix-darwin/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs-darwin";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    ghostty.url = "github:ghostty-org/ghostty";

    zen-browser = {
      url = "github:youwen5/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    noctalia = {
      url = "github:noctalia-dev/noctalia-shell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      nixpkgs-darwin,
      nix-darwin,
      home-manager,
      ...
    }@inputs:
    let
      inherit (self) outputs;
    in
    {
      # NixOS system — shiro
      nixosConfigurations.shiro = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs outputs; };
        modules = [ ./hosts/shiro/configuration.nix ];
      };

      # Standalone home-manager — shiro
      # Activate with: home-manager switch --flake .#shiro
      homeConfigurations."shiro" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
        extraSpecialArgs = { inherit inputs outputs; };
        modules = [ ./home-manager/home-shiro.nix ];
      };

      # macOS system + embedded home-manager — kuro
      # First time: nix run nix-darwin -- switch --flake .#kuro
      # Subsequently: darwin-rebuild switch --flake .#kuro
      darwinConfigurations.kuro = nix-darwin.lib.darwinSystem {
        modules = [
          ./hosts/kuro/configuration.nix
          home-manager.darwinModules.home-manager
          {
            # Use nixpkgs-darwin (nixpkgs-unstable) for macOS packages
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = { inherit inputs outputs; };
            home-manager.users.radar = import ./home-manager/home-kuro.nix;
          }
        ];
        specialArgs = { inherit inputs outputs; };
      };
    };
}
