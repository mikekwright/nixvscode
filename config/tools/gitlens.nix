{ pkgs, ... }:

{
  vscodeExtensions = with pkgs; [
    # This extension gives you great insights into git details, like quick blames and other useful information
    #    https://marketplace.visualstudio.com/items?itemName=eamodio.gitlens
    vscode-marketplace.eamodio.gitlens
  ];
}
