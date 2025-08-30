{ pkgs, ... }:

{
	home.packages = with pkgs; [
    networkmanager
		networkmanagerapplet
    networkmanager_dmenu
	];
	services.network-manager-applet = {
		enable = true;
	};
}
