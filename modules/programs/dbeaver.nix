# In your home.nix
{ pkgs, config, lib, ... }:

let
  dbeaver-EE = pkgs.stdenv.mkDerivation {
    pname = "dbeaver-ee";
    version = "latest"; # Replace with actual version

    src = pkgs.fetchurl {
      url =
        "https://dbeaver.com/files/dbeaver-ee-latest-linux.gtk.x86_64.tar.gz";
      sha256 = "sha256-orsFYutnaJ9uQOHqh7p4jmjnhuHgc4uSeQTVQ1lKqrw="; # You'll need to calculate this
    };

    installPhase = ''
      mkdir -p $out
      cp -r * $out/
      mkdir -p $out/bin
      ln -s $out/dbeaver $out/bin/dbeaver-ee
    '';

    meta = with lib; {
      description = "DBeaver Enterprise Edition";
      platforms = [ "x86_64-linux" ];
    };
  };
in {
  home.packages = with pkgs;
    [
        dbeaver-EE
    ];

  xdg.desktopEntries.dbeaver-ee = {
    name = "DBeaver Enterprise";
    comment = "Database management tool";
    exec = "dbeaver-ee";
    icon = "dbeaver";
    categories = [ "Development" "Database" ];
    mimeType = [ "application/sql" ];
  };

}
