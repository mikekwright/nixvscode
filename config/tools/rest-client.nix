{ extra-pkgs, funcs, ... }:

{
  vscodeExtensions = with extra-pkgs.extensions; [
    # This is a rest-client for running and reviewing requests in vscode
    #    https://marketplace.visualstudio.com/items?itemName=humao.rest-client
    (funcs.safePkg vscode-marketplace [ "humao" "rest-client" ])
  ];

  vscodeSettings = {
    # Disable telemetry for the rest-client extension
    "rest-client.enableTelemetry" = false;
  };
}
