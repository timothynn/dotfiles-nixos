{ lib, pkgs, config, ... }:

{
  home.packages = with pkgs; [
  ];
	programs.rofi = {
		enable = true;
		package = pkgs.rofi-wayland;
    # theme = "${config.xdg.configHome}/rofi/catppuccin-mocha.rasi";
    plugins = [
      pkgs.rofi-calc
      pkgs.rofi-emoji-wayland
      pkgs.rofi-network-manager
      pkgs.rofi-power-menu
    ];
    modes = [
      "window"
      "drun"
      "emoji"
      "ssh"
      "keys"
      {
        name = "nm";
        path = lib.getExe pkgs.rofi-network-manager;
      }
      {
        name = "pm";
        path = lib.getExe pkgs.rofi-power-menu;
      }
    ];
    extraConfig = {
      modi = "drun,window,ssh,keys:${config.xdg.configHome}/rofi/modes/keys.sh,run,file:${config.xdg.configHome}/rofi/modes/files.sh";
    show-icons = true;
    terminal = "alacritty"; # change to kitty/wezterm if you prefer
    drun-display-format = "{icon} {name}";
    # kb-row-left = "Left";
    # kb-row-right = "Right";
    kb-custom-1 = "Alt+1";
    kb-custom-2 = "Alt+2";
    kb-custom-3 = "Alt+3";
    };
	};
}
