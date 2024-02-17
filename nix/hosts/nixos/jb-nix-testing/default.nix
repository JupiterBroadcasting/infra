{ config, pkgs, unstablePkgs, customArgs, ... }:
{
  imports = [
      ./hardware-configuration.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # value set in nixos-common.nix to Seattle
  #time.timeZone = "America/New_York";

  users.groups.${customArgs.username} = {};
  users.users.${customArgs.username} = {
    group = customArgs.username;
    isNormalUser = true;
    extraGroups = [ "wheel" "docker" ];
    hashedPassword = "$6$wW/xsljhhG/vssC3$ujh/4jSZp7APUsbI6FAAUtIkaWVl9ElocFV6FKO7vD4ouoXKiebecrfmtd46NNVJBOFO8blNaEvkOLmOW5X3j.";
  };

  services.openssh = {
    enable = true;
    settings.PasswordAuthentication = true;
    settings.PermitRootLogin = "yes";
  };
  services.vscode-server.enable = true;
  services.tailscale.enable = true;

  environment.systemPackages = import ./../../common/common-packages.nix {
    pkgs = pkgs; 
    unstablePkgs = unstablePkgs; 
  };
  nixpkgs.config.allowUnfree = true;

  virtualisation = {
    docker = {
      enable = true;
      autoPrune = {
        enable = true;
        dates = "weekly";
      };
    };
  };

  system.stateVersion = "23.11";
}