{ pkgs, funcs, ... }:

{
  vscodeExtensions = with pkgs; [
    # This is currently my favorite, it is a nice dark looking theme
    #
    (funcs.safePkg vscode-marketplace [ "github" "github-vscode-theme" ])

    # These are file-icons that are nice to have in the explorer
    #    https://marketplace.visualstudio.com/items?itemName=file-icons.file-icons
    (funcs.safePkg vscode-marketplace [ "file-icons" "file-icons" ])

    # This is a nice dark-like theme for VSCode
    #   https://marketplace.visualstudio.com/items?itemName=dracula-theme.theme-dracula
    (funcs.safePkg vscode-marketplace [ "dracula-theme" "theme-dracula" ])
  ];

  vscodeSettings = {
    "workbench.colorTheme" = "GitHub Dark Default";
    # "workbench.colorTheme" = "Dracula Theme";

    "workbench.iconTheme" = "file-icons";
  };

  # "vscode-pets.theme" = "forest";
}