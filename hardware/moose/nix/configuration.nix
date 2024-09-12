{ config, pkgs, ... }:
{
  imports =
    [
      ./hardware-configuration.nix
      (fetchTarball "https://github.com/nix-community/nixos-vscode-server/tarball/master")
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelModules = [ "drivetemp" ];

  boot.supportedFilesystems = [ "zfs" ];
  boot.zfs.extraPools = [ "jbdata" ];
  services.zfs.autoScrub.enable = true;

  networking.networkmanager.enable = true;
  networking.hostName = "moose-jbdata";
  networking.hostId = "a13b14c1";
  time.timeZone = "America/Toronto";

  i18n.defaultLocale = "en_US.UTF-8";
  services.xserver.xkb.layout = "us";

  users.users.moose = {
    isNormalUser = true;
    description = "alex";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };
  users.defaultUserShell = pkgs.bash;
  programs.bash.interactiveShellInit = "figurine -f \"3d.flf\" moose-jbdata";

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    ansible
    dig
    e2fsprogs # badblocks
    figurine
    gcc
    git
    htop
    inxi
    iotop
    lm_sensors
    mc
    molly-guard
    ncdu
    nmap
    python3
    smartmontools
    tmux
    tree
    vim
    wget

    # zfs send/rec with sanoid/syncoid
    lzop
    mbuffer
    pv
    sanoid
    zstd
  ];

  services.tailscale.enable = true;
  boot.kernel.sysctl."net.ipv4.ip_forward" = 1;

  services.openssh.enable = true;
  services.qemuGuest.enable = true;

  system.stateVersion = "24.05";
}