{ pkgs, ... }:

{
  name = "lsp";

  imports = [
    # This is not currently working
    #./cobol.nix

    ./cplusplus.nix
    ./csharp.nix

    ./dart.nix
    ./dlang.nix
    ./erlang.nix
    ./golang.nix

    ./haskell.nix
    ./java.nix
    ./lua.nix
    ./nix.nix

    ./ocaml.nix
    ./python.nix
    ./ruby.nix
    ./rust.nix

    ./scala.nix
    ./shell.nix
    ./terraform.nix
    ./typescript.nix
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
