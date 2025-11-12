{ lib, ... }:

lib.makeIncludes
{
  complete = [
    "lsp.nix"
    "lsp.python"

    "tools.aichat"
    "tools.dbcode"
    "tools.gitlens"
    "tools.kubernetes"
    "tools.rest-client"
    "toosl.sqlite"
  ];

  extensions = [
    "lsp.golang"
    "lsp.lua"
    "lsp.cplusplus"
    "lsp.ruby"
    "lsp.typescript"
    "tools.platformio"

    "tools.nginx"
  ];
}
