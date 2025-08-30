{ lib, pkgs, config, ... }:
{
  gtk = {
  enable = true;
  theme = {
    name = "Obsidian-Green";
    package = pkgs.gnome-themes-extra; # lightweight fallback
  };
};

xdg.configFile."gtk-3.0/gtk.css".text = ''
@define-color theme_bg_color #1b1b1b;
@define-color theme_fg_color #e0e0e0;
@define-color theme_selected_bg_color #00a86b;
@define-color theme_selected_fg_color #1b1b1b;
@define-color theme_button_bg_color #242424;
@define-color theme_button_fg_color #e0e0e0;
'';

xdg.configFile."gtk-4.0/gtk.css".text = ''
@define-color theme_bg_color #1b1b1b;
@define-color theme_fg_color #e0e0e0;
@define-color theme_selected_bg_color #00a86b;
@define-color theme_selected_fg_color #1b1b1b;
@define-color theme_button_bg_color #242424;
@define-color theme_button_fg_color #e0e0e0;
'';

}
