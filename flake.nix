{
  description = "A VSCode flake with extensions and settings";

  inputs = {
    # This is from stable on July 6th, 2025
    nixpkgs.url = "github:nixos/nixpkgs/8c14393fb2fb05dce014798d834c174f6bf94f3f";

    # Version 1.101.2 - July 1st, 2025
    #   If you update to use a different version, update the below extensions as well
    vscode-nixpkgs.url = "github:nixos/nixpkgs/b32441ec0fae600e647cf4e6d6c245286a583106";

    # This input includes most of the extensions that are included in the vscode
    #   flow.  While we won't be using the actual vscodium that comes from this
    #   solution, we will use it to help us manage the different extensions that
    #   we want to use.
    nix-vscode-extensions = {
      # url = "github:nix-community/nix-vscode-extensions/41de1aa39e479cdf2e6fd522431aa1fc3615e35a";
      url = "github:nix-community/nix-vscode-extensions/22a438cd9316db32acde1019382f25e110453fb2";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Flake parts for 2025-02-08
    flake-parts.url = "github:hercules-ci/flake-parts/32ea77a06711b758da0ad9bd6a844c5740a87abd";
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
          overlays = [ inputs.nix-vscode-extensions.overlays.default ];
        };

        # This should go away at some point
        extra-pkgs = {
          #  This is the other way (supposedly) to use the extensions, but I am going
          #    to land on just the overlaps to start
          extensions = pkgs.nix-vscode-extensions.forVSCodeVersion "1.101.2";

          vscode-pkg = import inputs.vscode-nixpkgs {
            inherit system;
            config.allowUnfree = true;
          };
        };

        debug = import ./lib/debug.nix {inherit pkgs extra-pkgs system;};
        funcs = import ./lib/funcs.nix {inherit debug extra-pkgs pkgs system;};
        lib = import ./lib/importer.nix {inherit debug extra-pkgs pkgs system;};

        vscodeModule = {
          inherit pkgs extra-pkgs;
          module = import ./config; # import the module directly

          # You can use `extraSpecialArgs` to pass additional arguments to your module files
          extraSpecialArgs = {
            inherit inputs system pkgs debug extra-pkgs funcs;
          };
        };
        vscode = lib.makeModule vscodeModule;
      in {
        checks = {
          # Run `nix flake check .` to verify that your config is not broken
          # TODO: Add the test derivation that can run
          #default = mkTestFrom Module vscodeModule;
        };

        packages = {
          # Lets you run `nix run .` to start custom vscode
          default = vscode;
        };
      };
    };
}
