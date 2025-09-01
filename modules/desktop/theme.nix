{ config, pkgs, lib, ... }:

let
  obsidianGreen = {
    base = "#1b1b1b";      # Almost black
    surface = "#252525";   # Slightly lighter
    overlay = "#2e2e2e";   # Panels
    accent = "#1db954";    # Dark green
    accentAlt = "#2ecc71"; # Brighter green
    text = "#e0e0e0";      # Main text
    color = "#e0e0e0";      # Main text
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
        package = null;
      };
      cursorTheme = {
        name = "Bibata-Modern-Classic";
        package = pkgs.bibata-cursors;
        size = 22;
      };
      iconTheme = {
        name = "Papirus-Dark";
      };
      font = {
    	name = "JetbrainsMono Nerd Font";
        package = pkgs.nerd-fonts.jetbrains-mono;
	    size = 11;
      };
    };
# QT Style (using Kvantum)
    qt = {
      enable = true;
      platformTheme.name = "kvantum";
      style.name = "kvantum";

    };
  };
 }

