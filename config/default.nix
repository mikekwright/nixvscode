{ pkgs, ... }:

{
  imports = [
    ./theme
    ./tools
    ./lsp

    ./keymaps.nix
    ./greeter.nix
    ./avante.nix
  ];

  vscodeSettings = {};

  packages = with pkgs; [
    cloc
  ];

  vscodeExtensions = [];

  keybindings = [
    {
      key = "ctrl+w o";
      command = "workbench.action.closeOtherEditors";
      when = "editorFocus";
    }

    {
      key = "ctrl+h";
      command = "workbench.action.terminal.focusPreviousPane";
      when = "terminalFocus";
    }

    {
      key = "ctrl+j";
      command = "workbench.action.focusActiveEditorGroup";
      when = "terminalFocus";
    }
    
    {
      key = "ctrl+k";
      command = "workbench.action.focusActiveEditorGroup";
      when = "terminalFocus";
    }

    {
      key = "ctrl+l";
      command = "workbench.action.terminal.focusNextPane";
      when = "terminalFocus";
    }

    {
      key = "ctrl+w q";
      command = "workbench.action.closeActiveEditor";
      when = "editorFocus";
    }

    {
      key = "ctrl+w p";
      command = "workbench.action.splitEditor";
      when = "editorFocus";
    }
    {
      key = "ctrl+s";
      command = "workbench.action.splitEditor";
      when = "terminalFocus";
    }
    {
      key = "ctrl+w h";
      command = "workbench.action.navigateLeft";
    }
    {
      key = "ctrl+w ctrl+h";
      command = "workbench.action.toggleSidebarVisibility";
    }
    {
      key = "ctrl+w shift+h";
      command = "workbench.action.moveEditorToLeftGroup";
    }
    {
      key = "ctrl+w shift+l";
      command = "workbench.action.moveEditorToRightGroup";
    }
    {
      key = "ctrl+w shift+k";
      command = "workbench.action.moveEditorToAboveGroup";
    }
    {
      key = "ctrl+w shift+j";
      command = "workbench.action.moveEditorToBelowGroup";
    }
    {
      key = "ctrl+w l";
      command = "workbench.action.navigateRight";
    }
    {
      key = "ctrl+w j";
      command = "workbench.action.navigateDown";
    }
    {
      key = "ctrl+w k";
      command = "workbench.action.navigateUp";
    }
    {
      key = "ctrl+t";
      command = "workbench.action.terminal.toggleTerminal";
    }
    {
      key = "ctrl+w k";
      command = "workbench.action.navigateUp";
      when = "terminalFocus";
    }


    #
    # File Explorer
    #
    {
      key = "m a";
      command = "explorer.newFolder";
      when = "filesExplorerFocus && !inputFocus";
    }
    {
      key = "f";
      command = "explorer.newFolder";
      when = "filesExplorerFocus && !inputFocus";
    }
    {
      key = "n";
      command = "explorer.newFile";
      when = "filesExplorerFocus && !inputFocus";
    }
    {
      key = "a";
      command = "explorer.newFile";
      when = "filesExplorerFocus && !inputFocus";
    }
    {
      key = "m n";
      command = "explorer.newFile";
      when = "filesExplorerFocus && !inputFocus";
    }
    {
      key = "m d";
      command = "deleteFile";
      when = "filesExplorerFocus && !inputFocus";
    }
    {
      key = "d";
      command = "deleteFile";
      when = "filesExplorerFocus && !inputFocus";
    }
    {
      key = "r";
      command = "renameFile";
      when = "filesExplorerFocus && !inputFocus";
    }
    {
      key = "x";
      command = "filesExplorer.cut";
      when = "filesExplorerFocus && !inputFocus";
    }
    {
      key = "c";
      command = "filesExplorer.copy";
      when = "filesExplorerFocus && !inputFocus";
    }
    {
      key = "v";
      command = "filesExplorer.paste";
      when = "filesExplorerFocus && !inputFocus";
    }
    {
      key = "p";
      command = "filesExplorer.paste";
      when = "filesExplorerFocus && !inputFocus";
    }
    {
      key = "m o";
      command = "explorer.openToSide";
      when = "filesExplorerFocus && !inputFocus";
    }
    {
      key = "o";
      command = "explorer.openToSide";
      when = "filesExplorerFocus && !inputFocus";
    }

    #
    #
    #
    # {
    #   key = "ctrl+t";
    #   command = "workbench.debug.action.toggleRepl";
    #   when = "inDebugRepl"
    # }
    {
      key = "ctrl+p";
      command = "workbench.action.quickOpen";
    }
    {
      key = "f8";
      command = "workbench.action.debug.stepOver";
      when = "inDebugMode";
    }
    {
      key = "f7";
      command = "workbench.action.debug.stepInto";
      when = "inDebugMode";
    }
    {
      key = "shift+f8";
      command = "workbench.action.debug.stepOut";
      when = "inDebugMode";
    }
    {
      key = "alt+f9";
      command = "editor.debug.action.runToCursor";
      when = "inDebugMode";
    }
    {
      key = "alt+f8";
      command = "workbench.debug.action.toggleRepl";
    }
    {
      key = "alt+f8";
      command = "editor.debug.action.selectionToRepl";
      when = "editorTextFocus && editorHasSelection";
    }
    {
      key = "f9";
      command = "workbench.action.debug.continue";
      when = "inDebugMode";
    }
    {
      key = "ctrl+n";
      command = "workbench.action.showAllSymbols";
    }
    {
      key = "ctrl+b";
      command = "editor.action.goToDeclaration";
      when = "editorHasDefinitionProvider && editorTextFocus";
    }
    {
      key = "ctrl+alt+b";
      command = "editor.action.goToImplementation";
      when = "editorHasImplementationProvider && editorTextFocus && !isInEmbeddedEditor";
    }
    {
      key = "ctrl+c";
      command = "editor.action.clipboardCopyAction";
      when = "editorTextFocus";
    }
    {
      key = "ctrl+shift+c";
      command = "workbench.action.terminal.copySelection";
      when = "terminalFocus";
    }
    {
      key = "ctrl+x";
      command = "editor.action.clipboardCutAction";
      when = "editorTextFocus && !editorReadonly";
    }
    {
      key = "ctrl+v";
      command = "editor.action.clipboardPasteAction";
      when = "editorTextFocus && !editorReadonly";
    }
    {
      key = "ctrl+k z";
      command = "workbench.action.toggleZenMode";
      when = "editorTextFocus";
    }
    # {
    #   key = "ctrl+w k";
    #   command = "workbench.action.focusActiveEditorGroup";
    #   when = "terminalFocus"
    # }
    {
      key = "ctrl+w";
      command = "-workbench.action.closeActiveEditor";
    }
    {
      key = "s";
      command = "explorer.openToSide";
      when = "explorerViewletFocus && explorerViewletVisible && !inputFocus";
    }
    {
      key = "ctrl+w c";
      command = "notifications.focusFirstToast";
      when = "editorTextFocus";
    }
    {
      key = "ctrl+a";
      command = "extension.terminalCapture.runCapture";
      when = "terminalFocus";
    }
    {
      key = "d";
      command = "notification.clear";
      when = "notificationFocus";
    }
    {
      key = "ctrl+w m";
      command = "editor.action.toggleMinimap";
      when = "editorTextFocus";
    }
    {
      key = "ctrl+shift+m";
      command = "workbench.action.toggleMaximizedPanel";
    }
    {
      key = "ctrl+shift+m";
      command = "-workbench.actions.view.problems";
    }

    #
    # Search and Find in Files
    #
    {
      key = ", f p";
      command = "workbench.action.showCommands";
      when = "editorTextFocus && vim.active && vim.mode != 'Insert' && !github.copilot.interactiveSession.disabled";
    }
    {
      key = ", f f";
      command = "workbench.action.quickOpen";
      when = "editorTextFocus && vim.active && vim.mode != 'Insert' && !github.copilot.interactiveSession.disabled";
    }
    {
      key = ", f g";
      command = "workbench.action.findInFiles";
      when = "editorTextFocus && vim.active && vim.mode != 'Insert'";
    }
    {
      key = "ctrl+w j";
      command = "search.action.focusSearchList";
      when = "searchInputBoxFocus";
    }
    {
      key = "ctrl+w k";
      command = "workbench.action.findInFiles";
      when = "searchResultListFocused";
    }


    #
    # Vim = General navigation commands
    #
    {
      key = ", w f";
      command = "workbench.action.toggleZenMode";
      when = "editorTextFocus && vim.active && vim.mode != 'Insert'";
    }
    {
      key = ", w h";
      command = "workbench.action.previousEditor";
      when = "editorTextFocus && vim.active && vim.mode != 'Insert'";
    }
    {
      key = ", w l";
      command = "workbench.action.nextEditor";
      when = "editorTextFocus && vim.active && vim.mode != 'Insert'";
    }
    {
      key = ", t t";
      command = "workbench.action.terminal.toggleTerminal";
      when = "editorTextFocus && vim.active && vim.mode != 'Insert'";
    }
    {
      key = ", e e";
      command = "workbench.action.toggleSidebarVisibility";
      when = "filesExplorerFocus";
    }
    {
      key = ", e c";
      command = "workbench.action.closeSidebar";
      when = "sideBarVisible && editorTextFocus && vim.active && vim.mode != 'Insert'";
    }
    {
      key = ", e c";
      command = "workbench.action.closeSidebar";
      when = "sideBarVisible && sideBarFocus";
    }
    {
      key = ", e e";
      command = "workbench.files.action.focusFilesExplorer";
      when = "editorTextFocus && vim.active && vim.mode != 'Insert'";
    }
    {
      key = ", g b";
      command = "workbench.action.navigateBack";
      when = "editorTextFocus && vim.active && vim.mode != 'Insert'";
    }
    {
      key = ", g f";
      command = "workbench.action.navigateForward";
      when = "editorTextFocus && vim.active && vim.mode != 'Insert'";
    }
    {
      key = ", g t";
      command = "workbench.action.gotoSymbol";
      when = "editorTextFocus && vim.active && vim.mode != 'Insert' && !editorReadonly";
    }
    {
      key = ", g h";
      command = "editor.action.quickFix";
      when = "editorTextFocus && vim.active && vim.mode != 'Insert' && !editorReadonly";
    }

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


    #
    # VSCode AI Chat and support shortcuts
    #
    # {
    #   key = "ctrl+a o";
    #   command = "workbench.action.chat.openAgent"
    # }
    # {
    #   key = "ctrl+a c";
    #   command = "workbench.action.chat.toggle";
    # }
    {
      key = ", a a";
      command = "workbench.action.chat.openAgent";
      when = "editorTextFocus && vim.active && vim.mode != 'Insert'";
    }
    # {
    #   key = "ctrl+a e";
    #   command = "github.copilot.chat.explain.palette";
    #   when = "!editorReadonly && !github.copilot.interactiveSession.disabled"
    # }
    {
      key = ", a e";
      command = "github.copilot.chat.explain.palette";
      when = "editorTextFocus && vim.active && vim.mode != 'Insert' && !github.copilot.interactiveSession.disabled";
    }
    # {
    #   key = "ctrl+a r";
    #   command = "github.copilot.chat.review";
    #   when = "!editorReadonly && !github.copilot.interactiveSession.disabled"
    # }
    {
      key = ", a r";
      command = "github.copilot.chat.review";
      when = "editorTextFocus && vim.active && vim.mode != 'Insert' && !github.copilot.interactiveSession.disabled";
    }
    {
      key = ", a f";
      command = "github.copilot.chat.fix";
      when = "editorTextFocus && vim.active && vim.mode != 'Insert' && !github.copilot.interactiveSession.disabled";
    }
    # {
    #   key = "ctrl+a t";
    #   command = "github.copilot.chat.generateTests";
    #   when = "!editorReadonly && !github.copilot.interactiveSession.disabled"
    # }
    {
      key = ", a g t";
      command = "github.copilot.chat.generateTests";
      when = "editorTextFocus && vim.active && vim.mode != 'Insert' && !github.copilot.interactiveSession.disabled";
    }
    # {
    #   key = "ctrl+a c";
    #   command = "github.copilot.chat.generate";
    #   when = "!editorReadonly && !github.copilot.interactiveSession.disabled"
    # }
    {
      key = ", a g c";
      command = "github.copilot.chat.generate";
      when = "editorTextFocus && vim.active && vim.mode != 'Insert' && !github.copilot.interactiveSession.disabled";
    }
    # {
    #   key = "ctrl+a d";
    #   command = "github.copilot.chat.generateDocs";
    #   when = "!editorReadonly && !github.copilot.interactiveSession.disabled"
    # }
    {
      key = ", a g d";
      command = "github.copilot.chat.generateDocs";
      when = "editorTextFocus && vim.active && vim.mode != 'Insert' && !github.copilot.interactiveSession.disabled";
    }
    {
      key = ", a h";
      command = "editor.action.showHover";
      when = "editorTextFocus && vim.active && vim.mode != 'Insert'";
    }
    {
      key = ", a c";
      command = "workbench.action.chat.toggle";
      when = "editorTextFocus && vim.active && vim.mode != 'Insert' && !github.copilot.interactiveSession.disabled";
    }
    # {
    #   key = ", a c";
    #   command = "workbench.action.chat.focusInput";
    #   when = "editorTextFocus && vim.active && vim.mode != 'Insert' && workbench.panel.chat.view.copilot.visible && !github.copilot.interactiveSession.disabled"
    # }
    {
      key = "ctrl+a";
      command = "workbench.action.chat.toggle";
      when = "chatInputHasFocus";
    }

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

    #
    # Vim = Run and Debug
    #
    {
      key = ", r b";
      command = "editor.debug.action.toggleBreakpoint";
      when = "editorTextFocus && vim.active && vim.mode != 'Insert' && debuggersAvailable";
    }
    {
      key = ", r d";
      command = "workbench.action.debug.selectandstart";
      when = "editorTextFocus && vim.active && vim.mode != 'Insert' && debuggersAvailable && debugState == 'inactive'";
    }
    {
      key = ", r s";
      command = "workbench.action.debug.stop";
      when = "editorTextFocus && vim.active && vim.mode != 'Insert' && debuggersAvailable && debugState != 'inactive'";
    }
    {
      key = ", r r";
      command = "workbench.action.debug.continue";
      when = "editorTextFocus && vim.active && vim.mode != 'Insert' && debuggersAvailable && debugState != 'inactive'";
    }
    {
      key = ", r c";
      command = "workbench.action.debug.continue";
      when = "editorTextFocus && vim.active && vim.mode != 'Insert' && debuggersAvailable && debugState != 'inactive'";
    }
    {
      key = ", r d";
      command = "workbench.action.debug.start";
      when = "editorTextFocus && vim.active && vim.mode != 'Insert' && debuggersAvailable && debugState != 'inactive'";
    }
    {
      key = ", r n";
      command = "workbench.action.debug.stepOver";
      when = "editorTextFocus && vim.active && vim.mode != 'Insert' && debuggersAvailable && debugState != 'inactive'";
    }
    {
      key = ", r i";
      command = "workbench.action.debug.stepInto";
      when = "editorTextFocus && vim.active && vim.mode != 'Insert' && debuggersAvailable && debugState != 'inactive'";
    }
    {
      key = ", r o";
      command = "workbench.action.debug.stepOut";
      when = "editorTextFocus && vim.active && vim.mode != 'Insert' && debuggersAvailable && debugState != 'inactive'";
    }
    {
      key = ", r h";
      command = "editor.debug.action.showDebugHover";
      when = "editorTextFocus && vim.active && vim.mode != 'Insert' && debuggersAvailable && debugState != 'inactive'";
    }
    {
      key = ", r t";
      command = "workbench.action.debug.toggleRepl";
      when = "editorTextFocus && vim.active && vim.mode != 'Insert' && debuggersAvailable && debugState != 'inactive'";
    }
    {
      key = ", r r";
      command = "workbench.action.debug.run";
      when = "editorTextFocus && vim.active && vim.mode != 'Insert' && debugState == 'inactive'";
    }
  ];
} 