{ extra-pkgs, ... }:

{
  vscodeExtensions = with extra-pkgs.extensions; [
    # This extension gives you great insights into git details, like quick blames and other useful information
    #    https://marketplace.visualstudio.com/items?itemName=eamodio.gitlens
    vscode-marketplace-release.eamodio.gitlens
  ];
}
