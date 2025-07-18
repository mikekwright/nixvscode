{ extra-pkgs, funcs, ... }:

{
  vscodeExtensions = with extra-pkgs.extensions; [
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
        when.terminal
      ];
    })

    (vimKey {
      key = "ctrl+h";
      command = "workbench.action.terminal.focusPreviousPane";
      when = [
        when.terminal
      ];
    })

    (vimKey {
      key = "ctrl+j";
      command = "workbench.action.focusActiveEditorGroup";
      when = [
        when.terminal
      ];
    })

    (vimKey {
      key = "ctrl+k";
      command = "workbench.action.focusActiveEditorGroup";
      when = [
        when.terminal
      ];
    })

    (vimKey {
      key = "ctrl+l";
      command = "workbench.action.terminal.focusNextPane";
      when = [
        when.terminal
      ];
    })
  ];
}