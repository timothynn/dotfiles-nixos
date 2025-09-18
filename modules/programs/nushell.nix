{ lib, pkgs, config, ... }:
{
	programs.nushell = {
		enable = true;
        settings = {
            show_banner = false;
        };
	};
}
