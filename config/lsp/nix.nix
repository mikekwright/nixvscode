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
    #nixd
    # This is included to enable the
    nixfmt
  ];
}
