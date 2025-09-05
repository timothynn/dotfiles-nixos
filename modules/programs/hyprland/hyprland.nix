{ config, pkgs, ... }:

{

  imports = [
    ./keybindings.nix
    ./look-and-feel.nix
    ./input.nix
    ./rules.nix
    ./autostart.nix
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
  };
}
