{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "tim";
  home.homeDirectory = "/home/tim";
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.allowUnsupportedSystem = true;
  imports = [ ../modules/loader.nix ];
  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.11"; # Please read the comment before changing.

  catppuccin = {
    enable = true;
    flavor = "mocha";
    accent = "red";
    cava.enable = false;
  };
    
  # Stylix
  stylix = {
    enable = true;
    image = pkgs.fetchurl {
    url = "https://www.pixelstalk.net/wp-content/uploads/2016/05/Epic-Anime-Awesome-Wallpapers.jpg";
    hash = "sha256-enQo3wqhgf0FEPHj2coOCvo7DuZv+x5rL/WIo4qPI50=";
  };
  polarity = "dark";
  fonts = {
    monospace = {
        package = pkgs.jetbrains-mono;
        name = "JetbrainsMono Nerd Font";

    };
    serif = config.stylix.fonts.monospace;
    sansSerif = config.stylix.fonts.monospace;
    emoji = config.stylix.fonts.monospace;
  };
  targets = {
    cava.rainbow.enable = true;
  };
  };

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    spotify
    nautilus
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
    libgcc
    clang
    unzip
    mpv
    lazygit
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
    clap
    rnm
    # bitwarden
    bitwarden-desktop
    bitwarden-cli
    rofi-rbw-wayland
    bws

    termusic
    yt-dlp
    pcmanfm
    mastodon

    #markdown
    glow
    mdcat
    mdbook
    emacsPackages.markdown-preview-mode

    code-cursor
    zoom-us
    slack
    appflowy

    vivaldi
    vivaldi-ffmpeg-codecs

    databricks-cli
    tree
    prefect 
    pgadmin4
  ];

  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "x-scheme-handler/slack" = [ "slack.desktop" ];
      "x-scheme-handler/zoommtg" = [ "Zoom.desktop" ];
    };
  };

  fonts.fontconfig.enable = true;

  home.sessionVariables = {
    GTK_FONT_NAME = "JetbrainsMono Nerd Font 11";
    QT_FONT_NAME = "JetbrainsMono Nerd Font 11";
    GTK_THEME = "Obsidian-Green";
    QT_STYLE_OVERRIDE = "kvantum";
    BROWSER = "firefox";
    EDITOR = "nvim";
  };

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
   
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
