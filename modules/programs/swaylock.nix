{ lib, pkgs, ... }:
{
  programs.swaylock = {
    enable = true;
    package = pkgs.swaylock-effects;
    # settings = {
    #   # Background
    #   image = ""; # no wallpaper, just tint + blur
    #   color = lib.mkDefault "1e1e2e"; # Catppuccin Mocha base
    #   inside-color = lib.mkDefault "1e1e2eAA"; # translucent lock ring
    #   inside-clear-color = lib.mkDefault "a6e3a1AA"; # Catppuccin green
    #   inside-ver-color = lib.mkDefault "89b4faAA"; # blue (verifying)
    #   inside-wrong-color = lib.mkDefault "f38ba8AA"; # red (wrong password)
    #
    #   key-hl-color = lib.mkDefault "a6e3a1"; # green highlight
    #   ring-color = lib.mkDefault "313244";   # subtle border
    #   ring-clear-color = lib.mkDefault "a6e3a1";
    #   ring-ver-color = lib.mkDefault "89b4fa";
    #   ring-wrong-color = lib.mkDefault "f38ba8";
    #
    #   text-color = lib.mkDefault "cdd6f4";
    #   text-clear-color = lib.mkDefault "1e1e2e";
    #   text-ver-color = lib.mkDefault "1e1e2e";
    #   text-wrong-color = lib.mkDefault "1e1e2e";
    #
    #   font = lib.mkDefault "JetBrainsMono Nerd Font";
    #
    #   # Effects
    #   effect-blur = lib.mkDefault "7x5"; # blur size
    #   effect-vignette = lib.mkDefault "0.3:0.7"; # subtle vignette
    #   indicator-radius = lib.mkDefault 120;
    #   indicator-thickness = lib.mkDefault 15;
    # };
  };
}

