{ pkgs, ... }:

{
  vscodeExtensions = with pkgs; [
    # This is the official python extension
    #    https://marketplace.visualstudio.com/items?itemName=ms-python.python
    vscode-marketplace.ms-python.python

    # This is the official plugin for debugging python
    #    https://marketplace.visualstudio.com/items?itemName=ms-python.debugpy
    vscode-marketplace.ms-python.debugpy

    # This is the python language server
    #    https://marketplace.visualstudio.com/items?itemName=ms-python.vscode-pylance
    vscode-marketplace.ms-python.vscode-pylance
  ];

  packages = with pkgs; [
    pyright
  ];

  vscodeSettings = {
    "[python]" = {
      "editor.tabSize" = 4;
      "editor.rulers" = [
        100
        120
      ];
      "editor.formatOnType" = true;
    };

    "python.languageServer" = "Pylance";
    "python.analysis.typeCheckingMode" = "standard";
    "python.analysis.inlayHints.functionReturnTypes" = true;
    "python.analysis.inlayHints.variableTypes" = true;
    "python.jediEnabled" = false;
  };
}
