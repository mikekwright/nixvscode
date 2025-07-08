{ ... }:

# This module defines some of the useful and shared components that can be
#   used when helping to build vscode extensions or keybindings.
{
  editorVimBinding = { key, command, }: {
    inherit key command;

    when = "editorTextFocus && vim.active && vim.mode != 'Insert' && !github.copilot.interactiveSession.disabled";
  };

  debuggerActiveBinding = { key, command }: {
    inherit key command;

    when = "editorTextFocus && vim.active && vim.mode != 'Insert' && !github.copilot.interactiveSession.disabled && debuggersAvailable && debugState == 'active'";
  };

  languageVimBinding = { lang, key, command }: {
    inherit key command;

    when = "editorLangId == '${lang}' && editorTextFocus && vim.active && vim.mode != 'Insert' && !github.copilot.interactiveSession.disabled && debuggersAvailable && debugState == 'inactive'";
  };
}
