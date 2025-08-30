{ config, pkgs, ... }:
{
  programs.git = {
    enable = true;
    userName = "timothynn";
    userEmail = "timothynn08@gmail.com";
    extraConfig = {
      core.editor = "nvim";
      pull.rebase = true;
    };
  };
}

