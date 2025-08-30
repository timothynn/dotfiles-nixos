{ pkgs, ... }:

{
  programs.waybar = {
    enable = true;

    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 30;
        margin-top = 6;
        margin-left = 6;
        margin-right = 6;

        modules-left = [ "hyprland/workspaces" ];
        modules-center = [ "clock" "custom/notification" ];
        modules-right = [
          "cpu"
          "memory"
          "pulseaudio"
          "backlight"
          "network"
          "battery"
          "tray"
          "custom/power"
        ];

        # Your modules (unchanged from your config)
        "hyprland/workspaces" = {
          on-click = "activate";
          format = "{icon}";
          format-icons = {
            default = "<U+F192>";
            active = "<U+F111>";
          };
        };

        clock = {
          format = "<U+F133> {:%a, %d %b  <U+F017> %H:%M}";
          tooltip-format = "<tt>{:%A, %d %B %Y}</tt>";
        };

        cpu = {
          format = "<U+F4BC>  {usage}%";
          tooltip = false;
        };

        memory = {
          format = "<U+F035B>  {used:0.1f}G";
        };

        network = {
          format-wifi = "{icon}  {essid}";
          format-ethernet = "<U+F6FF>  {ifname}";
          format-disconnected = "<U+F65A>  Offline";
          tooltip = false;
          format-icons = [ "<U+F092F>" "<U+F091F>" "<U+F0922>" "<U+F0928>" ];
          format-wifi-thresholds = {
            "0" = "#ff5555";
            "50" = "#ffcc00";
            "75" = "#00a86b";
          };
        };

        backlight = {
          format = "<U+F00E0> {percent}%";
          format-icons = [ "<U+F00DE>" "<U+F00DF>" "<U+F00E0>" ];
          on-scroll-up = "brightnessctl set +2%";
          on-scroll-down = "brightnessctl set 2%-";
          on-click = "brightnessctl set 30%";
          tooltip = false;
        };

        "custom/power" = {
          format = "<U+F011>";
          tooltip = false;
          on-click = "rofi -show pm";
        };

        pulseaudio = {
          format = "{icon} {volume}%";
          format-muted = "<U+F075F> muted";
          format-icons = {
            headphone = "<U+F02CB>";
            headset = "<U+F02CE>";
            default = [ "<U+F057F>" "<U+F0580>" "<U+F057E>" ];
          };
          on-click = "pavucontrol";
        };

        battery = {
          format = "{icon} {capacity}%";
          format-icons = [ "<U+F244>" "<U+F243>" "<U+F242>" "<U+F241>" "<U+F240>" ];
          format-charging = "<U+F0E7> {capacity}%";
          format-plugged = "<U+F1E6> {capacity}%";
          tooltip = false;
        };

        "custom/notification" = {
          tooltip = false;
          format = "{icon}";
          format-icons = {
            notification = "<U+F0A2><span foreground='red'><sup><U+F444></sup></span>";
            none = "<U+F0A2>";
            dnd-notification = "<U+F1F7><span foreground='red'><sup><U+F444></sup></span>";
            dnd-none = "<U+F1F7>";
            inhibited-notification = "<U+F0A2><span foreground='red'><sup><U+F444></sup></span>";
            inhibited-none = "<U+F0A2>";
            dnd-inhibited-notification = "<U+F1F7><span foreground='red'><sup><U+F444></sup></span>";
            dnd-inhibited-none = "<U+F1F7>";
          };
          return-type = "json";
          exec-if = "which swaync-client";
          exec = "swaync-client -swb";
          on-click = "swaync-client -t -sw";
          on-click-right = "swaync-client -d -sw";
          escape = true;
        };
      };
    };

    style = ''
      * {
        border: none;
        border-radius: 0;
        font-family: "JetBrainsMono Nerd Font", monospace;
        font-size: 13px;
        min-height: 0;
      }
      window#waybar {
        background: #1b1b1b;
        color: #e0e0e0;
      }
      #workspaces button {
        padding: 0 5px;
        color: #e0e0e0;
      }
      #workspaces button.focused {
        background: #00a86b;
        color: #1b1b1b;
      }
      #battery.warning {
        color: #ffcc00;
      }
      #battery.critical {
        color: #ff5555;
      }
      #pulseaudio.muted {
        color: #a0a0a0;
      }
      #clock, #cpu, #memory, #network, #backlight, #battery, #pulseaudio, #custom-power {
        padding: 0 10px;
      }
    '';
  };
}

