{ pkgs, extra-pkgs, ... }:

{
  vscodeExtensions = with extra-pkgs.extensions; [
    # This is the ocaml extension for vscode
    #    https://marketplace.visualstudio.com/items?itemName=ocamllabs.ocaml-platform
    vscode-marketplace.ocamllabs.ocaml-platform
  ];

  packages = with pkgs; [
    ocaml

    ocamlPackages.ocaml-lsp
  ];

  vscodeSettings = {
    "[ocaml]" = {
      "editor.tabSize" = 2;
      "editor.rulers" = [ 100 120 ];
      "outline.showTypeParameters" = true;
    };
  };

}
