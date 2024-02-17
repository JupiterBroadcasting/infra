{ pkgs, unstablePkgs, ... }:

with pkgs; [
  ## unstable
  #unstablePkgs.yt-dlp
  #unstablePkgs.figurine

  ## stable
  ansible
  docker-compose
  #figurine
  git
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