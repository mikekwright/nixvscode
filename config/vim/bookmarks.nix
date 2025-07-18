{ funcs, ... }:

{
  keybindings = [
    #
    # Vim = Bookmarks
    #
    (funcs.editorVimBinding {
      command = "bookmarks.toggle";
      key = ", b b";
    })

    (funcs.editorVimBinding {
      command = "bookmarks.listFromAllFiles";
      key = ", b l";
    })

    (funcs.editorVimBinding {
      command = "bookmarks.list";
      key = ", b shift+l";
    })

    (funcs.editorVimBinding {
      command = "bookmarks.clear";
      key = ", b d";
    })

    (funcs.editorVimBinding {
      command = "bookmarks.jumpToNext";
      key = ", b n";
    })

    (funcs.editorVimBinding {
      command = "bookmarks.jumpToPrevious";
      key = ", b p";
    })

    (funcs.editorVimBinding {
      command = "bookmarksExplorer.open";
      key = ", b e";
    })
  ];
}
