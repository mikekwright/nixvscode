{ pkgs, extra-pkgs, ... }:

{
  vscodeExtensions = with extra-pkgs.extensions; [
    # This is the official C++ plugin for vscode
    #    https://marketplace.visualstudio.com/items?itemName=ms-vscode.cpptools
    vscode-marketplace.ms-vscode.cpptools

    # This has a number of useful extensions for C++
    #    https://marketplace.visualstudio.com/items?itemName=ms-vscode.cpptools-extension-pack
    vscode-marketplace.ms-vscode.cpptools-extension-pack

    # This is the CMake Tools extension for VSCode
    #    https://marketplace.visualstudio.com/items?itemName=ms-vscode.cmake-tools
    vscode-marketplace.ms-vscode.cmake-tools
  ];

  packages = with pkgs; [
    clang-tools
    cmake
  ];

  vscodeSettings = {
    "[cpp]" = {
      "editor.tabSize" = 2;
      "editor.rulers" = [ 100 120 ];
      "outline.showTypeParameters" = true;
    };
  };
}
