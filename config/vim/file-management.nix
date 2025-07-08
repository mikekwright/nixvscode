{ funcs, ... }:

{
  keybindings = with funcs; [
    #
    # Vim = File and Editor Management
    #
    (vimKey {
      key = ", e n";
      command = "workbench.action.files.newUntitledFile";
      when = [ when.vim-editor ];
    })

    (vimKey {
      key = ", e s";
      command = "workbench.action.files.save";
      when = [ when.vim-editor ];
    })

    (vimKey {
      key = ", e u";
      command = "workbench.action.files.revert";
      when = [ when.vim-editor ];
    })

    (vimKey {
      key = ", e d";
      command = "workbench.action.closeActiveEditor";
      when = [ when.vim-editor ];
    })

    (vimKey {
      key = ", e c";
      command = "workbench.action.closeSidebar";
      when = [ when.vim-editor ];
    })
  ];
}
