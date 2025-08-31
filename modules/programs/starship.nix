{ config, pkgs, ... }:

{
  programs.starship = {
    enable = true;
    settings = {
      add_newline = false;

      # Root mode detection
      format = "$all$fill$root_indicator\n$character";

      root_indicator = {
      format = " [ROOT] ";
      style = "bold red";
      disabled = false;
      when = "test $EUID -eq 0";
};
      character = {
        success_symbol = "[➜](bold green)";
        error_symbol = "[✗](bold red)";
	# Override prompt when root
      	format = "$symbol";
      	symbols = {
        prompt = "[#](bold red) ";
        success_symbol = "[⚡](bold red)";
      };
      };
    };
      };
}

