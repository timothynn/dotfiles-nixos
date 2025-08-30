{ config, pkgs, lib, ...}:

{
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    autocd = true;
    enableCompletion = true;
    historySubstringSearch.enable = true;
    shellAliases = {
    	cd = "z";
    	ls = "eza";
        ll = "ls -l";
        la = "ls -a";
      hms = "home-manager switch";
    };

    oh-my-zsh = {
      enable = true;
      plugins = ["git" "sudo" "docker" "aliases"];
          };
    syntaxHighlighting.enable = true;
  };
}
