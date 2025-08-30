# modules/mailspring.nix
{ config, pkgs, ... }:

{
  home.packages = with pkgs; [ mailspring ];

  home.file.".config/mailspring/config.json".text = ''
    {
      "some": "custom config"
    }
  '';

  # add desktop launcher
  xdg.desktopEntries.mailspring-libsecret = {
    name = "Mailspring (libsecret)";
    exec = "mailspring --password-store=gnome-libsecret";
    icon = "mailspring";
    terminal = false;
    categories = [ "Network" "Email" ];
  };
}

