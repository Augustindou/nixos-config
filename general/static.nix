{ config, pkgs, ... }:
let
  userCfg = config.user;
in
{
  config = {
    # Bootloader
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

    # Enable bluetooth & wifi
    hardware.bluetooth = {
      enable = true;
      powerOnBoot = true;
    };
    networking = {
      hostName = "${userCfg.username}-nixos"; # Define your hostname.
      networkmanager.enable = true;
      wireless.enable = false; # Enables wireless support via wpa_supplicant.
    };

    # Set your time zone.
    time.timeZone = "Europe/Brussels";

    # Select internationalisation properties.
    i18n.defaultLocale = "en_US.UTF-8";

    i18n.extraLocaleSettings = {
      LC_ADDRESS = "fr_BE.UTF-8";
      LC_IDENTIFICATION = "fr_BE.UTF-8";
      LC_MEASUREMENT = "fr_BE.UTF-8";
      LC_MONETARY = "fr_BE.UTF-8";
      LC_NAME = "fr_BE.UTF-8";
      LC_NUMERIC = "fr_BE.UTF-8";
      LC_PAPER = "fr_BE.UTF-8";
      LC_TELEPHONE = "fr_BE.UTF-8";
      LC_TIME = "en_US.UTF-8";
    };

    # Enable the X11 windowing system.
    services.xserver.enable = true;

    # Enable CUPS to print documents.
    services.printing.enable = true;

    # Allow unfree packages
    nixpkgs.config.allowUnfree = true;

    # Enable sound with pipewire.
    hardware.pulseaudio.enable = false;
    security.rtkit.enable = true;
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      # If you want to use JACK applications, uncomment this
      #jack.enable = true;

      # use the example session manager (no others are packaged yet so this is enabled by default,
      # no need to redefine it in your config for now)
      #media-session.enable = true;
    };

    # default keyboard stuff
    services.xserver.xkb = {
      layout = "be";
      # variant = "nodeadkeys";
    };

    console.useXkbConfig = true;

    # This value determines the NixOS release from which the default
    # settings for stateful data, like file locations and database versions
    # on your system were taken. It‘s perfectly fine and recommended to leave
    # this value at the release version of the first install of this system.
    # Before changing this value read the documentation for this option
    # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
    system.stateVersion = "24.05";

    # important packages
    environment.systemPackages = with pkgs; [
      networkmanager
    ];
  };
}
