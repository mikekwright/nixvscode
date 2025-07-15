{ extra-pkgs, funcs, ... }:

{
  vscodeExtensions = with extra-pkgs.extensions; [
    # This extension gives you great insights into git details, like quick blames and other useful information
    #    https://marketplace.visualstudio.com/items?itemName=eamodio.gitlens
    (funcs.safePkg vscode-marketplace-release [ "eamodio" "gitlens" ])
  ];

  vscodeSettings = {
    # Disable telemetry for gitlens
    "gitlens.telemetry.enabled" = false;
  };
}
