{ extra-pkgs, funcs, options, ... }:

{
  vscodeExtensions = with extra-pkgs.extensions; options.extensions "tools.dbcode" [
    # This is a nice tool for really working with databases, it is not free for full use, so pickup a perpetual license
    #   https://marketplace.visualstudio.com/items?itemName=DBCode.dbcode
    (funcs.safePkg vscode-marketplace [ "dbcode" "dbcode" ])
  ];
}
