{ pkgs, extra-pkgs, funcs, options, ... }:

{
  vscodeExtensions = with extra-pkgs.extensions; options.extensions "lsp.csharp" [
    # C# Dev Kit, needed for C# development in VSCode
    #    https://marketplace.visualstudio.com/items?itemName=ms-dotnettools.csdevkit
    (funcs.safePkg vscode-marketplace [ "ms-dotnettools" "csdevkit" ])

    # This is the language extension for C# in VSCode
    #    https://marketplace.visualstudio.com/items?itemName=ms-dotnettools.csharp
    (funcs.safePkg vscode-marketplace [ "ms-dotnettools" "csharp" ])

    # This is the .NET Runtime extension for VSCode
    #    https://marketplace.visualstudio.com/items?itemName=ms-dotnettools.vscode-dotnet-runtime
    # (pkgs.lib.attrsets.attrByPath  [ "ms-dotnettools" "vscode-dotnet-runtime" ] null vscode-marketplace)
    (funcs.safePkg vscode-marketplace [ "ms-dotnettools" "vscode-dotnet-runtime" ])
  ];

  vscodeSettings = {
    "[csharp]" = {
      "editor.tabSize" = 2;
      "editor.rulers" = [ 100 120 ];
      "outline.showTypeParameters" = true;
    };

    # This is the C# language server configuration for VSCode
    "omnisharp.useModernNet" = true;
    "omnisharp.enableEditorConfigSupport" = true;
    "omnisharp.autoStart" = true;

    "dotnetAcquisitionExtension.enableTelemetry" = false;
  };

  packages = with pkgs; options.packages "lsp.csharp" [
    dotnet-sdk_9
    dotnet-aspnetcore_9
  ];
}
