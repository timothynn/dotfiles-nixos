{ config, lib, pkgs, ... }:

{
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland; # could also use pkgs.rofi-wayland if you want wayland
    # theme = "${rofi-themes}/files/launchers/type-1/style-1.rasi"; 
  };

}

