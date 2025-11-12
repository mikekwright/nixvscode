{ funcs, ... }:

{
  keybindings = with funcs; [
    #
    # File Explorer
    #
    (vimKey {
      key = ", e e";
      command = "workbench.action.toggleSidebarVisibility";
      when = [
        when.in-explorer
      ];
    })

    (editorVimBinding {
      key = ", e c";
      command = "workbench.action.closeSidebar";
      when = [
        when.sidebar-visible
      ];
    })

    (editorVimBinding {
      key = ", e e";
      command = "workbench.files.action.focusFilesExplorer";
    })

    {
      key = "m a";
      command = "explorer.newFolder";
      when = "filesExplorerFocus && !inputFocus";
    }
    {
      key = "f";
      command = "explorer.newFolder";
      when = "filesExplorerFocus && !inputFocus";
    }
    {
      key = "n";
      command = "explorer.newFile";
      when = "filesExplorerFocus && !inputFocus";
    }
    {
      key = "a";
      command = "explorer.newFile";
      when = "filesExplorerFocus && !inputFocus";
    }
    {
      key = "m n";
      command = "explorer.newFile";
      when = "filesExplorerFocus && !inputFocus";
    }
    {
      key = "m d";
      command = "deleteFile";
      when = "filesExplorerFocus && !inputFocus";
    }
    {
      key = "d";
      command = "deleteFile";
      when = "filesExplorerFocus && !inputFocus";
    }
    {
      key = "r";
      command = "renameFile";
      when = "filesExplorerFocus && !inputFocus";
    }
    {
      key = "x";
      command = "filesExplorer.cut";
      when = "filesExplorerFocus && !inputFocus";
    }
    {
      key = "c";
      command = "filesExplorer.copy";
      when = "filesExplorerFocus && !inputFocus";
    }
    {
      key = "v";
      command = "filesExplorer.paste";
      when = "filesExplorerFocus && !inputFocus";
    }
    {
      key = "p";
      command = "filesExplorer.paste";
      when = "filesExplorerFocus && !inputFocus";
    }
    {
      key = "m o";
      command = "explorer.openToSide";
      when = "filesExplorerFocus && !inputFocus";
    }
    {
      key = "o";
      command = "explorer.openToSide";
      when = "filesExplorerFocus && !inputFocus";
    }
  ];
}
