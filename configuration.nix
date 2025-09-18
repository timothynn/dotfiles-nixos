# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader = {
	systemd-boot.enable = false;
	grub = {
		enable = true;
		useOSProber = true;
		efiSupport = true;
		device = "nodev";
		    theme = pkgs.catppuccin-grub.override {
      flavor = "mocha";
    };
	};
  };

  boot.plymouth = {
    enable  = true;
    theme = "colorful_loop";
    themePackages = [ pkgs.adi1090x-plymouth-themes ];
  };

  boot.loader.efi.canTouchEfiVariables = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

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
  users.defaultUserShell = pkgs.nushell;
  users.users.root.shell = pkgs.nushell;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.tim = {
    isNormalUser = true;
    description = "tim";
    extraGroups = [ "networkmanager" "wheel" "docker" "audio" "video" "storage" ];
    packages = with pkgs; [];
    ignoreShellProgramCheck = true;
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
  #  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
  #  wget
home-manager
libsForQt5.qt5.qtgraphicaleffects
(catppuccin-sddm.override {
      flavor = "mocha";
})
nushell
nerd-fonts.jetbrains-mono

  ];

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
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?
programs = {
	hyprland = {
		enable = true;
		xwayland.enable = true;
		portalPackage = pkgs.xdg-desktop-portal-hyprland;
	};
	dconf.enable = true;
};

# xdg.portal = {
# 	enable = false;
# 	extraPortals = [
# 		pkgs.xdg-desktop-portal-hyprland
# 		pkgs.xdg-desktop-portal-gtk
# 	];
# 	config.common.default = ["hyprland"];
# };

services = {
	displayManager.sddm = {
			enable = true;
			wayland.enable = true;
			package = pkgs.kdePackages.sddm;
			theme = "catppuccin-mocha";
	};
	udisks2.enable  = true;
	dbus.enable = true;
 pipewire = {
      enable = true;
      audio.enable = true;
      pulse.enable = true;
      alsa.enable = true;
    };
    gvfs.enable = true;
        gnome.gnome-keyring.enable = true;
};

security = {
	polkit = {
		enable = true;
		 extraConfig = ''
		 polkit.addRule(function(action, subject) {
          		if (subject.local) return "yes";
        	});
      		'';
	};
};

virtualisation.docker = {
	enable = true;
	rootless.enable = true;
};

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    QT_QPA_PLATFORM = "wayland";
    SDL_VIDEODRIVER = "wayland";
    XDG_SESSION_TYPE = "wayland";
    XDG_CURRENT_DESKTOP = "Hyprland";
  };
}
