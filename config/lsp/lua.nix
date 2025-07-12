{ pkgs, extra-pkgs, funcs, ... }:

{
  vscodeExtensions = with extra-pkgs.extensions; [
    # This is the lua server (coded in lua)
    #   https://marketplace.visualstudio.com/items?itemName=sumneko.lua
    (funcs.safePkg vscode-marketplace [ "sumneko" "lua" ])
  ];

  vscodeSettings = {
    "[lua]" = {
      "editor.rulers" = [
          100
          120
        ];
      "editor.tabSize" = 2;
      "outline.showTypeParameters" = true;
    };
  };

  packages = with pkgs; [
    lua
  ];
}
