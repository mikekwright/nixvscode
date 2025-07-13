{ pkgs, extra-pkgs, funcs, system, ... }:

{
  vscodeExtensions = with extra-pkgs.extensions; [
    # This has a number of useful extensions for C++
    #    https://marketplace.visualstudio.com/items?itemName=ms-vscode.cpptools-extension-pack
    (funcs.safePkg vscode-marketplace [ "ms-vscode" "cpptools-extension-pack" ])

    # This is the CMake Tools extension for VSCode
    #    https://marketplace.visualstudio.com/items?itemName=ms-vscode.cmake-tools
    (funcs.safePkg vscode-marketplace [ "ms-vscode" "cmake-tools" ])
  ] ++ (
    if (builtins.elem system pkgs.lib.platforms.linux) then
      [
        # This is the official C++ plugin for vscode
        #    https://marketplace.visualstudio.com/items?itemName=ms-vscode.cpptools
        (funcs.safePkg vscode-marketplace [ "ms-vscode" "cpptools" ])
      ]
    else
      []
  );

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
