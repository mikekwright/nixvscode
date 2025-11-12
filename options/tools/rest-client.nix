{ extra-pkgs, funcs, options, ... }:

{
  vscodeExtensions = with extra-pkgs.extensions; options.extensions "tools.rest-client" [
    # This is a rest-client for running and reviewing requests in vscode
    #    https://marketplace.visualstudio.com/items?itemName=humao.rest-client
    (funcs.safePkg vscode-marketplace [ "humao" "rest-client" ])
  ];

  vscodeSettings = {
    # Disable telemetry for the rest-client extension
    "rest-client.enableTelemetry" = false;

    "rest-client.logLevel" = "info";  # "verbose", "warn", "info", "error"
    "rest-client.previewOption" = "full";  # "body", "exchange", "headers", "full"
  };
}
