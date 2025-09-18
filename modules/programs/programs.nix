{ lib, config, pkgs, ... }:

{
  imports = [
    # ./firefox.nix
    ./eza.nix
    ./fzf.nix
    ./git.nix
    ./gh.nix
    ./hyprlock.nix
    ./kitty.nix
    ./nixvim/nixvim.nix
    ./rofi.nix
    # ./starship.nix
    ./oh-my-posh.nix
    ./waybar.nix
    ./zellij.nix
    ./zoxide.nix
    ./yazi.nix
    ./zsh.nix
    ./skim.nix
    ./cava.nix
    ./feh.nix
    ./atuin.nix
    ./fd.nix
    ./ripgrep.nix
    ./bottom.nix
    ./nushell.nix
    ./direnv.nix
];
}
