{ funcs, ... }:

{
  name = "workspace";

  keybindings = [
    (funcs.editorVimBinding {
      key = ", w e";
      command = "workbench.action.openWorkspaceSettingsFile";
    })

    (funcs.editorVimBinding {
      key = ", w s";
      command = "workbench.action.saveWorkspaceAs";
    })

    (funcs.editorVimBinding {
      key = ", w w";
      command = "workbench.action.openWorkspace";
    })
  ];
}