{ pkgs, extra-pkgs, ... }:

{
  vscodeExtensions = with extra-pkgs.extensions; [
    # Dlang main extension
    #    https://marketplace.visualstudio.com/items?itemName=webfreak.code-d
    vscode-marketplace.webfreak.code-d

    # A testing UI solution that is a dependency of code-d (hopefully the code-d
    #    will be updated to use the vscode built-in apis added in version 1.59)
    #    https://marketplace.visualstudio.com/items?itemName=hbenl.vscode-test-explorer
    vscode-marketplace.hbenl.vscode-test-explorer
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
