{ extra-pkgs, funcs, ... }:

{
  vscodeExtensions = with extra-pkgs.extensions;  [
    # Personal extension for just copying terminal output to the editor window
    #    https://marketplace.visualstudio.com/items?itemName=devwright.vscode-terminal-capture
    (funcs.safePkg vscode-marketplace [ "devwright" "vscode-terminal-capture" ])
  ];

  vscodeSettings = {
    "terminalCapture.enable" = true;
  };

  keybindings = with funcs; [
    (editorVimBinding {
      key = ", t t";
      command = "workbench.action.terminal.toggleTerminal";
    })

    (vimKey {
      key = "ctrl+w c";
      command = "extension.terminalCapture.runCapture";
      when = [
        when.in-terminal
      ];
    })

    (vimKey {
      key = "ctrl+h";
      command = "workbench.action.terminal.focusPreviousPane";
      when = [
        when.in-terminal
      ];
    })

    (vimKey {
      key = "ctrl+j";
      command = "workbench.action.focusActiveEditorGroup";
      when = [
        when.in-terminal
      ];
    })

    (vimKey {
      key = "ctrl+k";
      command = "workbench.action.focusActiveEditorGroup";
      when = [
        when.in-terminal
      ];
    })

    (vimKey {
      key = "ctrl+l";
      command = "workbench.action.terminal.focusNextPane";
      when = [
        when.in-terminal
      ];
    })

    (vimKey {
      key = "ctrl+t";
      command = "workbench.action.terminal.toggleTerminal";
      # In all context, so no when clause
    })

    (vimKey {
      key = "ctrl+q";
      command = "workbench.action.terminal.toggleTerminal";
      when = [
        when.in-terminal
      ];
    })

    {
      key = "ctrl+w k";
      command = "workbench.action.navigateUp";
      when = "terminalFocus";
    }

    # TODO: At some point it would be nice to have terminalEditor commands in place
    #   I just have to think about how I would use them
    #  when = terminalEditorFocus   terminalFocusInAny
    #  command = "workbench.action.terminal.moveToEditor"
    #  command = "workbench.action.terminal.killViewOrEditor"
    #  command = ...
  ];
}
