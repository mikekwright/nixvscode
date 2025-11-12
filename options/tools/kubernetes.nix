{ pkgs, extra-pkgs, funcs, options, ... }:

{
  vscodeExtensions = with extra-pkgs.extensions; options.extensions "tools.kubernetes" [
    # This is microsofts k8s bridge solution
    #    https://marketplace.visualstudio.com/items?itemName=ms-kubernetes-tools.vscode-kubernetes-tools
    (funcs.safePkg vscode-marketplace [ "ms-kubernetes-tools" "vscode-kubernetes-tools" ])

    # This is the container extensions from microsoft
    #    https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers
    (funcs.safePkg vscode-marketplace [ "ms-vscode-remote" "remote-containers" ])

    # This is some other container tools from microsoft
    #    https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-containers
    (funcs.safePkg vscode-marketplace [ "ms-azuretools" "vscode-containers" ])

    # This is needed for the kubernetes extension to work
    #    https://marketplace.visualstudio.com/items?itemName=redhat.vscode-yaml
    (funcs.safePkg vscode-marketplace [ "redhat" "vscode-yaml" ])
  ];

  packages = with pkgs; options.packages "tools.kubernetes" [
    # This is another container tool that can be used
    buildah

    # Using kubectl operationjs
    kubectl
  ] ++ (
    if (builtins.elem system pkgs.lib.platforms.linux) then
      [ pkgs.helm ]
    else
      [ ]  # No helm for mac right now
  );

  vscodeSettings = {
    # Disable telemetry for redhat extensions
    "redhat.telemetry.enabled" = false;
  } //
    options.packages "tools.kubernetes" {
      # "vscode-kubernetes.helm-path" = "${pkgs.helm}/bin/helm";
      "vscode-kubernetes.kubectl-path" = "${pkgs.kubectl}/bin/kubectl";
    };
}
