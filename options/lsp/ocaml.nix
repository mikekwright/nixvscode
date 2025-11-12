{ pkgs, extra-pkgs, funcs, options, ... }:

{
  vscodeExtensions = with extra-pkgs.extensions; options.extensions "lsp.ocaml" [
    # This is the ocaml extension for vscode
    #    https://marketplace.visualstudio.com/items?itemName=ocamllabs.ocaml-platform
    (funcs.safePkg vscode-marketplace [ "ocamllabs" "ocaml-platform" ])
  ];

  packages = with pkgs; options.packages "lsp.ocaml" [
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
