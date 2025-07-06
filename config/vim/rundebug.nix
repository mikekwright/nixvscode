{ ... }:

let
  debugKeybinding = { key, command }: {
    inherit key command;
    when = "editorTextFocus && vim.active && vim.mode != 'Insert' && debuggersAvailable && debugState == 'inactive'";
  };
in
{
  keybindings = [
    #
    # Vim = Run and Debug
    #
    {
      key = ", r b";
      command = "editor.debug.action.toggleBreakpoint";
      when = "editorTextFocus && vim.active && vim.mode != 'Insert' && debuggersAvailable";
    }

    {
      key = ", r r";
      command = "workbench.action.debug.run";
      when = "editorTextFocus && vim.active && vim.mode != 'Insert' && debugState == 'inactive'";
    }

    (debugKeybinding {
      key = ", r d";
      command = "workbench.action.debug.selectandstart";
    })

    (debugKeybinding {
      key = ", r s";
      command = "workbench.action.debug.stop";
    })

    (debugKeybinding {
      key = ", r r";
      command = "workbench.action.debug.continue";
    })

    (debugKeybinding {
      key = ", r c";
      command = "workbench.action.debug.continue";
    })

    (debugKeybinding {
      key = ", r d";
      command = "workbench.action.debug.start";
    })

    (debugKeybinding {
      key = ", r n";
      command = "workbench.action.debug.stepOver";
    })

    (debugKeybinding {
      key = ", r i";
      command = "workbench.action.debug.stepInto";
    })

    (debugKeybinding {
      key = ", r o";
      command = "workbench.action.debug.stepOut";
    })

    (debugKeybinding {
      key = ", r h";
      command = "editor.debug.action.showDebugHover";
    })

    (debugKeybinding {
      key = ", r t";
      command = "workbench.action.debug.toggleRepl";
    })
  ];
}
