# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:


{
  services.picom.enable = true;
  services.xserver =
    {
      enable = true;
      layout = "gb";
      displayManager.sddm =
       { 
         enable = true;
         autoNumlock = true;
       };
       windowManager.i3 =
       {
        enable = true;
        package = pkgs.i3-gaps;
        extraPackages = [
            pkgs.rofi
            pkgs.i3status
            pkgs.i3lock
            ];
         };
       };

nix = {
    package = pkgs.nixFlakes; # or versioned attributes like nix_2_7
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
   };



   imports = [
     ./hardware-configuration.nix
    ];

    networking.hostName = "Steven";
    networking.networkmanager.enable = true;

    system = {
       stateVersion = "21.11";
      };

    time.timeZone = "Europe/Amsterdam";
     

 services = {
    tailscale.enable = true;
};
    

 #      libinput.enable = true;
  #     desktopManager.xterm.enable = false;
   #    displayManager.lightdm.enable = true;

#       programs.mosh = { enable = true; };
   
      environment = {
         variables = {
            EDITOR = "nvim";
            LC_ALL = config.i18n.defaultLocale;
            TERM= "xterm-256color";
          };
         };





nixpkgs.config.allowUnfree = true;

  # Use the GRUB 2 boot loader.
  boot.loader.grub.enable = true;
  boot.loader.grub.version = 2;
  # boot.loader.grub.efiSupport = true;
  # boot.loader.grub.efiInstallAsRemovable = true;
  # boot.loader.efi.efiSysMountPoint = "/boot/efi";
  # Define on which hard drive you want to install Grub.
  boot.loader.grub.device = "/dev/sda"; # or "nodev" for efi onl



  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant
  # The global useDHCP flag is deprecated, therefore explicitly set to false here.
  # Per-interface useDHCP will be mandatory in the future, so this generated config
  # replicates the default behaviour.
  networking.useDHCP = false;
  networking.interfaces.ens33.useDHCP = true;

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
i18n.defaultLocale = "en_GB.UTF-8";
 console = {
font = "Lat2-Terminus16";
keyMap = "uk";
  };

  # Enable the X11 windowing system.
  # services.xserver.enable = true;
  # Configure keymap in X11

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
  # sound.enable = true;
  # hardware.pulseaudio.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.steven = {
     isNormalUser = true;
     initialHashedPassword = "$6$2IMeBUr3ehYkkF9p$popywjgNmIsi1pSdE1AtHH29mHjUVPAgJwsxRoAoMt0bEoovw.A5P7Y2wo0xO611JQizf0DCMV9UWIXpGdyxt/";
     
     extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
   environment.systemPackages = with pkgs; [
     neovim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
     wget
     firefox
     git
     btop
     kitty
     mattermost-desktop
     upterm
     tmux
     dnsutils
     vscode
     openssl
     libvirt
     figlet
   ];
   programs.bash.shellInit = ''
TERM=xterm
'';


   virtualisation.vmware.guest.enable=true;

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

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
  # Did you read the comment?

}
