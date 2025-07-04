{ pkgs, ... }:

{
  imports = [
    ./theme
    ./tools
    ./lsp

    ./keymaps.nix
    ./greeter.nix
    ./avante.nix
  ];

  vscodeSettings = {};

  packages = with pkgs; [
    cloc
  ];

  vscodeExtensions = [];
} 