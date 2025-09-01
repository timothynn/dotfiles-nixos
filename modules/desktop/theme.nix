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
        package = pkgs.papirus-icon-theme;
      };
      font = {
	name = "JetbrainsMono Nerd Font";
	size = 11;
      };
    };
# QT Style (using Kvantum)
    qt = {
      enable = true;
      platformTheme.name = "kde";
      style.name = "kvantum";

    };
  # Same for GTK4 (libadwaita)
  xdg.configFile."gtk-4.0/gtk.css".text = ''
    /* GTK4 respects same CSS vars */
    @define-color base_color   ${obsidianGreen.base};
    @define-color accent_color ${obsidianGreen.accent};
    @define-color text_color   ${obsidianGreen.text};

    window, dialog {
      background-color: @base_color;
      color: @text_color;
    }
    button {
      background-color: @accent_color;
      color: @base_color;
    }
  '';

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

    

  # 🖼️ GTK Theme
  xdg.configFile."gtk-3.0/settings.ini".text = ''
    [Settings]
    gtk-theme-name=ObsidianGreen
    gtk-icon-theme-name=Papirus-Dark
    gtk-font-name=JetbrainsMono Nerd Font 11
    gtk-cursor-theme-name=Bibata-Modern-Ice
  '';

  xdg.configFile."gtk-3.0/gtk.css".text = ''
    * {
      background-color: ${obsidianGreen.base};
      color: ${obsidianGreen.text};
      font: JetbrainsMono Nerd Font 11
    }
    button {
      background: ${obsidianGreen.accent};
      color: ${obsidianGreen.base};
    }
  '';

  # 🎨 Kvantum Theme
  xdg.configFile."Kvantum/ObsidianGreen/ObsidianGreen.kvconfig".text = ''
    [General]
    theme_name=ObsidianGreen
    active_color=${obsidianGreen.accent}
    inactive_color=${obsidianGreen.surface}
    background_color=${obsidianGreen.base}
    text_color=${obsidianGreen.text}
  '';
  xdg.configFile."Kvantum/kvantum.kvconfig".text = ''
  [General]
  theme=ObsidianGreen
'';


  # ⛅ KDE Plasma Color Scheme (Dolphin, Konsole, Kate, etc.)
  xdg.dataFile."color-schemes/ObsidianGreen.colors".text = ''
    [General]
    ColorScheme=ObsidianGreen

    [Colors:Window]
    BackgroundNormal=${obsidianGreen.base}
    ForegroundNormal=${obsidianGreen.text}

    [Colors:Button]
    BackgroundNormal=${obsidianGreen.surface}
    ForegroundNormal=${obsidianGreen.text}

    [Colors:Selection]
    BackgroundNormal=${obsidianGreen.accent}
    ForegroundNormal=${obsidianGreen.base}

    [Colors:Tooltip]
    BackgroundNormal=${obsidianGreen.overlay}
    ForegroundNormal=${obsidianGreen.text}
  '';

  xdg.configFile."kdeglobals".text = ''
    [General]
    ColorScheme=ObsidianGreen
    widgetStyle=kvantum
  '';
	};
}

