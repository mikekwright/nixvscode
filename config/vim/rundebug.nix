{ funcs, ... }:

{
  keybindings = with funcs; [
    #
    # Vim = Run and Debug
    #
    (vimKey {
      key = ", r b";
      command = "editor.debug.action.toggleBreakpoint";
      when = [
        when.vim-editor
        when.can-debug
      ];
    })

    (vimKey {
      key = ", r r";
      command = "workbench.action.debug.run";
      when = [
        when.vim-editor
        when.can-debug
      ];
    })

    (vimKey {
      key = ", r a";
      command = "debug.addConfiguration";
      when = [
        when.vim-editor
        when.not-debug
      ];
    })

    (vimKey {
      key = ", r d";
      command = "workbench.action.debug.selectandstart";
      when = [
        when.vim-editor
        when.can-debug
        when.not-debug
      ];
    })

    (inDebugBinding {
      key = ", r s";
      command = "workbench.action.debug.stop";
    })

    (inDebugBinding {
      key = ", r r";
      command = "workbench.action.debug.continue";
    })

    (inDebugBinding {
      key = ", r c";
      command = "workbench.action.debug.continue";
    })

    (inDebugBinding {
      key = ", r d";
      command = "workbench.action.debug.start";
    })

    (inDebugBinding {
      key = ", r n";
      command = "workbench.action.debug.stepOver";
    })

    (inDebugBinding {
      key = ", r i";
      command = "workbench.action.debug.stepInto";
    })

    (inDebugBinding {
      key = ", r o";
      command = "workbench.action.debug.stepOut";
    })

    (inDebugBinding {
      key = ", r h";
      command = "editor.debug.action.showDebugHover";
    })

    (inDebugBinding {
      key = ", r t";
      command = "workbench.action.debug.toggleRepl";
    })
  ];
}
