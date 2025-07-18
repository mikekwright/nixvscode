{ funcs, ... }:

{
  keybindings = [
    #
    # Vim = Code inspection and formatting
    #   (These did have !editorReadonly, but going to test without)
    (funcs.vimKey {
      key = ", k c";
      command = "editor.action.commentLine";
      when = [
        funcs.when.vim-visual
        funcs.when.editor
      ];
    })
    (funcs.vimKey {
      key = ", k u";
      command = "editor.action.removeCommentLine";
      when = [
        funcs.when.vim-visual
        funcs.when.editor
      ];
    })

    (funcs.editorVimBinding {
      key = ", g t";
      command = "workbench.action.gotoSymbol";
    })

    (funcs.editorVimBinding {
      key = ", g h";
      command = "editor.action.quickFix";
    })

    (funcs.editorVimBinding {
      key = ", g b";
      command = "workbench.action.navigateBack";
    })

    (funcs.editorVimBinding {
      key = ", g f";
      command = "workbench.action.navigateForward";
    })

    (funcs.editorVimBinding {
      key = ", l r";
      command = "editor.action.rename";
    })
    (funcs.editorVimBinding {
      key = ", l shift+r";
      command = "editor.action.referenceSearch.trigger";
    })
    (funcs.editorVimBinding {
      key = ", l c";
      command = "editor.action.referenceSearch.trigger";
    })
    (funcs.editorVimBinding {
      key = ", l shift+c";
      command = "editor.action.showOutgoingCalls";
    })
    (funcs.editorVimBinding {
      key = ", l d";
      command = "editor.action.revealDefinition";
    })
    (funcs.editorVimBinding {
      key = ", l shift+d";
      command = "editor.action.revealDeclaration";
    })
    (funcs.editorVimBinding {
      key = ", l shift+s";
      command = "workbench.action.showAllSymbols";
    })
    (funcs.editorVimBinding {
      key = ", l t";
      command = "editor.action.goToTypeDefinition";
    })
    (funcs.editorVimBinding {
      key = ", l v";
      command = "workbench.action.showAllSymbols";
    })
    (funcs.editorVimBinding {
      key = ", l w";
      command = "workbench.action.showAllSymbols";
    })
    (funcs.editorVimBinding {
      key = ", l f";
      command = "editor.action.formatDocument";
    })
    (funcs.editorVimBinding {
      key = ", l i";
      command = "editor.action.organizeImports";
    })
    (funcs.editorVimBinding {
      key = ", l l";
      command = "editor.action.quickFix";
    })
  ];
}
