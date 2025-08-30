{ config, pkgs, ...}:
{
  home.packages = with pkgs; [
    hyprsunset
  ];

  services.hyprsunset = {
    enable = true;
    
      };

}


