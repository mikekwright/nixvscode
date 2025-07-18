{ funcs, ... }:

{
  keybindings = [
    #
    # Vim = File and Editor Management
    #
    (funcs.editorVimBinding{
      key = ", e n";
      command = "workbench.action.files.newUntitledFile";
    })

    (funcs.editorVimBinding {
      key = ", e s";
      command = "workbench.action.files.save";
    })

    (funcs.editorVimBinding {
      key = ", e u";
      command = "workbench.action.files.revert";
    })

    (funcs.editorVimBinding {
      key = ", e d";
      command = "workbench.action.closeActiveEditor";
    })

    (funcs.editorVimBinding {
      key = ", e c";
      command = "workbench.action.closeSidebar";
    })
  ];
}
