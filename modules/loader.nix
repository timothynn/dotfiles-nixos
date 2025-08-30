# modules/loader.nix
{ lib, ... }:

let
  modulePaths =
    builtins.filter
      (path: lib.hasSuffix ".nix" path && baseNameOf path != "loader.nix" )
      (lib.filesystem.listFilesRecursive ./.);
in
  {
    imports = map import modulePaths;
  }

