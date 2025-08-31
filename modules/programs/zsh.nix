{ config, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;
    autosuggestion.enable = true;
    oh-my-zsh = {
    	enable = true;
    	plugins = ["sudo" "git" "docker" "aliases"];
   };

    initContent = ''
      # Obsidian-Green accents
      export ZSH_HIGHLIGHT_HIGHLIGHTERS_DIR=${pkgs.zsh-syntax-highlighting}/share/zsh-syntax-highlighting/highlighters

      # Basic LS_COLORS tweak for obsidian-green
      export LS_COLORS="di=1;32:ln=36:so=35:pi=33:ex=1;32:*.sh=1;32:*.nix=1;32"
    '';
  };

  programs.starship.enable = true;
}

