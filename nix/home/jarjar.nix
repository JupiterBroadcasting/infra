{ config, lib, pkgs, unstablePkgs, myData, ... }:
{
  home.stateVersion = "23.11";
  programs.home-manager.enable = true;

  # list of programs
  # https://mipmip.github.io/home-manager-option-search
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