{ lib, ... }:

lib.makeIncludes
{
  complete = [
    "lsp.nix"
    "lsp.typescript"

    "tools.aichat"
    "tools.dbcode"
    "tools.gitlens"
    "tools.kubernetes"
    "tools.rest-client"
    "toosl.sqlite"
  ];

  extensions = [
    "tools.nginx"
  ];
}
