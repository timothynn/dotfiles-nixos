{ lib, config, pkgs, ...}:

{
    programs.oh-my-posh = {
        enable = true;
        enableNushellIntegration = true;
        useTheme = "catppuccin_mocha";
    };
}
