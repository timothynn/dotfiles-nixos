{ lib, config, pkgs, ...}:

{
	imports = [
		./programs/programs.nix
		./services/services.nix
		./desktop/desktop.nix
    ./dev/dev.nix
	];
}
