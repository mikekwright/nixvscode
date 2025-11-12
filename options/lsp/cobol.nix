{ pkgs, extra-pkgs, options, ... }:

{
  vscodeExtensions = with extra-pkgs.extensions; options.extensions "lsp.cobol" [
    # This is the cobol language extension
    #    https://marketplace.visualstudio.com/items?itemName=bitlang.cobol
    vscode-marketplace.bitlang.cobol
  ];

  packages = with pkgs; options.packages "lsp.cobol" [
    gnucobol
  ];

  vscodeSettings = {
    "[cobol]" = {
      "editor.tabSize" = 2;
      "editor.rulers" = [ 80 120 ];
      "outline.showTypeParameters" = true;
    };
  };
} 
