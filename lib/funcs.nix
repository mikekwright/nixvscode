{ pkgs, ... }:

# This module defines some of the useful and shared components that can be
#   used when helping to build vscode extensions or keybindings.
rec {

  # These are the different combinations to consider for the flow we are using
  when = rec {
    editor = "editorTextFocus";
    vim = "vim.active && vim.mode != 'Insert'";
    vim-editor = "${editor} && ${vim}";
    copilot = "!github.copilot.interactiveSession.disabled";
    can-debug = "debuggersAvailable";
    in-debug = "inDebugMode";
    not-debug = "!inDebugMode";
    file-explorer = "explorerViewletVisible && !github.copilot.interactiveSession.disabled";
    terminal = "terminalFocus && !github.copilot.interactiveSession.disabled";
    language = lang: "editorLangId == '${lang}'";
  };

  vimKey = { key, command, when ? [] }: {
    inherit key command;

    when = builtins.concatStringsSep " && " (map (x: "${x}") when);
  };

  vimKeys = { key, command, when-list ? [] }:
    map (x: (vimKey { key = key; command = command; when = x; })) when-list;

  editorVimBinding = { key, command, }: (vimKey {
    inherit key command;

    when = [
      when.vim-editor
      when.copilot
    ];
  });

  inDebugBinding = { key, command }: (vimKey {
    inherit key command;

    when = [
      when.in-debug
      when.vim-editor
    ];
  });

  languageVimBinding = { lang, key, command }: (vimKey {
    inherit key command;

    when = [
      (when.language lang)
      when.vim-editor
      when.copilot
    ];
  });

  buildLangAiInstructions = lang: texts: map (t: { text = t; language = lang; }) texts;
  buildAiInstructions = texts: map (t: { text = t; }) texts;

  # This allows for extensions to be used when existing or null if not found
  #   signarture - attrs (package to find attrs), pkgs-attr (array of the package to find)
  safePkg = attrs: pkgs-attr:
    let
      return-pkg = (pkgs.lib.attrsets.attrByPath pkgs-attr null attrs);
    in
      if return-pkg != null then
        return-pkg
      else
        pkgs.lib.trace "Warning: Package '${pkgs.lib.concatMapStrings (x: x + ".") pkgs-attr}' not found." null;
}
