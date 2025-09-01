{ config, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;
    autosuggestion.enable = true;
    oh-my-zsh = {
    	enable = true;
    	plugins = ["sudo" "git" "docker" "aliases" "gh"];
   };
      };

}

