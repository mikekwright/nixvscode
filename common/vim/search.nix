{ funcs, ... }:

{
  keybindings = [
    #
    # Search and Find in Files
    #
    (funcs.editorVimBinding {
      key = ", f p";
      command = "workbench.action.showCommands";
    })

    (funcs.editorVimBinding {
      key = ", f f";
      command = "workbench.action.quickOpen";
    })

    (funcs.editorVimBinding {
      key = ", f g";
      command = "workbench.action.findInFiles";
    })

    {
      key = "ctrl+w j";
      command = "search.action.focusSearchList";
      when = "searchInputBoxFocus";
    }

    {
      key = "ctrl+w k";
      command = "workbench.action.findInFiles";
      when = "searchResultListFocused";
    }
  ];
}
