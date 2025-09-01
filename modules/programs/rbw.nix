{ lib, config, pkgs, ...}:

{
	programs.rbw = {
		enable = true;
		settings = {
			email = "timothynn08@gmail.com";
			base_url = "https://vault.bitwarden.com";
			identity_url = "https://identity.bitwarden.com";
			pinentry = pkgs.pinentry-rofi;
		};
	};
}
