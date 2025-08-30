{ config, pkgs, ... }:

{
  programs.kitty = {
    enable = true;

    # fonts & UI tweaks
    font = {
      name = "JetBrainsMono Nerd Font";
      size = 10;
    };

    settings = {
      confirm_os_window_close = 0;
      enable_audio_bell = "no";
      hide_window_decorations = "yes";

      # theme (Obsidian-Green)
      background = "#1b1b1b";
      foreground = "#d1d5d4";

      cursor = "#00ff66";
      cursor_text_color = "#1b1b1b";

      selection_background = "#00ff66";
      selection_foreground = "#1b1b1b";

      color0  = "#1b1b1b"; # black
      color8  = "#2b2b2b"; # bright black

      color1  = "#a54242"; # red
      color9  = "#cc6666";

      color2  = "#00ff66"; # green
      color10 = "#66ff99";

      color3  = "#b5bd68"; # yellow
      color11 = "#f0c674";

      color4  = "#81a2be"; # blue
      color12 = "#99ccff";

      color5  = "#b294bb"; # magenta
      color13 = "#cc99ff";

      color6  = "#8abeb7"; # cyan
      color14 = "#99ffcc";

      color7  = "#c5c8c6"; # white
      color15 = "#ffffff"; # bright white
    };
  };
}

