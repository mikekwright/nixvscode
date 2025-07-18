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

  # I should look at adjusting this configuration to work with the vim solution and its
  #   called out modes instead of manually added keybindings
  # "vim.insertModeKeyBindings"/"vim.normalModeKeyBindings"/"vim.visualModeKeyBindings"/"vim.operatorPendingModeKeyBindings"
  #
  # https://github.com/VSCodeVim/Vim#key-remapping
  #
  keybindings = [
  ];
}
