{ pkgs, extra-pkgs, funcs, options, ... }:

{
  vscodeExtensions = with extra-pkgs.extensions; options.extensions "lsp.golang" [
    # This is the official go plugin for vscode
    #   https://marketplace.visualstudio.com/items?itemName=golang.Go
    (funcs.safePkg vscode-marketplace [ "golang" "go" ])
  ];

  packages = with pkgs; options.packages "lsp.golang" [
    # Install the language
    go

    # Install tools to help
    gotools

    # This is the language server for Go
    gopls
  ];

  vscodeSettings = {
    "[go]" = {
      "editor.tabSize" = 2;
      "editor.rulers" = [
        100
        120
      ];
      "editor.formatOnType" = true;
    };

    "go.toolsManagement.autoUpdate" = true;
    "go.formatTool" = "gofmt";
    "go.useLanguageServer" = true;

    "go.enableCodeLens" = {
      "runtest" = true;
    };
  };

  keybindings = [
    (funcs.languageVimBinding {
      lang = "go";
      key = ", r b";
      command = "go.build.workspace";
    })
  ];
}
