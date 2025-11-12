{ pkgs, extra-pkgs, funcs, options, ... }:

{
  vscodeExtensions = with extra-pkgs.extensions; options.extensions "lsp.java" [
    # This is the oracle official java extension
    #    https://marketplace.visualstudio.com/items?itemName=Oracle.oracle-java
    #vscode-marketplace.oracle.oracle-java

    # This is the redhad java extension and has a lot more download (maybe better?)
    #    https://marketplace.visualstudio.com/items?itemName=redhat.java
    (funcs.safePkg vscode-marketplace [ "redhat" "java" ])
  ];

  packages = with pkgs; options.packages "lsp.java" [
    # This must be version 21 or greater
    jdk
  ];

  vscodeSettings = {
    "[java]" = {
      "editor.tabSize" = 2;
      "editor.rulers" = [ 100 120 ];
      "outline.showTypeParameters" = true;
    };
  };
}
