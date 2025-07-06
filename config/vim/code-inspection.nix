{ ... }:

{
  keybindings = [
    #
    # Vim = Code inspection and formatting
    #
    {
      key = ", k c";
      command = "editor.action.commentLine";
      when = "editorTextFocus && vim.active && vim.mode != 'Insert' && !editorReadonly";
    }
    {
      key = ", k u";
      command = "editor.action.removeCommentLine";
      when = "editorTextFocus && vim.active && vim.mode != 'Insert' && !editorReadonly";
    }
    {
      key = ", l r";
      command = "editor.action.rename";
      when = "editorTextFocus && vim.active && vim.mode != 'Insert' && !editorReadonly";
    }
    {
      key = ", l shift+r";
      command = "editor.action.referenceSearch.trigger";
      when = "editorTextFocus && vim.active && vim.mode != 'Insert' && !editorReadonly";
    }
    {
      key = ", l c";
      command = "editor.action.referenceSearch.trigger";
      when = "editorTextFocus && vim.active && vim.mode != 'Insert' && !editorReadonly";
    }
    {
      key = ", l shift+c";
      command = "editor.action.showOutgoingCalls";
      when = "editorTextFocus && vim.active && vim.mode != 'Insert' && !editorReadonly";
    }
    {
      key = ", l d";
      command = "editor.action.revealDefinition";
      when = "editorTextFocus && vim.active && vim.mode != 'Insert' && !editorReadonly";
    }
    {
      key = ", l shift+d";
      command = "editor.action.revealDeclaration";
      when = "editorTextFocus && vim.active && vim.mode != 'Insert' && !editorReadonly";
    }
    {
      key = ", l shift+s";
      command = "workbench.action.showAllSymbols";
      when = "editorTextFocus && vim.active && vim.mode != 'Insert' && !editorReadonly";
    }
    {
      key = ", l t";
      command = "editor.action.goToTypeDefinition";
      when = "editorTextFocus && vim.active && vim.mode != 'Insert' && !editorReadonly";
    }
    {
      key = ", l v";
      command = "workbench.action.showAllSymbols";
      when = "editorTextFocus && vim.active && vim.mode != 'Insert' && !editorReadonly";
    }
    {
      key = ", l w";
      command = "workbench.action.showAllSymbols";
      when = "editorTextFocus && vim.active && vim.mode != 'Insert' && !editorReadonly";
    }
    {
      key = ", l f";
      command = "editor.action.formatDocument";
      when = "editorTextFocus && vim.active && vim.mode != 'Insert' && !editorReadonly";
    }

    {
      key = ", l i";
      command = "editor.action.organizeImports";
      when = "editorTextFocus && vim.active && vim.mode != 'Insert' && !editorReadonly";
    }
    {
      key = ", l l";
      command = "editor.action.quickFix";
      when = "editorTextFocus && vim.active && vim.mode != 'Insert' && !editorReadonly";
    }
  ];
}
