{ config, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    shellAliases = {
      ls = "eza";
      hms = "home-manager switch";
      ns = "sudo nixos-rebuild switch ~/.config/home-manager/#tim";
    };
    enableCompletion = true;
    syntaxHighlighting.enable = true;
    autosuggestion.enable = true;
    oh-my-zsh = {
    	enable = true;
    	plugins = ["sudo" "git" "docker" "docker-compose" "aliases" "gh" ];
   };
      };

}

