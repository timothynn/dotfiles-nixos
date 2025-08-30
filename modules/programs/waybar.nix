{ config, pkgs, ... }:

{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        height = 28;
        modules-left = [ "clock" "cpu" "memory" ];
        modules-center = [ "window" ];
        modules-right = [ "tray" "pulseaudio" "network" "battery" ];
      };
    };

    style = ''
      * {
        font-family: "JetBrainsMono Nerd Font";
        font-size: 12px;
        color: ${config.myTheme.text};
      }
      window {
        background-color: ${config.myTheme.base};
      }
      #clock, #cpu, #memory, #window, #tray, #pulseaudio, #network, #battery {
        background: ${config.myTheme.surface};
        border-radius: 6px;
        padding: 4px 8px;
        margin: 2px;
      }
      #clock {
        color: ${config.myTheme.accent};
      }
      #cpu {
        color: ${config.myTheme.info};
      }
      #memory {
        color: ${config.myTheme.accentAlt};
      }
      #pulseaudio {
        color: ${config.myTheme.success};
      }
      #network {
        color: ${config.myTheme.warning};
      }
      #battery {
        color: ${config.myTheme.error};
      }
    '';
  };
}

