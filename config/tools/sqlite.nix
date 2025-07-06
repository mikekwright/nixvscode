{ extra-pkgs, ... }:

{
  vscodeExtensions = with extra-pkgs.extensions; [
    # Extension for opening sqlite files with a quick view into contents
    #   https://marketplace.visualstudio.com/items?itemName=qwtel.sqlite-viewer
    vscode-marketplace-release.qwtel.sqlite-viewer
  ];
}
