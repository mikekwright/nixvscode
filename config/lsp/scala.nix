{ pkgs, extra-pkgs, ... }:


{
  vscodeExtensions = with extra-pkgs.extensions; [
    # This is the official scala extension
    #    https://marketplace.visualstudio.com/items?itemName=scala-lang.scala
    vscode-marketplace.scala-lang.scala
  ];

  packages = with pkgs; [
    scala
  ];
}
