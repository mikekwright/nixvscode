{
  description = "A VSCode flake with extensions and settings";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/4989a246d7a390a859852baddb1013f825435cee";

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
        };
        
        # This should go away at some point
        extra-pkgs = {};

        debug = import ./lib/debug.nix {inherit pkgs extra-pkgs system;};
        lib = import ./lib/importer.nix {inherit debug extra-pkgs pkgs system;};

        vscodeModule = {
          inherit pkgs extra-pkgs;
          module = import ./config; # import the module directly
          # You can use `extraSpecialArgs` to pass additional arguments to your module files
          extraSpecialArgs = {
            inherit inputs system pkgs debug extra-pkgs;
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
