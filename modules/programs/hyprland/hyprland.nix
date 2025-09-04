{ config, pkgs, ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    finalPortalPackage = pkgs.xdg-desktop-portal-hyprland;
    

    imports = [
      ./keybindings.nix
      ./look-and-feel.nix
      ./input.nix
      ./rules.nix
      ./autostart.nix
    ];
  };
}
