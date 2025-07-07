{ pkgs, extra-pkgs, ... }:

{
  name = "zig";

  vscodeExtensions = with extra-pkgs.extensions; [
    # This is the official Zig extension for VSCode
    #    https://marketplace.visualstudio.com/items?itemName=ziglang.vscode-zig
    vscode-marketplace.ziglang.vscode-zig
  ];

  packages = with pkgs; [
    # Zig language server and tools
    zls

    zig
  ];

  vscodeSettings = {
    "zig.zls.enabled" = "on";
    "zig.path" = "${pkgs.zig}/bin/zig";
    "zig.zls.path" = "${pkgs.zls}/bin/zls";
    "zig.formattingProvider" = "zls";
    "zig.zls.enableBuildOnSave" = true;
    "zig.buildOnSave" = true;
  };
}