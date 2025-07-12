{ pkgs, extra-pkgs, ... }:

{
  vscodeExtensions = with extra-pkgs.extensions; [
    # This is the extension for syntax support with fish
    #    https://marketplace.visualstudio.com/items?itemName=bmalehorn.vscode-fish
    vscode-marketplace.bmalehorn.vscode-fish


    # This is a bash solution
    #    https://marketplace.visualstudio.com/items?itemName=mads-hartmann.bash-ide-vscode
    vscode-marketplace.mads-hartmann.bash-ide-vscode
  ];
}
