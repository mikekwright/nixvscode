{ ... }:

{
  keybindings = [
    #
    # Vim = Bookmarks
    #
    {
      command = "bookmarks.toggle";
      key = ", b b";
      when = "editorTextFocus && vim.active && vim.mode != 'Insert' && !chatInputHasFocus";
    }

    {
      command = "bookmarks.listFromAllFiles";
      key = ", b l";
      when = "editorTextFocus && vim.active && vim.mode != 'Insert'";
    }

    {
      command = "bookmarks.list";
      key = ", b shift+l";
      when = "editorTextFocus && vim.active && vim.mode != 'Insert'";
    }

    {
      command = "bookmarks.clear";
      key = ", b d";
      when = "editorTextFocus && vim.active && vim.mode != 'Insert'";
    }

    {
      command = "bookmarks.jumpToNext";
      key = ", b n";
      when = "editorTextFocus && vim.active && vim.mode != 'Insert'";
    }

    {
      command = "bookmarks.jumpToPrevious";
      key = ", b p";
      when = "editorTextFocus && vim.active && vim.mode != 'Insert'";
    }

    {
      command = "bookmarksExplorer.open";
      key = ", b e";
      when = "editorTextFocus && vim.active && vim.mode != 'Insert'";
    }
  ];
}
