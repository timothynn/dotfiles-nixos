{ config, pkgs, ... }:

{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 26;
        spacing = 6;

        modules-left  = [ "hyprland/workspaces" ];
        modules-center = [ "clock" ];
        modules-right = [
          "cpu" "custom/gpu" "pulseaudio" "custom/mic"
          "backlight" "battery" "network" "tray" "custom/power"
        ];

        # --- Workspaces ---
        "hyprland/workspaces" = {
          format = "{name}";
        };

        # --- Clock ---
        clock = {
          format = "{:%H:%M}";
          tooltip-format = "<tt>{calendar}</tt>";
          calendar = {
            mode = "month";
            on-scroll = 1;
          };
        };

        # --- CPU ---
        cpu = {
          format = " {usage}%";
          tooltip = true;
          tooltip-format = "{load} load\n{freq} GHz\n{temperature}°C";
        };

        # --- GPU (custom) ---
        "custom/gpu" = {
          exec = "nvidia-smi --query-gpu=utilization.gpu,temperature.gpu --format=csv,noheader,nounits | awk -F, '{print \"GPU: \"$1\"% @$2°C\"}'";
          interval = 5;
          return-type = "stdout";
          tooltip = true;
        };

        # --- Audio: Speakers ---
        pulseaudio = {
          format = "{icon} {volume}%";
          format-icons = { default = ["" "" ""]; };
          on-click = "pavucontrol";
        };

        # --- Audio: Mic (custom) ---
        "custom/mic" = {
          exec = "pamixer --default-source --get-mute | grep -q true && echo '' || echo ''";
          on-click = "pavucontrol";
          interval = 3;
          tooltip = false;
        };

        # --- Brightness ---
        backlight = {
          format = " {percent}%";
          on-scroll-up = "brightnessctl set +10%";
          on-scroll-down = "brightnessctl set 10%-";
          tooltip = true;
          tooltip-format = "Click to set preset";
          on-click = "notify-send 'Brightness presets' 'low=30%, mid=60%, high=100%'";
          # optionally, bind a script that toggles between levels
        };

        # --- Battery ---
        # battery = {
        #   format = "{capacity}% {icon}";
        #   format-icons = ["" "" "" "" ""];
        #   tooltip-format = "Capacity: {capacity}%\nStatus: {status}";
        #   on-click = "notify-send 'Battery profile' 'Switching performance modes: eco, balanced, performance'";
        # };
battery = {
          format = "{icon} {capacity}%";
          format-icons = [
    "" # 0-20%
    "" # 20-40%
    "" # 40-60%
    "" # 60-80%
    "" # 80-100%
  ];
          format-charging = " {capacity}%";   # bolt icon

  # Show plugged in but not charging (like full battery)
  format-plugged = " {capacity}%";   # plug icon

          on-click = "notify-send 'Battery profile' 'Switching performance modes: eco, balanced, performance'";
          tooltip = false;
          };
        # --- Network ---
        network = {
          format-wifi = " {essid} ({signalStrength}%)";
          format-ethernet = " {ifname}";
          format-disconnected = " Disconnected";
          tooltip-format = "Speed: {bandwidthDownBits} ↓ {bandwidthUpBits} ↑";
          on-click = "nm-connection-editor";
        };

        # --- Tray ---
        tray = {
          spacing = 8;
        };

        # --- Power Menu (custom) ---
        "custom/power" = {
          format = "";
          on-click = "wlogout -p layer-shell";
          tooltip = false;
        };
      };
    };

    style = ''
      #clock, #cpu, #custom-gpu, #pulseaudio, #custom-mic,
      #backlight, #battery, #network, #tray, #custom-power {
        padding: 0 6px;
      }
    '';
  };

  stylix.targets.waybar.enable = true;
}
