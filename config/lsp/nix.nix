{ pkgs, ... }:

{
  vscodeExtensions = with pkgs; [
    # This is a selector for enabling a flake in an env
    #   https://marketplace.visualstudio.com/items?itemName=arrterian.nix-env-selector
    vscode-marketplace.arrterian.nix-env-selector

    # This is the extension with syntax highlighting for nix
    #   https://marketplace.visualstudio.com/items?itemName=jnoortheen.nix-ide
    vscode-marketplace.jnoortheen.nix-ide
  ];

  packages = with pkgs; [
    nixd

    # This is included to enable the
    nixfmt
  ];

  vscodeSettings = {
    "[nix]" = {
      "editor.tabSize" = 2;
      "editor.rulers" = [ 80 120 ];
      "editor.formatOnType" = true;
    };

    "nix.enableLanguageServer" = true;
    "nix.serverPath" = "${pkgs.nixd}/bin/nixd";
    "nix.serverSettings" = {
      # Check https://github.com/nix-community/nixd/blob/main/nixd/docs/configuration.md for all nixd config
      "nixd" = {
        "formatting" = {
          "command" = ["${pkgs.nixfmt}/bin/nixfmt"];
        };
      };
    };
  };
}
