{ debug, pkgs, ... }:

{
  name = "tools";

  imports = [
    ./aichat.nix
    #./sqlite.nix
    ./dbcode.nix
    ./gitlens.nix
    ./kubernetes.nix
    ./rest-client.nix
    ./nginx.nix

    # This does not work
    # ./whichkey.nix
  ];

  packages = with pkgs; [
    lazygit
  ];
}

