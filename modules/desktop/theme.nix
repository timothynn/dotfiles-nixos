{ config, pkgs, lib, ... }:

let
  obsidianGreen = {
    base = "#1b1b1b";      # Almost black
    surface = "#252525";   # Slightly lighter
    overlay = "#2e2e2e";   # Panels
    accent = "#1db954";    # Dark green
    accentAlt = "#2ecc71"; # Brighter green
    text = "#e0e0e0";      # Main text
    subtext = "#a0a0a0";   # Muted text
    error = "#ff5f5f";
    warning = "#ffb84d";
    info = "#4db8ff";
    success = "#00cc88";
  };
in {
  options.myTheme = lib.mkOption {
    type = lib.types.attrs;
    default = obsidianGreen;
    description = "Global Obsidian-Green theme palette";
  };

  config = {
    # GTK Theme (using Home Manager’s gtk module)
    gtk = {
      enable = true;
      theme = {
        name = "Obsidian-Green-Dark";
        package = pkgs.adw-gtk3;
      };
      cursorTheme = {
        name = "Bibata-Modern-Classic";
        package = pkgs.bibata-cursors;
        size = 22;
      };
      iconTheme = {
        name = "Papirus-Dark";
        package = pkgs.papirus-icon-theme;
      };
    };

    # QT Style (using Kvantum)
    qt = {
      enable = true;
      platformTheme.name = "kde";
      style.name = "kde";
    };

    # Expose theme vars to environment
    home.sessionVariables = {
      THEME_BASE = obsidianGreen.base;
      THEME_SURFACE = obsidianGreen.surface;
      THEME_OVERLAY = obsidianGreen.overlay;
      THEME_ACCENT = obsidianGreen.accent;
      THEME_ACCENT_ALT = obsidianGreen.accentAlt;
      THEME_TEXT = obsidianGreen.text;
      THEME_SUBTEXT = obsidianGreen.subtext;
      THEME_ERROR = obsidianGreen.error;
      THEME_WARNING = obsidianGreen.warning;
      THEME_INFO = obsidianGreen.info;
      THEME_SUCCESS = obsidianGreen.success;
    };

    # Make Kvantum read our colors
    xdg.configFile."Kvantum/ObsidianGreen/ObsidianGreen.kvconfig".text = ''
      [General]
      theme_name=ObsidianGreen

      [Colors]
      window=${obsidianGreen.base}
      base=${obsidianGreen.surface}
      alternate=${obsidianGreen.overlay}
      text=${obsidianGreen.text}
      button=${obsidianGreen.surface}
      buttonText=${obsidianGreen.text}
      highlight=${obsidianGreen.accent}
      highlightText=${obsidianGreen.base}
      link=${obsidianGreen.accentAlt}
      visitedLink=${obsidianGreen.subtext}
    '';

    # Set as global theme for Qt
    xdg.configFile."Kvantum/kvantum.kvconfig".text = ''
      [General]
      theme=ObsidianGreen
    '';
  };
}

