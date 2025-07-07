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

    # This extension is how it converts to the vscode native testing api
    #    https://marketplace.visualstudio.com/items?itemName=ms-vscode.test-adapter-converter
    vscode-marketplace.ms-vscode.test-adapter-converter
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

    # This is the bridge so that the Test explorer uses vscode native solution
    "testExplorer.useNativeTesting" = true;
  };
}
