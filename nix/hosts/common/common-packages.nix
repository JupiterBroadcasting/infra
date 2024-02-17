{ pkgs, unstablePkgs, ... }:

with pkgs; [
  ## unstable
  #unstablePkgs.yt-dlp
  #unstablePkgs.figurine

  ## stable
  ansible
  btop
  docker-compose
  #figurine
  git
  htop
  jq
  mc
  nmap
  ripgrep
  tree
  unzip
  watch
  wget
  vim

  # requires nixpkgs.config.allowUnfree = true;
  vscode-extensions.ms-vscode-remote.remote-ssh
]