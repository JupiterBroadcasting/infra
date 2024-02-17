{ config, pkgs, lib, unstablePkgs, ... }:
{
  home.stateVersion = "23.11";

  # users.users.jarjar.group = "jarjar";
  # users.groups.jarjar = {};
  # users.users.${username} =
  # {
  #   group = "${username}";
  #   isNormalUser = true;
  #   extraGroups = [ "wheel" "docker" ];
  #   hashedPassword = "$6$wW/xsljhhG/vssC3$ujh/4jSZp7APUsbI6FAAUtIkaWVl9ElocFV6FKO7vD4ouoXKiebecrfmtd46NNVJBOFO8blNaEvkOLmOW5X3j.";
  # };

  # list of programs
  # https://mipmip.github.io/home-manager-option-search

  programs.home-manager.enable = true;

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
    tmux.enableShellIntegration = true;
  };

  programs.git = { enable = true; };

  programs.htop = {
    enable = true;
    settings.show_program_path = true;
  };

  programs.tmux = {
    enable = true;
    #keyMode = "vi";
    clock24 = true;
    historyLimit = 10000;
    plugins = with pkgs.tmuxPlugins; [
      gruvbox
    ];
    extraConfig = ''
      new-session -s main
      bind-key -n C-a send-prefix
    '';
  };

  programs.neovim.enable = true;
  programs.nix-index.enable = true;
  programs.zoxide.enable = true;

  programs.ssh = {
    enable = true;
    extraConfig = ''
    Host *
      StrictHostKeyChecking no
    '';
    matchBlocks = {
      "m morpheus" = {
        hostname = "morpheus";
        user = "alex";
      };
    };
  };
}