{ pkgs, debug, extra-pkgs, system, funcs, ... }:

let
  # void-editor = import ./editors/void.nix {
  #   inherit pkgs system;
  # };

  make-app-module = import ./builder.nix {
    inherit pkgs debug;
  };

  # This is the other way (supposedly) to use the extensions, but I am going
  #   to land on just the overlaps to start
  # vscode-extensions = pkgs.nix-vscode-extensions.forVSCodeVersion "1.101.2";
  vscode-extensions = pkgs.nix-vscode-extensions.forVSCodeVersion extra-pkgs.versions.vscode;
  # void-extensions = pkgs.nix-vscode-extensions.forVSCodeVersion "1.99";
  # void-extensions = pkgs.nix-vscode-extensions.forVSCodeVersion extra-pkgs.versions.void;
in {
  makeIncludes = includes: {
    extensions = includes.extensions or [];
    packages = includes.packages or [];
    complete = includes.complete or [];
    ai = includes.ai or [];
  };

  makeModule = includes: config-start: rec {
    vscode-extra-pkgs = extra-pkgs // {
      extensions = vscode-extensions;
    };

    # void-extra-pkgs = extra-pkgs // {
    #   extensions = void-extensions;
    # };

    module-shared = extra-pkgs: is-void: rec {
      inherit pkgs extra-pkgs;

      # module = import config-start;
      module = config-start;
      options = import ./options.nix { inherit includes; };

      extraSpecialArgs = {
        inherit options system pkgs debug extra-pkgs funcs is-void;
      };
    };

    vscode-module = module-shared vscode-extra-pkgs false;
    # void-module = module-shared void-extra-pkgs true;

    root-user-dir =
      if (builtins.elem system pkgs.lib.platforms.darwin) then
        "$HOME/Library/Application Support"
      else
        "$HOME/.config";

    codepkg = make-app-module vscode-module {
      vscode-pkg = vscode-extra-pkgs.vscode-pkg.vscode;
      executable = "code";
      desktopName = "Visual Studio Code";
      userDataDir = "${root-user-dir}/Code";
      mimeTypes = [
        "application/x-code-workspace"
        "application/vscode"
        "x-scheme-handler/vscode"

        # Just adding insiders just in case
        "application/x-code-insiders-workspace"
      ];
    };

    # voidpkg = make-app-module void-module {
    #   vscode-pkg = void-editor;
    #   executable = "void";
    #   desktopName = "Void Editor";
    #   userDataDir = "${root-user-dir}/Void";
    #   mimeTypes = [
    #     "application/x-void-workspace"
    #     "application/void"
    #     "x-scheme-handler/void"
    #   ];
    # };
  };
}
