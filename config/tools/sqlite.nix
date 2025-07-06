{ pkgs, ... }:

{
  vscodeExtensions = with pkgs; [
    # Extension for opening sqlite files with a quick view into contents
    #   https://marketplace.visualstudio.com/items?itemName=qwtel.sqlite-viewer
    vscode-marketplace.qwtel.sqlite-viewer
  ];
}
