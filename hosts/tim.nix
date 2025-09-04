# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

# WIREGUARD VPN
networking = {
    wireguard.enable = false;

    # Define your WireGuard interface
    wireguard.interfaces = {
      wg0 = {
        ips = [ "10.0.0.1/24" ]; # Your VPN private IP
        listenPort = 51820;      # The port WireGuard listens on
        privateKeyFile = "/etc/wireguard/privatekey"; # store securely

        peers = [
        {
          publicKey = "GGxmPfSRvNFFR+EopTkdT1XIgEuxThXLOecp0R4W/QE="; # replace
          allowedIPs = [ "10.0.0.2/32" ]; # send all traffic through VPN
        }
      ];
    };
    };
  };

 networking.nat.enable = false;
  networking.nat.externalInterface = "enp0s31f6";  # replace with your WAN interface
  networking.nat.internalInterfaces = [ "wg0" ];

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Africa/Nairobi";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  programs.zsh.enable = true;
  users = {
	defaultUserShell = pkgs.zsh;
  };
  users.users.root = {
	shell = pkgs.zsh;
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.tim = {
    isNormalUser = true;
    description = "tim";
    extraGroups = [ "networkmanager" "wheel" "audio" "video" "storage" "docker" "postgres"];
    packages = with pkgs; [];
    ignoreShellProgramCheck = true;
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
  environment.systemPackages = with pkgs; [
  #  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
  #  wget
  firefox
  home-manager
  docker-compose
  libsForQt5.qt5.qtgraphicaleffects
  libsecret
  gnome-secrets
  emacs
    wireguard-ui
    wireguard-tools
    (catppuccin-sddm.override {
    flavor = "mocha";
    font  = "JetbrainsMono Nerd Font";
    fontSize = "10";
    # background = "${./wallpaper.png}";
    loginBackground = true;
  })
  pgcli
  ];

  virtualisation.docker = {
	enable = true;
	rootless.enable = true;
  };
  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  programs.gnupg.agent = {
   enable = true;
     enableSSHSupport = true;
   };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
   services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ 51820 ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?
xdg.portal = {
  enable = true;
  extraPortals = [
   pkgs.xdg-desktop-portal-hyprland
  ];
  config.common.default = [ "hyprland" ];
};

programs.dconf.enable = true;
services.displayManager.sddm = {
	enable = true;
    package = pkgs.kdePackages.sddm;
	wayland.enable = true;
    theme = "catppuccin-mocha";
};

services.pipewire = {
	enable = true;
	audio.enable = true;
	pulse.enable = true;
	alsa.enable = true;
};

services.udisks2.enable = true;


services.gvfs.enable = true;

# SECURITY
services.gnome.gnome-keyring.enable = true;
programs.uwsm = {
	enable = true;
	waylandCompositors = {
	hyprland = {
  prettyName = "Hyprland";
  comment = "Hyprland compositor managed by UWSM";
  binPath = "/run/current-system/sw/bin/Hyprland";
};
};
};
security.polkit = {
	enable = true;
	extraConfig = ''  
  		/* Allow any local user to do anything (dangerous!). */
  		polkit.addRule(function(action, subject) {
    			if (subject.local) return "yes";
  		});
	'';};
# FLATPAK
services.flatpak = {
	enable = true;
};

services = {
	postgresql = {enable = true;};
	postgrest = {enable = true;};
};
}
