{ lib, pkgs, config,...}:
{
	home.username = "root";
  	home.homeDirectory = "/root";
        home.stateVersion = "25.05";

	programs.zsh.enable = true;
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
		    disabled = false;
                    show_always = true;
                  };
                };
};
}
