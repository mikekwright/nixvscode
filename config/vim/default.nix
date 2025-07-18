{ pkgs, funcs, ... }:
# Module that contains most of the vim related items that we will work through
#  This is the general configuration but not everything or every combination of
#  keyboard shortcut

{
  imports = [
    ./search.nix
    ./rundebug.nix
    ./bookmarks.nix
    ./code-inspection.nix
    ./file-management.nix
    ./window-management.nix
  ];

  vscodeExtensions = with pkgs; [
    # Official vim plugin for vscode
    (funcs.safePkg vscode-marketplace [ "vscodevim" "vim" ])
  ];

  vscodeSettings = {
    "vim.useSystemClipboard" = true;
    "vim.leader" = ",";
    "vim.disableExtension" = false;
  };

  keybindings = [
  ];
}
