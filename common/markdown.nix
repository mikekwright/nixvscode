{ funcs, extra-pkgs, ... }:

{
  vscodeExtensions = with extra-pkgs.extensions; [
    # VSCode has markdown builtin, this is for linting
    #    https://marketplace.visualstudio.com/items?itemName=DavidAnson.vscode-markdownlint
    vscode-marketplace.davidanson.vscode-markdownlint

    # Extension for enhancing the markdown preview experience
    #    https://marketplace.visualstudio.com/items?itemName=bierner.markdown-checkbox
    vscode-marketplace.bierner.markdown-checkbox

    # This is a more advanced way to view the markdown instead of just the builtin
    #    https://marketplace.visualstudio.com/items?itemName=shd101wyy.markdown-preview-enhanced
    vscode-marketplace.shd101wyy.markdown-preview-enhanced
  ];

  vscodeSettings = {
    "[markdown]" = {
      "editor.formatOnSave" = true;
      "editor.renderWhitespace" = "all";
      "editor.acceptSuggestionOnEnter" = "off";
      "files.trimTrailingWhitespace" = false;
      "editor.tabSize" = 2;
      "editor.rulers" = [ 80 120 ];
    };

    "markdownlint.config" = {
      default = true;
      MD003 = {
        style = "setext_with_atx";
      };
      MD007 = {
        indent = 2;
      };
      MD046 = {
        style = "indented";
      };
      no-hard-tabs = false;
    };
  };

  keybindings = with funcs; [
    (vimKey {
      key = ", m m";
      command = "markdown-preview-enhanced.openPreviewToTheSide";
      when = [
        (when.language "markdown")
        when.vim-editor
      ];
    })

    (vimKey {
      key = ", m p";
      command = "markdown.showPreview";
      when = [
        (when.language "markdown")
        when.vim-editor
      ];
    })
  ];
}
