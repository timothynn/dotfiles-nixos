{ lib, pkgs, config,...}:
{
home-manager.users.root = {
              home.stateVersion = "24.05";
              programs.starship = {
                enable = true;
                settings = {
                  add_newline = false;
                  format = "$character $username $directory $git_branch $git_status";
                  character = {
                    success_symbol = "[❯](bold green)";
                    error_symbol = "[❯](bold red)";
                  };
                  username = {
                    style_user = "white bold";
                    style_root = "red bold";
                    format = "[$user]($style) ";
                    show_always = true;
                  };
                };
              };
};
}
