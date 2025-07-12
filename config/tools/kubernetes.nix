{ pkgs, extra-pkgs, ... }:

{
  vscodeExtensions = with extra-pkgs.extensions; [
    # This is microsofts k8s bridge solution
    #    https://marketplace.visualstudio.com/items?itemName=ms-kubernetes-tools.vscode-kubernetes-tools
    vscode-marketplace.ms-kubernetes-tools.vscode-kubernetes-tools

    # This is the container extensions from microsoft
    #    https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers
    vscode-marketplace.ms-vscode-remote.remote-containers

    # This is some other container tools from microsoft
    #    https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-containers
    vscode-marketplace.ms-azuretools.vscode-containers
  ];

  packages = with pkgs; [
    # This is another container tool that can be used
    buildah

    # Using helm management as well
    helm

    # Using kubectl operations
    kubectl
  ];

  vscodeSettings = {
    "vscode-kubernetes.helm-path" = "${pkgs.helm}/bin/helm";
    "vscode-kubernetes.kubectl-path" = "${pkgs.kubectl}/bin/kubectl";
  };
}
