{ pkgs, ... }:

# This module defines some of the useful and shared components that can be
#   used when helping to build vscode extensions or keybindings.
rec {

  # These are the different combinations to consider for the flow we are using
  when = rec {
    editor = "editorTextFocus";
    vim = "vim.active && vim.mode == 'Normal'";
    vim-visual = "vim.active && vim.mode == 'Visual'";
    vim-editor = "${editor} && ${vim}";
    copilot = "!github.copilot.interactiveSession.disabled";
    chat-enabled = "chatIsEnabled";
    can-debug = "debuggersAvailable";
    in-debug = "inDebugMode";
    not-debug = "!inDebugMode";
    in-explorer = "filesExplorerFocus";
    file-explorer = "explorerViewletVisible && !github.copilot.interactiveSession.disabled";
    terminal = "terminalFocus && !github.copilot.interactiveSession.disabled";
    language = lang: "editorLangId == '${lang}'";
    sidebar-visible = "sideBarVisible";
    in-sidebar = "sideBarFocus";
  };

  vimKey = { key, command, when ? [], args ? null }: {
    inherit key command args;

    when = builtins.concatStringsSep " && " (map (x: "${x}") when);
  };

  vimKeys = { key, command, args ? null, when-list ? [] }:
    map (x: (vimKey { key = key; command = command; when = x; args = args; })) when-list;

  editorVimBinding = with when; { key, command, args ? null, when ? [] }: (vimKey {
    inherit key command args;

    when = [
      vim-editor
    ] ++ when;
  });

  inDebugBinding = { key, command, args ? null }: (vimKey {
    inherit key command args;

    when = [
      when.in-debug
      when.vim-editor
    ];
  });

  languageVimBinding = { lang, key, command, args ? null }: (vimKey {
    inherit key command args;

    when = [
      (when.language lang)
      when.vim-editor
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
