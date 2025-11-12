{ lib, ... }:

lib.makeIncludes
{
  extensions = [
    "lsp.cobol"
    "lsp.cplusplus"
    "lsp.csharp"
    "lsp.dart"
    "lsp.dlang"
    "lsp.erlang"
    "lsp.golang"
    "lsp.haskell"
    "lsp.java"
    "lsp.lua"
    "lsp.nix"
    "lsp.ocaml"
    "lsp.python"
    "lsp.ruby"
    "lsp.rust"
    "lsp.scala"
    "lsp.terraform"
    "lsp.typescript"
    "lsp.zig"

    "tools.aichat"
    "tools.dbcode"
    "tools.gitlens"
    "tools.kubernetes"
    "tools.nginx"
    "tools.platformio"
    "tools.rest-client"
    "toosl.sqlite"
  ];
}
