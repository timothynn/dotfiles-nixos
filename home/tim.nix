{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "tim";
  home.homeDirectory = "/home/tim";
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.allowUnsupportedSystem = true;
  imports = [
	../modules/loader.nix
];
  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.11"; # Please read the comment before changing.
  

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
  	spotify
	ffmpeg
	bat
	bottom
	gh
	git
	postman
	discord
	dbeaver-bin
	vscode
	fd
	ripgrep
	xh
	choose
	tokei
	procs
	tealdeer
	gcc
	unzip
	mpv
	lazygit
	cava
	kdePackages.dolphin
	qbittorrent
	zoxide
	nerd-fonts.jetbrains-mono
	nerd-fonts.fantasque-sans-mono
	nerd-fonts.iosevka
	nerd-fonts.fira-code
	brightnessctl
	playerctl
	pyprland
	fastfetch
	openssl
	bibata-cursors
	keepassxc
	pavucontrol
    cargo
    wayclip
    xclip
    clipman
    cliphist
    wl-clipboard
        libsForQt5.qtstyleplugin-kvantum
	code-cursor
	notion-app
	notion-app-enhanced
	clap
	rnm
	# bitwarden
	bitwarden-desktop
	bitwarden-cli
	rofi-rbw-wayland
	bws
	
  ];

  fonts.fontconfig.enable = true;

home.sessionVariables = {
  GTK_FONT_NAME = "JetbrainsMono Nerd Font 11";
  QT_FONT_NAME = "JetbrainsMono Nerd Font 11";
  GTK_THEME = "Obsidian-Green";
  QT_STYLE_OVERRIDE = "kvantum";
  BROWSER = "firefox";
  EDITOR = "emacs";
};


  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/tim/etc/profile.d/hm-session-vars.sh
  #

  # Let Home Manager install and manage itself.
  programs = {
    home-manager.enable = true;
    lazydocker.enable = true;

  };
}
