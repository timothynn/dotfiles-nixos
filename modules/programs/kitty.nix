{ config, pkgs, ... }:

{
  programs.kitty = {
    enable = true;


    settings = {
      confirm_os_window_close = 0;
      enable_audio_bell = "no";
      window_padding_width = 2;
      window_margin_width = 2;
    };
  };
}

