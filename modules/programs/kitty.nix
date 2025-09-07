{ config, pkgs, ... }:

{
  programs.kitty = {
    enable = true;

    # fonts & UI tweaks
    # font = {
    #   name = "JetBrainsMono Nerd Font";
    #   size = 10;
    # };

    settings = {
      confirm_os_window_close = 0;
      enable_audio_bell = "no";
      hide_window_decorations = "yes";
      #background_opacity = 0.84;
      #background_blur = 1;
      #dynamic_background_opacity = "yes";
      window_padding_width = 4;
      window_margin_width = 4;
      #
      # # theme (Obsidian-Green)
      # background = config.myTheme.base;
      # foreground = config.myTheme.text;
      # #cursor = "#00ff66";
      # #cursor_text_color = "#1b1b1b";
      #
      # #selection_background = "#00ff66";
      # #selection_foreground = "#1b1b1b";
      #
      #
      #
      # # Standard ANSI colors
      # color0 = config.myTheme.surface;
      # color1 = config.myTheme.error;
      # color2 = config.myTheme.accent;
      # color3 = config.myTheme.warning;
      # color4 = config.myTheme.info;
      # color5 = config.myTheme.accentAlt;
      # color6 = config.myTheme.success;
      # color7 = config.myTheme.subtext;
      #
      # # Brights
      # color8  = config.myTheme.overlay;
      # color9  = config.myTheme.error;
      # color10 = config.myTheme.accentAlt;
      # color11 = config.myTheme.warning;
      # color12 = config.myTheme.info;
      # color13 = config.myTheme.accent;
      # color14 = config.myTheme.success;
      # color15 = config.myTheme.text;    
    };
  };
}

