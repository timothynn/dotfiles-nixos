{lib,pkgs,config,...}:
{
  programs.gh = {
    enable = true;
    plugins = [
      pkgs.gh-eco
      pkgs.gh-dash
      pkgs.gh-markdown-preview
      pkgs.gh-s 
      pkgs.gh-f 
      pkgs.gh-skyline
      pkgs.gh-copilot
      pkgs.gh-screensaver
    ]
  };
}
