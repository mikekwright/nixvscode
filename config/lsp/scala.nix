{ pkgs, extra-pkgs, funcs, ... }:

{
  vscodeExtensions = with extra-pkgs.extensions; [
    # This is the official scala extension
    #    https://marketplace.visualstudio.com/items?itemName=scala-lang.scala
    (funcs.safePkg vscode-marketplace [ "scala-lang" "scala" ])
  ];

  packages = with pkgs; [
    scala
  ];
}
