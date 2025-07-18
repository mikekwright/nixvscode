{ funcs, ... }:

{
  keybindings = [
    {
      # Remove the default action to close the active editor
      key = "ctrl+w";
      command = "-workbench.action.closeActiveEditor";
    }

    (funcs.editorVimBinding {
      command = "workbench.action.moveEditorToRightGroup";
      key = "ctrl+w ctrl+l";
    })
    (funcs.editorVimBinding {
      command = "workbench.action.moveEditorToLeftGroup";
      key = "ctrl+w ctrl+h";
    })
    (funcs.editorVimBinding {
      command = "workbench.action.moveEditorToBelowGroup";
      key = "ctrl+w ctrl+j";
    })
    (funcs.editorVimBinding {
      command = "workbench.action.moveEditorToAboveGroup";
      key = "ctrl+w ctrl+k";
    })
    (funcs.editorVimBinding {
      command = "workbench.action.splitEditorRight";
      key = "ctrl+w ctrl+shift+l";
    })
    (funcs.editorVimBinding {
      command = "workbench.action.splitEditorDown";
      key = "ctrl+w ctrl+shift+j";
    })
    (funcs.editorVimBinding {
      command = "workbench.action.splitEditorLeft";
      key = "ctrl+w ctrl+shift+h";
    })
    (funcs.editorVimBinding {
      command = "workbench.action.splitEditorUp";
      key = "ctrl+w ctrl+shift+k";
    })
    (funcs.editorVimBinding {
      command = "workbench.action.focusRightGroupWithoutWrap";
      key = ", w l";
    })
    (funcs.editorVimBinding {
      command = "workbench.action.focusLeftGroupWithoutWrap";
      key = ", w h";
    })
    (funcs.editorVimBinding {
      command = "workbench.action.nextEditorInGroup";
      key = ", w l";
    })
    (funcs.editorVimBinding {
      command = "workbench.action.previousEditorInGroup";
      key = ", w h";
    })


#   # Not these ones
# {
#     command = "workbench.action.previousEditor",
#     key = ", w h",
#     when = "editorTextFocus && vim.active && vim.mode != 'Insert'"
#   },
#   {
#     command = "workbench.action.nextEditor",
#     key = ", w l",
#     when = "editorTextFocus && vim.active && vim.mode != 'Insert'"
#   },
  ];
}
