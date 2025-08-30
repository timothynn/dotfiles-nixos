{ config, pkgs, ... }:

{
  programs.starship = {
    enable = true;
    settings = {
      add_newline = false;
      format = "$directory$git_branch$git_status$python$rust$nodejs$line_break$character";

      # Theme pulls
      palette = "obsidian_green";

      palettes.obsidian_green = {
        base = config.myTheme.base;
        text = config.myTheme.text;
        accent = config.myTheme.accent;
        error = config.myTheme.error;
        success = config.myTheme.success;
      };

      character = {
        success_symbol = "[❯](accent)";
        error_symbol = "[❯](error)";
      };

      directory.style = "accent";
      git_branch.style = "accent";
      git_status.style = "warning";
    };
  };
}

