{ lib, config, ...}:

 let
  # Catppuccin colors (Mocha)
  catppuccinMocha = {
    base = "#1e1e2e";
    mantle = "#181825";
    surface0 = "#313244";
    text = "#cdd6f4";
    green = "#a6e3a1";
    red = "#f38ba8";
    yellow = "#f9e2af";
    blue = "#89b4fa";
    pink = "#f5c2e7";
    overlay = "#6c7086";
  };
in {
  programs.waybar = {
    enable = true;

style = builtins.readFile ./style.css;
    
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 30;
        margin-top = 6;
        margin-left = 6;
        margin-right = 6;

        modules-left = [ "hyprland/workspaces" ];
        modules-center = [ "clock" "custom/notification"];
        modules-right = [ "cpu" "memory" "pulseaudio" "backlight" "network" "battery" "tray" "custom/power" ];

        "hyprland/workspaces" = {
          on-click = "activate";
          format = "{icon}";
          format-icons = {
            default = "";
            active = "";
          };
        };

        clock = {
          format = " {:%a, %d %b   %H:%M}";
          tooltip-format = "<tt>{:%A, %d %B %Y}</tt>";
        };

        cpu = {
          format = "  {usage}%";
          tooltip = false;
        };

        memory = {
          format = "󰍛  {used:0.1f}G";
        };

  network = {
  format-wifi = "{icon}  {essid}";
  format-ethernet = "  {ifname}";
  format-disconnected = "  Offline";
  tooltip = false;

  # Wi-Fi signal icons (low → high)
  format-icons = [
    "󰤯" # 0-25%   (very weak)
    "󰤟" # 25-50%  (weak)
    "󰤢" # 50-75%  (good)
    "󰤨" # 75-100% (strong)
  ];

  # Proper thresholds format (attrset, not list)
  format-wifi-thresholds = {
    "0" = "#f38ba8";   # red under 25%
    "50" = "#f9e2af";  # yellow at 50%
    "75" = "#a6e3a1";  # green above 75%
  };
};

        backlight = {
    format = "󰃠 {percent}%";
    format-icons = [ "󰃞" "󰃟" "󰃠" ];
    on-scroll-up = "brightnessctl set +2%";
    on-scroll-down = "brightnessctl set 2%-";
    on-click = "brightnessctl set 30%";
    tooltip = false;
  };

"custom/power" = {
      format = "";
      tooltip = false;
      on-click = "rofi -show pm";
    };

pulseaudio = {
        format = "{icon} {volume}%";
        format-muted = "󰝟 muted";
        format-icons = {
          headphone = "󰋋";
          headset = "󰋎";
          default = [ "󰕿" "󰖀" "󰕾" ];
        };
        on-click = "pavucontrol";
      };


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

          tooltip = false;
        };

          "custom/notification" = {
    tooltip= false;
    format= "{icon}";
    format-icons= {
      notification= "<span foreground='red'><sup></sup></span>";
      none= "";
      dnd-notification= "<span foreground='red'><sup></sup></span>";
      dnd-none= "";
      inhibited-notification= "<span foreground='red'><sup></sup></span>";
      inhibited-none= "";
      dnd-inhibited-notification= "<span foreground='red'><sup></sup></span>";
      dnd-inhibited-none= "";
    };
    return-type= "json";
    exec-if= "which swaync-client";
    exec= "swaync-client -swb";
    on-click= "swaync-client -t -sw";
    on-click-right= "swaync-client -d -sw";
    escape= true;
  };

      };
    };

  };
}
