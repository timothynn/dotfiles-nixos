{ lib, config, pkgs, ... }:

{
  programs.starship = {
    enable = true;
    settings = {
  	add_newline = false;
  	format = lib.concatStrings [
    		"$line_break"
    		"$package"
    		"$line_break"
    		"$character"
		"$username"
  	];
  	scan_timeout = 10;
  	character = {
    		success_symbol = "➜";
    		error_symbol = "➜";
  	};
	username = {
		style_user = "white_bold";
		format = "user: [$user]($style) ";
		disabled = false;
		show_always = true;
	};
   };
  };
}

