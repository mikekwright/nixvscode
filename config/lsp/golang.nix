{ pkgs, extra-pkgs, ... }:

{
  vscodeExtensions = with extra-pkgs.extensions; [
    # This is the official go plugin for vscode
    #   https://marketplace.visualstudio.com/items?itemName=golang.Go
    vscode-marketplace.golang.go
  ];

  packages = with pkgs; [
    # Install the language
    go

    # Install tools to help
    gotools

    # This is the language server for Go
    gopls
  ];

  vscodeSettings = {
    "[go]" = {
      "editor.tabsize" = 2;
      "editor.rulers" = [
        100
        120
      ];
      "editor.formatOnType" = true;
    };

    "go.toolsManagement.autoUpdate" = true;
  };
}
