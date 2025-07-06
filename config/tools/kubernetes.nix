{ pkgs, extra-pkgs, ... }:

{
  vscodeExtensions = with extra-pkgs.extensions; [
    # This is microsofts k8s bridge solution
    #    https://marketplace.visualstudio.com/items?itemName=ms-kubernetes-tools.vscode-kubernetes-tools
    vscode-marketplace.ms-kubernetes-tools.vscode-kubernetes-tools
  ];

  packages = with pkgs; [
    # This is another container tool that can be used
    buildah

    # Using helm management as well
    helm

    # Using kubectl operations
    kubectl
  ];
}
