{ pkgs, ... }:
# Module that contains most of the vim related items that we will work through
#  This is the general configuration but not everything or every combination of
#  keyboard shortcut

{

  vscodeExtensions = with pkgs; [
    # Official vim plugin for vscode
    vscode-marketplace.vscodevim.vim
  ];

  vscodeSettings = {
    "vim.useSystemClipboard" = true;
    "vim.leader" = ",";
    "vim.disableExtension" = false;
  };


}
