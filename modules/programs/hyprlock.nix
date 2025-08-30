{ config, pkgs, ... }:

let
  theme = config.myTheme;
in
{
  programs.hyprlock = {
    enable = true;

    settings = {
      general = {
        # Background color + blur
        background_color = theme.base;
        blur_size = 8;
        blur_passes = 3;
        noise = 0.02;
        contrast = 1.05;
        brightness = 0.95;
        vibrancy = 0.15;
      };

      input-field = {
        monitor = "eDP-1"; # change if you have external monitors
        size = "300,50";
        position = "0, -150";
        rounding = 12;
        outer_color = theme.accent;
        inner_color = theme.base;
        font_color = theme.text;
        placeholder_text = "Password...";
        fade_on_empty = true;
      };

      label = [
        {
          text = "$TIME";
          font_size = 60;
          color = theme.accent;
          position = "0, -300";
          halign = "center";
        }
        {
          text = "$DATE";
          font_size = 20;
          color = theme.text;
          position = "0, -250";
          halign = "center";
        }
      ];

      indicator = {
        size = 20;
        color = theme.accent;
        border_size = 3;
      };
    };
  };
}

