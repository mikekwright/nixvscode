{ pkgs, ... }:

{
  imports = [
    # Start with Vim, you have to have vim mode for sure
    ./vim

    ./theme
    ./tools
    ./lsp

    ./keymaps.nix
    ./greeter.nix
    ./avante.nix
  ];

  vscodeSettings = {
    "zenMode.fullScreen" = true;
    "zenMode.centerLayout" = true;
    "zenMode.hideLineNumbers" = false;
    "zenMode.hideActivityBar" = true;
    "zenMode.hideStatusBar" = true;
    "explorer.excludeGitIgnore" = true;
    "editor.insertSpaces" = true;
    "editor.detectIndentation" = false;
    "workbench.iconTheme" = "file-icons";
    "workbench.editor.enablePreview" = false;
    "files.exclude" = {
      "**/__pycache__" = true;
      "**/node_modules" = true;
      "**/*.sw?" = true;
    };
    "terminal.integrated.commandsToSkipShell" = [
      "workbench.action.navigateRight"
      "workbench.action.navigateLeft"
      "workbench.action.navigateUp"
      "workbench.action.navigateDown"
      "workbench.action.focusActiveEditorGroup"
      "extension.terminalCapture.runCapture"
    ];
    "editor.minimap.enabled" = true;

    "files.trimTrailingWhitespace" = true;
    "editor.lineNumbers" = "relative";
    macros = {
      fileExplorerSelect = [
        "list.select"
        "workbench.action.toggleSidebarVisibility"
      ];
    };
    "[markdown]" = {
      "editor.formatOnSave" = true;
      "editor.wordWrap" = "on";
      "editor.renderWhitespace" = "all";
      "editor.acceptSuggestionOnEnter" = "off";
      "files.trimTrailingWhitespace" = false;
    };
    "java.errors.incompleteClasspath.severity" = "ignore";
    "gitlens.advanced.messages" = {
      suppressCommitHasNoPreviousCommitWarning = false;
      suppressCommitNotFoundWarning = false;
      suppressFileNotUnderSourceControlWarning = false;
      suppressGitVersionWarning = false;
      suppressLineUncommittedWarning = false;
      suppressNoRepositoryWarning = false;
    };
    "explorer.confirmDelete" = false;
    "gitlens.keymap" = "chorded";
    "gitlens.historyExplorer.enabled" = true;
    "files.eol" = "\n";
    "python.jediEnabled" = false;
    "terminal.integrated.defaultProfile.windows" = "Powershell";
    "terminal.integrated.profiles.windows" = {
      PowerShell = {
        source = "PowerShell";
        icon = "terminal-powershell";
      };
      "Command Prompt" = {
        path = [
          "${env:windir}\\Sysnative\\cmd.exe"
          "${env:windir}\\System32\\cmd.exe"
        ];
        args = [

        ];
        icon = "terminal-cmd";
      };
      "Git Bash" = {
        source = "Git Bash";
      };
    };
    "terminal.integrated.defaultProfile.linux" = "flathub-fish";
    "terminal.integrated.profiles.linux" = {
      bash = {
        path = "bash";
        icon = "terminal-bash";
      };
      zsh = {
        path = "zsh";
        icon = "terminal-linux";
      };
      flathub-fish = {
        path = "/usr/bin/flatpak-spawn";
        args = [
          "--host"
          "--env=TERM=xterm-256color"
          "fish"
        ];
        icon = "terminal-linux";
      };
      fish = {
        path = "/etc/bin/env";
        args = [
          "fish"
        ];
        icon = "terminal-linux";
      };
      tmux = {
        path = "tmux";
        icon = "terminal-tmux";
      };
      pwsh = {
        path = "pwsh";
        icon = "terminal-powershell";
      };
    };
    "editor.useTabStops" = false;
    "breadcrumbs.enabled" = true;
    "gitlens.views.fileHistory.enabled" = true;
    "python.condaPath" = "/home/mikewright/Tools/conda/current/bin/conda";
    "editor.tabSize" = 2;
    "[rust]" = {
      "editor.tabSize" = 4;
      "outline.showTypeParameters" = false;
      "editor.rulers" = [
        100
        120
      ];
    };
    "[proto3]" = {
      "editor.tabSize" = 2;
      "outline.showTypeParameters" = false;
      "editor.rulers" = [
        100
        120
      ];
    };
    "[csharp]" = {
      "editor.tabSize" = 4;
      "outline.showTypeParameters" = true;
    };
    "[python]" = {
      "editor.tabSize" = 4;
      "editor.rulers" = [
        100
        120
      ];
      "editor.formatOnType" = true;
    };
    vs-kubernetes = {
      "vs-kubernetes.minikube-path" = "/home/mikewright/.vs-kubernetes/tools/minikube/linux-amd64/minikube";
      "vscode-kubernetes.helm-path.linux" = "/home/mikewright/.vs-kubernetes/tools/helm/linux-amd64/helm";
      "vscode-kubernetes.minikube-path.linux" = "/home/mikewright/.vs-kubernetes/tools/minikube/linux-amd64/minikube";
    };
    "workbench.colorTheme" = "GitHub Dark Default";
    "workbench.list.defaultFindMode" = "highlight";
    "workbench.list.typeNavigationMode" = "automatic";
    "editor.suggestSelection" = "first";
    "vsintellicode.modify.editor.suggestSelection" = "automaticallyOverrodeDefaultValue";
    "atlascode.jira.workingSite" = {
      baseUrlSuffix = "atlassian.net";
    };
    "terminal.integrated.shell.windows" = "C:\\Program Files\\PowerShell\\7\\pwsh.exe";
    "sync.forceUpload" = true;
    "settingsSync.ignoredExtensions" = [
      "dart-code.flutter"
      "dart-code.dart-code"
    ];
    "kite.showWelcomeNotificationOnStartup" = false;
    "dart.flutterSdkPath" = "C:\\Development\\Tools\\flutter";
    "debug.openDebug" = "openOnDebugBreak";
    "[dart]" = {
      "editor.formatOnSave" = true;
      "editor.formatOnType" = true;
      "editor.rulers" = [
        80
      ];
      "editor.selectionHighlight" = false;
      "editor.suggest.snippetsPreventQuickSuggestions" = false;
      "editor.suggestSelection" = "first";
      "editor.tabCompletion" = "onlySnippets";
      "editor.wordBasedSuggestions" = "off";
    };
    "[jsonc]" = {
      "editor.defaultFormatter" = "vscode.json-language-features";
    };
    "python.languageServer" = "Pylance";
    "terminal.integrated.inheritEnv" = false;
    "dart.openDevTools" = "flutter";
    "workbench.editorAssociations" = {
      "*.ipynb" = "jupyter.notebook.ipynb";
    };
    "terminal.integrated.gpuAcceleration" = "canvas";
    "editor.inlineSuggest.enabled" = true;
    "remote.SSH.defaultExtensions" = [
      "gitpod.gitpod-remote-ssh"
    ];
    "remote.SSH.configFile" = "/var/folders/g2/wvkymszx3ng1bkq6bwm_kgg00000gn/T/gitpod_ssh_config-64177-JztmirHqgtdz";
    "git.autofetch" = true;
    "[json]" = {
      "editor.defaultFormatter" = "vscode.json-language-features";
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
    "debug.allowBreakpointsEverywhere" = true;
    "githubPullRequests.terminalLinksHandler" = "github";
    "editor.inlayHints.enabled" = false;
    "projectManager.git.baseFolders" = [
      "~/Development/"
    ];
    "go.toolsManagement.autoUpdate" = true;
    "vscode-pets.petSize" = "medium";
    "vscode-pets.petType" = "dog";
    "vscode-pets.theme" = "forest";
    "arduino.useArduinoCli" = true;
    "git.openRepositoryInParentFolders" = "never";
    "python.analysis.inlayHints.functionReturnTypes" = true;
    "python.analysis.inlayHints.variableTypes" = true;
    "dotnet.completion.showCompletionItemsFromUnimportedNamespaces" = true;
    "remote.SSH.remotePlatform" = {
      "*.gitpod.io" = "linux";
    };
    "debug.onTaskErrors" = "showErrors";
    "github.copilot.selectedCompletionModel" = "";
    "github.copilot.nextEditSuggestions.enabled" = true;
    "terminal.integrated.fontFamily" = "monospace";
  };
  

  packages = with pkgs; [
    cloc
  ];

  vscodeExtensions = with pkgs.vscode-extensions; [
    ms-python.python
  ];

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
  ];
} 
