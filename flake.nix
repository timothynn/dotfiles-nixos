{
  description = "NixOS + Home Manager setup for Tim";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    home-manager.url = "github:nix-community/home-manager/release-25.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager, ... }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; config.allowUnfree = true; };
    in
    {
      # --- NixOS system config ---
      nixosConfigurations.tim = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          ./hosts/tim.nix
          ./hosts/hardware-configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.tim = import ./home/tim.nix;
          }
        ];
      };

      # --- Home Manager standalone config ---
      homeConfigurations.tim = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
          ./home/tim.nix
        ];
      };
    };
}

