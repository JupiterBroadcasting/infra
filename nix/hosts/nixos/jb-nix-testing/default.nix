# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running `nixos-help`).

{ config, pkgs, unstablePkgs, customArgs, ... }:

{

  users.groups.${customArgs.username} = {};
  users.users.${customArgs.username} = {
    group = customArgs.username;
    isNormalUser = true;
    extraGroups = [ "wheel" "docker" ];
    hashedPassword = "$6$wW/xsljhhG/vssC3$ujh/4jSZp7APUsbI6FAAUtIkaWVl9ElocFV6FKO7vD4ouoXKiebecrfmtd46NNVJBOFO8blNaEvkOLmOW5X3j.";
  };

  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.initrd.availableKernelModules = [ "ata_piix" "uhci_hcd" "virtio_pci" "virtio_scsi" "sd_mod" "sr_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ ];
  boot.extraModulePackages = [ ];

  # value set in nixos-common.nix to Seattle
  #time.timeZone = "America/New_York";



  services.openssh = 
  {
    enable = true;
    settings.PasswordAuthentication = true;
    settings.PermitRootLogin = "yes";
  };
  services.vscode-server.enable = true;
  services.tailscale.enable = true;

  environment.systemPackages = import ./../../common/common-packages.nix
  {
    pkgs = pkgs; 
    unstablePkgs = unstablePkgs; 
  };

  virtualisation = 
  {
    docker = {
      enable = true;
      autoPrune = {
        enable = true;
        dates = "weekly";
      };
    };
  };

  #system.copySystemConfiguration = true;
  system.stateVersion = "23.11";

}