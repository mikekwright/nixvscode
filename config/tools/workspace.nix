{ funcs, ... }:

{
  name = "workspace";

  keybindings = [
    (funcs.editorVimBinding {
      key = ", w o";
      command = "workbench.action.files.openFolder";
    })

    (funcs.editorVimBinding {
      key = ", w r";
      command = "workbench.action.openRecent";
    })

    (funcs.editorVimBinding {
      key = ", w e";
      command = "workbench.action.openWorkspaceSettingsFile";
    })

    (funcs.editorVimBinding {
      key = ", w w";
      command = "workbench.action.openWorkspace";
    })
  ];
}