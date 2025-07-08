{ extra-pkgs, funcs, ... }:

{
  vscodeExtensions = with extra-pkgs.extensions; [
    # Personal extension for just copying terminal output to the editor window
    #    https://marketplace.visualstudio.com/items?itemName=devwright.vscode-terminal-capture
    vscode-marketplace.devwright.vscode-terminal-capture
  ];

  vscodeSettings = {
    "terminalCapture.enable" = true;
  };

  keybindings = with funcs; [
    (funcs.vimKey {
      key = "ctrl+w c";
      command = "extension.terminalCapture.runCapture";
      when = [
        when.terminal
      ];
    })
  ];
}