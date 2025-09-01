{ config, pkgs, lib, ... }:

{
  programs.neovim = {
    enable = true;

    # Enable Node + Python providers for plugins (treesitter, lsp, etc.)
    withNodeJs = true;
    withPython3 = true;

    extraPackages = with pkgs; [
      gcc
      ripgrep
      fd
      unzip
      tree-sitter
    ];

    # Make sure lua config is loaded
    extraConfig = ''
      lua << EOF
      require("init")
      EOF
    '';
  };

  home.file.".config/nvim" = {
    source = ./lua; # symlink whole lua/ dir into ~/.config/nvim/lua
    recursive = true;
  };

  # Optional: color sync from config.myTheme
  home.file.".config/nvim/lua/theme.lua".text = ''
    local M = {}

    M.palette = {
      base     = "${config.myTheme.base}",
      text     = "${config.myTheme.text}",
      accent   = "${config.myTheme.accent}",
      accent2  = "${config.myTheme.accentAlt}",
      error    = "${config.myTheme.error}",
      warning  = "${config.myTheme.warning}",
      info     = "${config.myTheme.info}",
      success  = "${config.myTheme.success}",
      overlay  = "${config.myTheme.overlay}",
      surface  = "${config.myTheme.surface}",
      subtext  = "${config.myTheme.subtext}",
    }

    return M
  '';
}

