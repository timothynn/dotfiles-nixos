{ config, pkgs, lib, ... }:

{

    # GTK Theme (using Home Manager’s gtk module)
#     gtk = {
#       enable = true; 
#     };

    stylix.targets.gtk = {
            enable = true;
            flatpakSupport.enable = true;
    };

    stylix.targets.qt = {
            enable = true;
            platform = "qtct";
    };
    
    stylix.targets.xfce = {enable = true;};

 }

