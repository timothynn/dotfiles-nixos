{ lib, config, pkgs, ... }:

{
  imports = [
    ./hyprland/hyprland.nix
    ./firefox.nix
    ./eza.nix
    ./fzf.nix
    ./git.nix
    ./hyprlock.nix
    ./kitty.nix
    ./mailspring.nix
    ./nixvim/nixvim.nix
    ./onlyoffice.nix
    ./rbw.nix
    ./rofi.nix
    ./starship.nix
    ./thunar.nix
    ./waybar/waybar.nix
    ./zellij.nix
    ./zoxide.nix
    ./yazi.nix
    ./zsh.nix
    ./skim.nix
    ./cava.nix
		./feh.nix
  ];
}
