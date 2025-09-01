{ pkgs, lib, config, ... }:

{
  home.packages = with pkgs; [
    nixfmt-classic
    shellcheck
  ];
	services.emacs.enable = true;
}
