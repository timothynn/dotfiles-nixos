{ lib, config, pkgs, ...}:

{
	imports = [
		./programs/programs.nix
		./services/services.nix
	];
}
