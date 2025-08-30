{ pkgs, config, lib, ...}:

{
	programs.kitty = {
		enable = true;
		settings = {
			scrollback_lines = 10000;
			enable_audio_bell = false;
			update_check_interval = 0;
			window_padding_width = 3;
                        font_family = "FantasqueSansM Nerd Font";
                        font_size = 12;
                        cursor_color = "#f5e0dc";
		};
	};
}
