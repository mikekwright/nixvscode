{ pkgs, extra-pkgs, system, ... }:

let
  system-maps = {
    x86_64-linux = "linux-x86_64";
    aarch64-darwin = "osx-arm64";
    x86_64-darwin= "osx-x86_64";
  };

  # DCD is the D language code completion daemon, which is used by the D language
  #   this is the download for the used package
  dcd-package = pkgs.stdenv.mkDerivation rec {
    pname = "dcd";
    version = "0.15.2";
    systemMap = system-maps.${system} or "linux-x86_64";

    src = pkgs.fetchurl {
      url = "https://github.com/dlang-community/DCD/releases/download/v${version}/dcd-v${version}-${systemMap}.tar.gz";
      hash = "sha256-0VkL0FgIS+GJo5ELP/joCfgxfA1SVgb1g0/RxVeO6PU=";
    };

    nativeBuildInputs = [
      pkgs.autoPatchelfHook
    ];

    buildInputs = with pkgs; [
      libgcc
    ];

    sourceRoot = ".";

    installPhase = ''
      runHook preInstall

      install -m755 -D dcd-client $out/bin/dcd-client
      install -m755 -D dcd-server $out/bin/dcd-server

      runHook postInstall
    '';

    meta = with pkgs.lib; {
      description = "DCD is a D language code completion daemon.";
      homepage = "https://github.com/dlang-community/DCD";
      platforms = platforms.linux ++ platforms.darwin;
    };
  };
in {
  vscodeExtensions = with extra-pkgs.extensions; [
    # Dlang main extension
    #    https://marketplace.visualstudio.com/items?itemName=webfreak.code-d
    vscode-marketplace.webfreak.code-d

    # A testing UI solution that is a dependency of code-d (hopefully the code-d
    #    will be updated to use the vscode built-in apis added in version 1.59)
    #    https://marketplace.visualstudio.com/items?itemName=hbenl.vscode-test-explorer
    vscode-marketplace.hbenl.vscode-test-explorer

    # This extension is how it converts to the vscode native testing api
    #    https://marketplace.visualstudio.com/items?itemName=ms-vscode.test-adapter-converter
    vscode-marketplace.ms-vscode.test-adapter-converter
  ];

  packages = with pkgs; [
    dmd
    # This is the dlang package manager
    dub

    # This is the d language server
    serve-d

    dcd-package
  ] ++ (
    if builtins.hasAttr system system-maps
      then [ dcd-package]
      else []
    ); # This is the dcd package, which is used by code-d

  vscodeSettings = {
    "[dlang]" = {
      "editor.tabSize" = 2;
      "editor.rulers" = [ 100 120 ];
      "outline.showTypeParameters" = true;
    };

    "d.dubCompiler" = "dmd";
    "d.stdlibPath" = "auto";
    "d.servedPath" = "${pkgs.serve-d}/bin/serve-d";
    "d.enableFormatting" = true;
    "d.enableLinting" = true;
    "d.enableAutoComplete" = true;
    "d.enableCoverageDecoration" = true;


    # Going to use the path one so it can be updated
    # "d.dmdPath" = "${pkgs.dmd}/bin/dmd";

    # This is the bridge so that the Test explorer uses vscode native solution
    "testExplorer.useNativeTesting" = true;
  } // (
    if builtins.hasAttr system system-maps
      then {
        "d.dcdClientPath" = "${dcd-package}/bin/dcd-client";
        "d.dcdServerPath" = "${dcd-package}/bin/dcd-server";
      }
      else {
        "d.dcdClientPath" = "$HOME/.local/share/code-d/bin/dcd-client";
        "d.dcdServerPath" = "$HOME/.local/share/code-d/bin/dcd-server";
      }
  );
}
