{ config, pkgs, ... }:

{
  programs.starship = {
    enable = true;
    settings = {
      add_newline = true;
      palette = "obsidian_green";

      palettes.obsidian_green = {
        bg = "#1b1b1b";
        fg = "#d1d5d4";
        accent = "#00ff66";
        dim = "#2b2b2b";
      };

      prompt_order = [
        "username"
        "directory"
        "git_branch"
        "git_status"
        "nodejs"
        "rust"
        "python"
        "cmd_duration"
        "line_break"
        "jobs"
        "status"
        "character"
      ];

      username = {
        style_user = "fg:accent";
        style_root = "bold fg:accent";
        format = "[$user]($style) ";
      };

      directory = {
        style = "fg:accent";
        format = "[$path]($style) ";
      };

      git_branch = {
        style = "fg:accent";
        format = "[$branch]($style) ";
      };

      git_status = {
        style = "fg:accent";
      };

      character = {
        success_symbol = "[❯](fg:accent)";
        error_symbol = "[❯](bold red)";
      };
    };
  };
}

