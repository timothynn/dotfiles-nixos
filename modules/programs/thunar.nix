{ config, pkgs, ... }:
{
      home.packages = with pkgs.xfce; [
      thunae
      thunar-archive-plugin
      thunar-volman
      tumbler
    ];

  # GTK theming hook
  xdg.configFile."gtk-3.0/settings.ini".text = ''
    [Settings]
    gtk-theme-name = "Obsidian-Green"
    gtk-icon-theme-name = "Papirus-Dark"
    gtk-font-name = Cantarell 11
  '';
}

