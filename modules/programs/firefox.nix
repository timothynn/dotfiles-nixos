{ lib,pkgs,config,...}:

{
    programs.firefox = {
        enable = true;
        profiles = {
            tim = {};
        }
        stylix.targets.firefox = {
            enable = true;
            profileNames = [ "tim" ];
            colorTheme.enable = true;
        };
    };
}
