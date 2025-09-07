{ config, pkgs, ... }:

{
  programs.hyprlock = {
    enable = true;

    settings = {
      general = {
        blur_size = 12;
        blur_passes = 4;
        noise = 0.02;
        contrast = 1.06;
        brightness = 0.94;
        vibrancy = 0.2;
      };

      input-field = {
        monitor = "eDP-1"; # change if you have external monitors
        size = "340,54";
        position = "0, -140";
        rounding = 10;
        font_family = "JetBrainsMono Nerd Font";
        placeholder_text = "Password...";
        fade_on_empty = true;
      };

      indicator = {
        size = 12;
        border_size = 2;
      };
    };
  };
}

