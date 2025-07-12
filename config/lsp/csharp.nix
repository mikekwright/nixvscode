{ pkgs, extra-pkgs, ... }:

{
  vscodeExtensions = with extra-pkgs.extensions; [
    # C# Dev Kit, needed for C# development in VSCode
    #    https://marketplace.visualstudio.com/items?itemName=ms-dotnettools.csdevkit
    vscode-marketplace.ms-dotnettools.csdevkit

    # This is the language extension for C# in VSCode
    #    https://marketplace.visualstudio.com/items?itemName=ms-dotnettools.csharp
    vscode-marketplace.ms-dotnettools.csharp

    # This is the .NET Runtime extension for VSCode
    #    https://marketplace.visualstudio.com/items?itemName=ms-dotnettools.vscode-dotnet-runtime
    # vscode-marketplace.ms-dotnettools.vscode-dotnet-runtime
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
  };

  packages = with pkgs; [
    dotnet-sdk_9
    dotnet-aspnetcore_9
  ];
}
