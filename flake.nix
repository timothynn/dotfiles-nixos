{
  description = "Home Manager configuration of tim";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
        stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
        nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    { nixpkgs, home-manager, stylix, nixvim, ... } @inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem{
        specialArgs = { inherit inputs; };
        modules = [
            ./configuration.nix
            ./hardware-configuration.nix
            home-manager.nixosModules.home-manager
            {
                home.manager = {
                    users.tim = {
                        modules = [
                            ./home.nix
                            stylix.homeModules.stylix
                            nixvim.homeModules.nixvim
                        ];
                    };
                };
            }
        ];
      };

      homeConfigurations."tim" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        # Specify your home configuration modules here, for example,
        # the path to your home.nix.
        modules = [ 
		    ./home.nix 
		    nixvim.homeModules.nixvim
		    stylix.homeModules.stylix
	    ];

        extraSpecialArgs = { inherit inputs; };
      };
    };
}
