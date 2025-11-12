{ debug, pkgs, ... }:

{
  name = "tools";

  imports = [
    ./aichat.nix
    ./dbcode.nix
    ./gitlens.nix

    ./kubernetes.nix
    ./nginx.nix
    ./ollama.nix

    ./rest-client.nix
    ./sqlite.nix

    ./platformio.nix
  ];

  packages = with pkgs; [
    # lazygit
  ];
}
