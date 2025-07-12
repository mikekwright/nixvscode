{ pkgs, extra-pkgs, funcs, ... }:

{
  name = "zig";

  vscodeExtensions = with extra-pkgs.extensions; [
    # This is the official Zig extension for VSCode
    #    https://marketplace.visualstudio.com/items?itemName=ziglang.vscode-zig
    (funcs.safePkg vscode-marketplace [ "ziglang" "vscode-zig" ])

    # This extension provides support for running/debugging zig
    #    https://marketplace.visualstudio.com/items?itemName=ianic.zig-language-extras
    (funcs.safePkg vscode-marketplace [ "ianic" "zig-language-extras" ])

    # TODO: This fails (July 6th, 2025) so removing this and the zig extra that requires
    #   it
    # Common debug extensions required for debugging Zig (extras)
    #    https://marketplace.visualstudio.com/items?itemName=vadimcn.vscode-lldb
    # (funcs.safePkg vscode-marketplace [ "vadimcn" "vscode-lldb" ])
  ] ++ (with pkgs; [
    # This is the debug tool needed for rust (lldb) on linux/mac
    #  (NOTE this has to be on stable, others are broken)
    #    https://marketplace.visualstudio.com/items?itemName=vadimcn.vscode-lldb
    (funcs.safePkg vscode-extensions [ "vadimcn" "vscode-lldb" ])
  ]);

  packages = with pkgs; [
    # Zig language server and tools
    zls
    zig

    # The debugger needed for zig (and maybe others)
    lldb
  ];

  vscodeSettings = {
    "[zig]" = {
      "editor.defaultFormatter" = "ziglang.vscode-zig";
      "editor.formatOnSave" = true;
      "editor.tabSize" = 2;
      "editor.rulers" = [ 100 120 ];
    };

    "zig.zls.enabled" = "on";
    "zig.path" = "${pkgs.zig}/bin/zig";
    "zig.zls.path" = "${pkgs.zls}/bin/zls";
    "zig.formattingProvider" = "zls";
    "zig.zls.enableBuildOnSave" = true;
    "zig.buildOnSave" = true;
  };
}
