{ pkgs, extra-pkgs, ... }:

{
  vscodeExtensions = with extra-pkgs.extensions; [
    # This is a rest-client for running and reviewing requests in vscode
    #    https://marketplace.visualstudio.com/items?itemName=humao.rest-client
    vscode-marketplace.humao.rest-client
  ];
}
