{ pkgs, unstablePkgs, lib, inputs, ... }:
let 
  inherit (inputs) nixpkgs nixpkgs-unstable;
in
{
  time.timeZone = "America/Seattle";

  nix = {
    settings = {
        experimental-features = [ "nix-command" "flakes" ];
        warn-dirty = false;
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };

  environment.systemPackages = with pkgs; [
    cowsay
  ];
}