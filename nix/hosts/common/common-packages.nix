{ pkgs, unstablePkgs, ... }:

with pkgs; [
  ## unstable
  #unstablePkgs.yt-dlp

  ## stable
  ansible
  docker-compose
  git
  iperf3
  just
  jq
  mc
  mosh
  neofetch
  nmap
  ripgrep
  tree
  unzip
  watch
  wget
  vim

  # requires nixpkgs.config.allowUnfree = true;
  #terraform
  #vscode-extensions.ms-vscode-remote.remote-ssh
]