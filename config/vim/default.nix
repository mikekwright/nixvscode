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

  keybindings = with funcs; [
    #
    # Vim = General navigation commands
    #
    {
      key = ", w h";
      command = "workbench.action.previousEditor";
      when = "editorTextFocus && vim.active && vim.mode != 'Insert'";
    }
    {
      key = ", w l";
      command = "workbench.action.nextEditor";
      when = "editorTextFocus && vim.active && vim.mode != 'Insert'";
    }
    {
      key = ", t t";
      command = "workbench.action.terminal.toggleTerminal";
      when = "editorTextFocus && vim.active && vim.mode != 'Insert'";
    }
    {
      key = ", e e";
      command = "workbench.action.toggleSidebarVisibility";
      when = "filesExplorerFocus";
    }
    {
      key = ", e c";
      command = "workbench.action.closeSidebar";
      when = "sideBarVisible && editorTextFocus && vim.active && vim.mode != 'Insert'";
    }
    # This is a problem as , won't work in search with this enabled
    # {
    #   key = ", e c";
    #   command = "workbench.action.closeSidebar";
    #   when = "sideBarVisible && sideBarFocus";
    # }
    {
      key = ", e e";
      command = "workbench.files.action.focusFilesExplorer";
      when = "editorTextFocus && vim.active && vim.mode != 'Insert'";
    }
    {
      key = ", g b";
      command = "workbench.action.navigateBack";
      when = "editorTextFocus && vim.active && vim.mode != 'Insert'";
    }
    {
      key = ", g f";
      command = "workbench.action.navigateForward";
      when = "editorTextFocus && vim.active && vim.mode != 'Insert'";
    }
    {
      key = ", g t";
      command = "workbench.action.gotoSymbol";
      when = "editorTextFocus && vim.active && vim.mode != 'Insert' && !editorReadonly";
    }
    {
      key = ", g h";
      command = "editor.action.quickFix";
      when = "editorTextFocus && vim.active && vim.mode != 'Insert' && !editorReadonly";
    }
  ];
}
