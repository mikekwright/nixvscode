{pkgs, ...}:

{
  vscodeExtensions = with pkgs; [
    # This is the microsoft official plugin for typescript
    #    https://marketplace.visualstudio.com/items?itemName=ms-vscode.vscode-typescript-next#review-details
    #  This is only for testing new features, stable is built-in to vscode
    #vscode-marketplace.ms-vscode.vscode-typescript-next
  ];

  packages = with pkgs; [
    eslint_d

    typescript
    nodejs_22 # This is required for typescript
  ];


}
