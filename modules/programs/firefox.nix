{ lib,pkgs,config,...}:

{
    programs.firefox = {
        enable = true;
        profiles = {
            tim = {
                name = "tim";
                isDefault = true;
                extensions = {
                    force = true;
                    settings = {
                    "uBlock0@raymondhill.net".settings = {
    selectedFilterLists = [
      "ublock-filters"
      "ublock-badware"
      "ublock-privacy"
      "ublock-unbreak"
      "ublock-quick-fixes"
    ];
  };
                      
                      };

                };
            };
        };
    };

        stylix.targets.firefox = {
            enable = true;
            profileNames = [ "tim" ];
            colorTheme.enable = true;
        };
}
