{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/release-23.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager.url = "github:nix-community/home-manager/release-23.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    vscode-server.url = "github:nix-community/nixos-vscode-server";
  };

  outputs = inputs@{ self
    , nixpkgs, nixpkgs-unstable
    , home-manager, vscode-server, ... }:
    let
      inputs = { inherit nixpkgs nixpkgs-unstable home-manager vscode-server; };

      # creates package set for us to use
      genPkgs = import nixpkgs { config.allowUnfree = true; };

      # creates a nixos system configuration using the specified inputs
      nixosSystem = hostname: username:
        let
          pkgs = genPkgs;
        in
          nixpkgs.lib.nixosSystem
          {
            specialArgs = {
              # adds unstable to be available in top-level evals (like in common-packages)
              unstablePkgs = inputs.nixpkgs-unstable.legacyPackages.x86_64-linux;

              # lets us use these things in modules
              customArgs = { inherit username pkgs; };
            };
            modules = [
              ./nix/hosts/nixos/${hostname}
              vscode-server.nixosModules.default
              home-manager.nixosModules.home-manager {
                networking.hostName = hostname;
                home-manager.useGlobalPkgs = true;
                home-manager.useUserPackages = true;
                home-manager.users.${username} = { imports = [ ./nix/home/${username}.nix ]; };
              }
              ./nix/hosts/common/nixos-common.nix
            ];
          };
    in
    {
      nixosConfigurations = {
        jb-nix-testing = nixosSystem "jb-nix-testing" "jarjar";
    };
  };
}