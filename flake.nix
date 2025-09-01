{
  description = "NixOS + Home Manager setup for Tim";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    home-manager.url = "github:nix-community/home-manager/release-25.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nixvim = {
        url = "github:nix-community/nixvim";
        # If using a stable channel you can use `url = "github:nix-community/nixvim/nixos-<version>"`
        inputs.nixpkgs.follows = "nixpkgs";
    };
    catppuccin.url = "github:catppuccin/nix";
  };

  outputs = { self, nixpkgs, home-manager, nixvim, catppuccin, ... }:
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
	        nixvim.nixosModules.nixvim
          catppuccin.nixosModules.catppuccin
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.tim = import ./home/tim.nix;
	    home-manager.users.root = import ./home/root.nix;
          }
        ];
      };

      # --- Home Manager standalone config ---
      homeConfigurations.tim = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
          ./home/tim.nix
	  nixvim.homeModules.nixvim
          catppuccin.homeModules.catppuccin
        ];
      };
    };
}

