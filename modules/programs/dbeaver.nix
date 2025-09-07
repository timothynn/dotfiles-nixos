{ pkgs, ... }:

let
  dbeaverEE = pkgs.stdenv.mkDerivation rec {
    pname = "dbeaver-enterprise";
    version = "latest"; # adjust to latest release tag

    src = pkgs.fetchurl {
      url = "https://dbeaver.com/files/dbeaver-ee-${version}-linux.gtk.x86_64.tar.gz";
      sha256 = "sha256:141dca35564f197114b5a9478c48d7b9524920dd1973b71a6d296145eff53651"; # replace with real hash
    };

    nativeBuildInputs = [ pkgs.makeWrapper pkgs.unzip ];
    buildInputs = [ pkgs.zlib pkgs.glib pkgs.gtk3 pkgs.gtk2 pkgs.jdk ];

    installPhase = ''
      mkdir -p $out/opt/dbeaver
      tar -xzf $src --strip-components=1 -C $out/opt/dbeaver

      # Symlink the executable into bin
      mkdir -p $out/bin
      ln -s $out/opt/dbeaver/dbeaver $out/bin/dbeaver
    '';
  };
in
{
  home.packages = [
    dbeaverEE
  ];
}
