{ debug, pkgs, ... }:

{
  name = "tools";

  imports = [
    ./aichat.nix
    ./dbcode.nix
    ./file-explorer.nix
    ./gitlens.nix

    ./kubernetes.nix
    ./nginx.nix
    ./ollama.nix

    ./rest-client.nix
    ./sqlite.nix
    ./terminal.nix

    # This does not work
    # ./whichkey.nix
    ./workspace.nix
  ];

  packages = with pkgs; [
    lazygit
  ];
}
