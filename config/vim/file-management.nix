{ ... }:

{
  keybindings = [
    #
    # Vim = File and Editor Management
    #
    {
      key = ", e n";
      command = "workbench.action.files.newUntitledFile";
      when = "editorTextFocus && vim.active && vim.mode != 'Insert' && !editorReadonly";
    }
    {
      key = ", e s";
      command = "workbench.action.files.save";
      when = "editorTextFocus && vim.active && vim.mode != 'Insert' && !editorReadonly";
    }
    {
      key = ", e u";
      command = "workbench.action.files.revert";
      when = "editorTextFocus && vim.active && vim.mode != 'Insert' && !editorReadonly";
    }
    {
      key = ", e d";
      command = "workbench.action.closeActiveEditor";
      when = "editorTextFocus && vim.active && vim.mode != 'Insert' && !editorReadonly";
    }
    {
      key = ", e c";
      command = "workbench.action.closeSidebar";
      when = "editorTextFocus && vim.active && vim.mode != 'Insert' && !editorReadonly";
    }
  ];
}
