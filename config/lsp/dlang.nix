{ pkgs, extra-pkgs, ... }:

{
  vscodeExtensions = with extra-pkgs.extensions; [
    # Dlang main extension
    #    https://marketplace.visualstudio.com/items?itemName=webfreak.code-d
    vscode-marketplace.webfreak.code-d
  ];

  packages = with pkgs; [
    dmd
    # This is the dlang package manager
    dub
  ];

  vscodeSettings = {
    "[dlang]" = {
      "editor.tabSize" = 2;
      "editor.rulers" = [ 100 120 ];
      "outline.showTypeParameters" = true;
    };
  };
}
