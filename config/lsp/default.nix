{ pkgs, ... }: 

{
  name = "lsp";

  imports = [
    ./golang.nix
    ./lua.nix
    ./haskell.nix
    ./nix.nix
    ./python.nix
    ./rust.nix
  ];

  packages = with pkgs; [
    markdownlint-cli
    statix

    dioxus-cli # Provides dx for dxfmt
  ];
}

#
# Extra notes
#
#  VSCode has builtin support for markdown
#     https://code.visualstudio.com/docs/languages/markdown
#
