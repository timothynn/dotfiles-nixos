{ ... }: {
  wayland.windowManager.hyprland.settings = {
    input = {
      kb_layout = "us";
      follow_mouse = 1;
      sensitivity = 0;

      touchpad.natural_scroll = true;
    };

    gestures.workspace_swipe = true;

    device = {
      name = "epic-mouse-v1";
      sensitivity = -0.5;
    };
  };
}
