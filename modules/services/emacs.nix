{ pkgs, lib, config, ... }:

{
  home.packages = with pkgs; [
    nixfmt
    shellcheck
  ];
	services.emacs.enable = true;
}
