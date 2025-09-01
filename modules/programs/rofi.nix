{ config, lib, pkgs, ... }:

let
  # Fetch adi1090x/rofi themes
  #rofi-themes = pkgs.fetchFromGitHub {
    #owner = "adi1090x";
    #repo = "rofi";
    #rev = "master"; # or pin a commit hash for stability
    #sha256 = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA="; # replace with real hash
  #};
in
{
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland; # could also use pkgs.rofi-wayland if you want wayland
    #theme = "${rofi-themes}/files/launchers/type-1/style-1.rasi"; 
  };

}

