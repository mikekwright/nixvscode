{
  description = "A VSCode flake with extensions and settings";

  inputs = {
    # nixos-unstable: November 8th, 2025
    nixpkgs.url = "github:nixos/nixpkgs/b6a8526db03f735b89dd5ff348f53f752e7ddc8e";

    # Version 1.105.1 - October 20th 2025
    vscode-nixpkgs.url = "github:nixos/nixpkgs/d5faa84122bc0a1fd5d378492efce4e289f8eac1";
    
    # This input includes most of the extensions that are included in the vscode
    #   flow.  While we won't be using the actual vscodium that comes from this
    #   solution, we will use it to help us manage the different extensions that
    #   we want to use.
    nix-vscode-extensions = {
      # master: November 11th, 2025
      url = "github:nix-community/nix-vscode-extensions/6110f762f238177ba231e8726fabcf4706c9c378";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # main: November 10th, 2025
    flake-parts.url = "github:hercules-ci/flake-parts/0bdadb1b265fb4143a75bd1ec7d8c915898a9923";
  };

  outputs = {
    flake-parts,
    ...
  } @ inputs:
    flake-parts.lib.mkFlake {inherit inputs;} {
      systems = [
        "x86_64-linux"
        "aarch64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ];

      perSystem = {
        system,
        ...
      }: let
        pkgs = import inputs.nixpkgs {
          inherit system;
          config.allowUnfree = true;
          overlays = [ 
            inputs.nix-vscode-extensions.overlays.default
          ];
        };

        # This should go away at some point
        extra-pkgs = {
          vscode-pkg = import inputs.vscode-nixpkgs {
            inherit system;
            config.allowUnfree = true;
          };

          versions = {
            vscode = "1.105.1";
          };
        };

        debug = import ./lib/debug.nix {inherit pkgs extra-pkgs system;};
        funcs = import ./lib/funcs.nix {inherit debug extra-pkgs pkgs system;};
        lib = import ./lib/importer.nix {inherit debug extra-pkgs pkgs system funcs;};

        flake-pkgs = lib.makeModule ./config;
      in {
        checks = {
          # Run `nix flake check .` to verify that your config is not broken
          # TODO: Add the test derivation that can run
          #default = mkTestFrom Module vscodeModule;
        };

        packages = rec {
          code = flake-pkgs.codepkg;

          # Lets you run `nix run .` to start custom vscode
          default = code;
        };
      };
    };
}
