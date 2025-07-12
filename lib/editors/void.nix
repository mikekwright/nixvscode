{ pkgs, system, ... }:

let
  void-base-url = version: "https://github.com/voideditor/binaries/releases/download/${version}/";
  void-package-details = version: system: {
    x86_64-linux = {
      url = (void-base-url version) + "Void-linux-x64-${version}.tar.gz";
      compression = "tar.gz";
      hash = "sha256-e+uXS1Jxa+dzl+Qg4MEDYl7XFFNlOT7O96oWB2bAagQ=";
    };

    aarch64-linux = {
      url = (void-base-url version) + "Void-linux-arm64-${version}.tar.gz";
      compression = "tar.gz";
      hash = "";
    };

    x86_64-darwin = {
      url = (void-base-url version) + "Void-darwin-x64-${version}.zip";
      compression = "zip";
      hash = "";
    };

    aarch64-darwin = {
      url = (void-base-url version) + "Void-darwin-arm64-${version}.zip";
      compression = "zip";
      hash = "";
    };
  }.${system};

  version = "1.99.30044";
  package-details = void-package-details version system;
in
  pkgs.stdenv.mkDerivation rec {
    inherit version;

    pname = "void";

    src = pkgs.fetchurl {
      url = package-details.url;
      hash = package-details.hash;
    };

    nativeBuildInputs = [
      pkgs.autoPatchelfHook
    ];

    buildInputs = with pkgs; [
      libgcc

      dbus
      at-spi2-atk

      nss
      glib
      cups

      gtk3

      mesa
      # libgbm

      alsa-lib

      xorg.libxcb
      xorg.libX11
      xorg.libXext
      xorg.libxkbfile
    ];

    sourceRoot = ".";

    installPhase = ''
      runHook preInstall

      cp -r . $out/

      # install -m755 -D bin/void $out/bin/void

      runHook postInstall
    '';

    meta = with pkgs.lib; {
      description = "Void Editor which is an open-source, ai powered editor replacing cursor";
      homepage = "https://voideditor.com/";
      platforms = platforms.linux ++ platforms.darwin;
    };
  }