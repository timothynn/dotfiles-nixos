{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "tim";
  home.homeDirectory = "/home/tim";
  nixpkgs.config.allowUnfree = true;
  imports = [ ./modules/loader.nix ];
  home.stateVersion = "25.11"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    # # Adds the 'hello' command to your environment. It prints a friendly
    firefox
    curl
    wget
    libgcc
    clang
    termusic
    xh
    choose 
    yt-dlp
    fd
    ripgrep
    nushell
    docker-compose
    libsecret
    gnome-keyring
    google-chrome
    mailspring
    dbeaver-bin
    direnv
    wl-clipboard
    qbittorrent
    kdePackages.dolphin
    bitwarden-desktop
    bitwarden-cli
    base16-schemes
    fastfetch
    emacs
    vscode
    lazygit
    hyprpaper
    hyprsunset
    brightnessctl
    playerctl
    pavucontrol
    pyprland
    wlogout
    spotify
    discord
    bat
    cava
    tree
    tealdeer
    mpv
    tokei
    procs
    networkmanagerapplet
    blueman
    cliphist
    slack
    ranger
    vlc
    helvum
    nerd-fonts.jetbrains-mono
    nerd-fonts.fantasque-sans-mono
    pamixer
 ];

fonts.fontconfig.enable = true;

 stylix = {
	enable = true;
	base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
	polarity = "dark";
 fonts = {
      
      monospace = {
        package = pkgs.nerd-fonts.jetbrains-mono;
        name = "JetbrainsMono Nerd Font";
      };
     serif = config.stylix.fonts.monospace; 
     sansSerif = config.stylix.fonts.monospace; 
     emoji = config.stylix.fonts.monospace; 
     sizes = {
        applications = 10;
        desktop = 10;
        popups = 10;
        terminal = 10;
     };
    };
# Cursor theme
    cursor = {
      package = pkgs.catppuccin-cursors;
      name = "Catppuccin-Mocha-Green";
      size = 16;
    };
    # Target specific applications
    targets = {
      gtk.enable = true;
      qt = {
            enable = true;
            platform = "qtct";
        };
      kde.enable = true;
      kitty.enable = true;
      hyprland.enable = true;
    };
};

   
  # plain files is through 'home.file'.
  home.file = {

  };


  home.sessionVariables = {
    EDITOR = "emacs";
    NIXOS_OZONE_WL = "1";  # tells Electron to use Wayland
    ELECTRON_OZONE_PLATFORM_HINT = "wayland";
    ELECTRON_ENABLE_WAYLAND = "1";
    # GTK_IM_MODULE = "wayland";
    QT_QPA_PLATFORMTHEME = "qt5ct";
    QT_STYLE_OVERRIDE = "kvantum";   # Force Kvantum style
    QT_QPA_PLATFORM = "wayland;xcb";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
