{ lib, config, pkgs, ...}:

{
	services.rbw = {
		enable = true;
		settings = {
			email = "timothynn08@gmail.com";
			pinentry = pkgs.pinentry-rofi;
		};
	};
}
