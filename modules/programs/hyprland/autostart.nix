{ ... }: {
  wayland.windowManager.hyprland.settings = {
    monitor = [ ",preferred,auto,auto" ];

    exec-once = [
      "kitty"
      "nm-applet &"
      "waybar &"
      "pypr"
    ];

    env = [
      "XCURSOR_SIZE,24"
      "HYPRCURSOR_SIZE,24"
    ];
  };
}
