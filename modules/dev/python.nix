{lib,pkgs,config,...}:
{
  home.packages = with pkgs; [
    python313
    python313Packages.pip
  ];
}
