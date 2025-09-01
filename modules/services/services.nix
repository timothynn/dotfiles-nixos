{ lib, config, pkgs, ... }:

{
	imports = [
		./hyprsunset.nix
		./networkmanagerapplet.nix
		./notification.nix
		./swaync.nix
		./gnome-keyring.nix
		./emacs.nix
	];
}
