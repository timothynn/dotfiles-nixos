{ lib, config, pkgs, ...}:

{
	programs.rbw = {
		enable = true;
		settings = {
			email = "timothynn08@gmail.com";
			base_url = "https://vault.bitwarden.com";
			identity_url = "https://identity.bitwarden.com";
			pinentry = pkgs.pinentry-rofi;
			client_id = "user.4a6a4121-558a-4daa-9dfe-af6f01440e3d";
      			client_secret = "KkJsTMFNDLgyciFf2ajwPOmr9wmpCq";
		};
	};
}
