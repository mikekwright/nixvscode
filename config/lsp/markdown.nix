{ pkgs, extra-pkgs, ... }:

{
  vscodeExtensions = with extra-pkgs.extensions; [
    # VSCode has markdown builtin, this is for linting
    #    https://marketplace.visualstudio.com/items?itemName=DavidAnson.vscode-markdownlint
    vscode-marketplace.davidanson.vscode-markdownlint
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
}
