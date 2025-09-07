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
    sops-nix.url = "github:Mic92/sops-nix";
    stylix = {
      url = "github:nix-community/stylix/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    base16.url = "github:SenchoPens/base16.nix";
tt-schemes = {
    url = "github:tinted-theming/schemes";
    flake = false;
  };
  };

  outputs = { self, nixpkgs, home-manager, nixvim, catppuccin, sops-nix, stylix,   ... } :
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
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
		sops-nix.nixosModules.sops
                  stylix.nixosModules.stylix
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            # home-manager.users.tim = import ./home/tim.nix;
            # home-manager.users.root = import ./home/root.nix;
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
                    stylix.homeModules.stylix
        ];
      };
       homeConfigurations.root = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
          ./home/root.nix
	        nixvim.homeModules.nixvim
          catppuccin.homeModules.catppuccin
        ];
      };

    };
}

