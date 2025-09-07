{ config, pkgs, ... }:

{
  services.swaync = {
    enable = true;
    package = pkgs.swaynotificationcenter;

    settings = {
      # Global behavior
      notification-limit = 5;
      ignore-transient = true;
      dnd-mode = false;
      image-size = 48;

      # Positioning
      position = "top-right"; # top-left, bottom-right, etc.
      layer = "overlay";

      # Style
      # css = builtins.readFile ./style.css;

      # Shortcuts
      keybinds = {
        toggle-dnd = "Mod4+d";
        close-all = "Mod4+Shift+c";
        toggle-center = "Mod4+n";
      };

      # Modules inside the control center
      modules-left = [ "notifications" ];
      modules-right = [ "mpris" "dnd" "buttons" "volume" "battery" "clock" ];
    };
  };
}

