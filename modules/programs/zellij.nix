{ config, pkgs, ... }:

{
  programs.zellij = {
    enable = true;
    settings = {
      theme = {
        fg = config.myTheme.text;
        bg = config.myTheme.base;
        black = config.myTheme.surface;
        red = config.myTheme.error;
        green = config.myTheme.accent;
        yellow = config.myTheme.warning;
        blue = config.myTheme.info;
        magenta = config.myTheme.accentAlt;
        cyan = config.myTheme.success;
        white = config.myTheme.subtext;
      };
    };
  };
}

