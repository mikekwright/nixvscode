{
  description = "A VSCode flake with extensions and settings";

  inputs = {
    # This is from stable on July 6th, 2025
    # nixpkgs.url = "github:nixos/nixpkgs/8c14393fb2fb05dce014798d834c174f6bf94f3f";
    nixpkgs.url = "github:nixos/nixpkgs/fa0ef8a6bb1651aa26c939aeb51b5f499e86b0ec";

    # Version 1.104.1 - September 2025
    #   If you update to use a different version, update the below extensions as well
    #vscode-nixpkgs.url = "github:nixos/nixpkgs/fa0ef8a6bb1651aa26c939aeb51b5f499e86b0ec";
    vscode-nixpkgs.url = "github:nixos/nixpkgs/12bd230118a1901a4a5d393f9f56b6ad7e571d01";
    
    # This input includes most of the extensions that are included in the vscode
    #   flow.  While we won't be using the actual vscodium that comes from this
    #   solution, we will use it to help us manage the different extensions that
    #   we want to use.
    nix-vscode-extensions = {
      # url = "github:nix-community/nix-vscode-extensions/22a438cd9316db32acde1019382f25e110453fb2";
      url = "github:nix-community/nix-vscode-extensions/a87f796f1ed4b0a8babe9370791a66aac4864887";
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
          vscode-pkg = import inputs.vscode-nixpkgs {
            inherit system;
            config.allowUnfree = true;
          };

          versions = {
            vscode = "1.102.1";
            void = "1.99";
          };
        };

        debug = import ./lib/debug.nix {inherit pkgs extra-pkgs system;};
        funcs = import ./lib/funcs.nix {inherit debug extra-pkgs pkgs system;};
        lib = import ./lib/importer.nix {inherit debug extra-pkgs pkgs system funcs;};

        # vscodeModule = {
        #   inherit pkgs extra-pkgs;
        #   # module = import ./config; # import the module directly

        #   # You can use `extraSpecialArgs` to pass additional arguments to your module files
        #   extraSpecialArgs = {
        #     inherit inputs system pkgs debug extra-pkgs funcs;
        #   };
        # };
        flake-pkgs = lib.makeModule ./config;
        #   {
        #   voidpkg = pkgs.vscode;
        #   codepkg = pkgs.vscode;
        # };
          #lib.makeModule vscodeModule;
      in {
        checks = {
          # Run `nix flake check .` to verify that your config is not broken
          # TODO: Add the test derivation that can run
          #default = mkTestFrom Module vscodeModule;
        };

        packages = rec {
          void = flake-pkgs.voidpkg;
          code = flake-pkgs.codepkg;

          # Lets you run `nix run .` to start custom vscode
          default = code;
        };
      };
    };
}

