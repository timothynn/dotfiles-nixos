{ config, pkgs, ... }:

{
  programs.zellij = {
    enable = true;
    enableZshIntegration = true;

    extraConfig = ''
      theme = "obsidian-green"
      default_shell = "${pkgs.zsh}/bin/zsh"

      [themes.obsidian-green]
      fg = "#d4d4d4"
      bg = "#1b1b1b"
      black = "#1b1b1b"
      red = "#ff6b6b"
      green = "#4caf50"
      yellow = "#cddc39"
      blue = "#2196f3"
      magenta = "#9c27b0"
      cyan = "#00bcd4"
      white = "#d4d4d4"
      orange = "#ff9800"

      [ui]
      pane_frames = true
      pane_frame_color = "green"

      [options]
      simplified_ui = true
      session_serialization = true
      default_mode = "normal"

      [plugins]
      # Built-in plugins
      tab-bar = true
      status-bar = true
      strider = true # floating file picker / runner
      compact-bar = false

      [[layouts]]
      name = "dev"
      tabs = [
        { name = "editor", panes = [{ command = "nvim" }] },
        { name = "shell", panes = [{ command = "zsh" }] },
        { name = "git", panes = [{ command = "lazygit" }] },
        { name = "monitor", panes = [{ command = "btop" }] }
      ]

      [keybinds.normal]
      # Leader = Ctrl-g
      "Ctrl g" = "SwitchToMode \"locked\""
      "Ctrl s" = "SwitchToMode \"session\""
      "Ctrl p" = "SwitchToMode \"pane\""
      "Ctrl t" = "SwitchToMode \"tab\""
      "Ctrl r" = "SwitchToMode \"resize\""
      "Ctrl l" = "SwitchToMode \"move\""

      [status-bar]
      mode = "default"
      style.fg = "#4caf50"
      style.bg = "#1b1b1b"
      show_time = true
      time_format = "%H:%M"
    '';
  };
}

