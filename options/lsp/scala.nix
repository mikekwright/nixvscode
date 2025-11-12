{ pkgs, extra-pkgs, funcs, options, ... }:

{
  vscodeExtensions = with extra-pkgs.extensions; options.extensions "lsp.scala" [
    # This is the official scala extension
    #    https://marketplace.visualstudio.com/items?itemName=scala-lang.scala
    (funcs.safePkg vscode-marketplace [ "scala-lang" "scala" ])
  ];

  packages = with pkgs; options.packages "lsp.scala" [
    scala
  ];
}
