{ pkgs, ... }:

{
  home.packages = [ pkgs.hyprlock ];

  xdg.configFile."hypr/hyprlock.conf".text = ''
    # ===========================
    # Minimalist Hyprlock Config
    # ===========================

    general {
      disable_loading_bar = true
      grace = 0
      no_fade_in = false
    }

    background {
      monitor = eDP-1
      path = ""
      color = rgba(30, 30, 46, 0.6)   # Catppuccin Mocha base
      blur_passes = 4
      blur_size = 12
      brightness = 0.8
    }

    input-field {
      monitor = eDP-1
      size = 300, 40
      outline_thickness = 2
      dots_size = 0.2
      dots_spacing = 0.3
      dots_center = true
      outer_color = rgba(166, 227, 161, 1.0)  # Catppuccin Green
      inner_color = rgba(49, 50, 68, 1.0)
      font_color = rgba(205, 214, 244, 1.0)   # Catppuccin Text
      fade_on_empty = false
      placeholder_text = "  Enter password"
      hide_input = false
    }

    label {
      monitor = eDP-1
      text = cmd[update:1000] date "+%H:%M"
      font_size = 64
      color = rgba(205, 214, 244, 1.0)
      position = 0, -100
      halign = center
      valign = center
    }

    label {
      monitor = eDP-1
      text = "Timothy"
      font_size = 18
      color = rgba(180, 190, 254, 1.0)   # Lavender accent
      position = 0, -160
      halign = center
      valign = center
    }
  '';
}

