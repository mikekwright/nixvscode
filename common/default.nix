{ pkgs, funcs, ... }:

{
  # imports = [
  #   # Start with Vim, you have to have vim mode for sure
  #   ./vim
  #
  #   # We must have a common theme in place
  #   ./theme.nix
  #
  #   # The Zen mode should also be consistent
  #   ./zen-mode.nix
  #
  #   # Always supporting the shell experience is pretty important
  #   ./shell.nix
  #
  #   # Markdown is really used in all situations as well
  #   ./markdown.nix
  #
  #   # Terminal work and keyboard shortcuts should be included
  #   ./terminal.nix
  #
  #   # Common experience with the workspace
  #   ./workspace
  # ];

  vscodeSettings = {
    # "editor.fontFamily" = "Fira Code, monospace";
    # "terminal.integrated.fontFamily" = "'Fira Code', monospace";

    # Disable telemetry
    "telemetry.feedback.enabled" = false;
    "telemetry.telemetryLevel" = "off";
    "editor.experimental.treeSitterTelemetry" = false;

    "explorer.excludeGitIgnore" = true;
    "editor.insertSpaces" = true;
    "editor.detectIndentation" = false;
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
    # macros = {
    #   fileExplorerSelect = [
    #     "list.select"
    #     "workbench.action.toggleSidebarVisibility"
    #   ];
    # };

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
    "files.eol" = "\n";
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
    "terminal.integrated.defaultProfile.linux" = "bash";
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
    "editor.tabSize" = 2;

    "[proto3]" = {
      "editor.tabSize" = 2;
      "outline.showTypeParameters" = false;
      "editor.rulers" = [
        100
        120
      ];
    };


    "workbench.list.defaultFindMode" = "highlight";
    "workbench.list.typeNavigationMode" = "automatic";
    "editor.suggestSelection" = "first";
    # "vsintellicode.modify.editor.suggestSelection" = "automaticallyOverrodeDefaultValue";
    # "atlascode.jira.workingSite" = {
    #   baseUrlSuffix = "atlassian.net";
    # };
    "terminal.integrated.shell.windows" = "C:\\Program Files\\PowerShell\\7\\pwsh.exe";
    # "sync.forceUpload" = true;
    "debug.openDebug" = "openOnDebugBreak";

    "[jsonc]" = {
      "editor.defaultFormatter" = "vscode.json-language-features";
    };
    "terminal.integrated.inheritEnv" = false;
    "terminal.integrated.gpuAcceleration" = "auto";
    "editor.inlineSuggest.enabled" = true;
    # "remote.SSH.defaultExtensions" = [
    #   "gitpod.gitpod-remote-ssh"
    # ];
    # "remote.SSH.configFile" = "/var/folders/g2/wvkymszx3ng1bkq6bwm_kgg00000gn/T/gitpod_ssh_config-64177-JztmirHqgtdz";
    "git.autofetch" = true;
    "[json]" = {
      "editor.defaultFormatter" = "vscode.json-language-features";
    };
    "debug.allowBreakpointsEverywhere" = true;
    "editor.inlayHints.enabled" = "offUnlessPressed";
    # "projectManager.git.baseFolders" = [
    #   "~/Development/"
    # ];
    # "vscode-pets.petSize" = "medium";
    # "vscode-pets.petType" = "dog";
    # "arduino.useArduinoCli" = true;
    "git.openRepositoryInParentFolders" = "never";

    "dotnet.completion.showCompletionItemsFromUnimportedNamespaces" = true;
    # "remote.SSH.remotePlatform" = {
    #   "*.gitpod.io" = "linux";
    # };
    "debug.onTaskErrors" = "showErrors";
    "github.copilot.selectedCompletionModel" = "";
    "github.copilot.nextEditSuggestions.enabled" = true;
    #"terminal.integrated.fontFamily" = "monospace";
  };

  packages = with pkgs; [
    cloc
  ];

  #vscodeExtensions = with pkgs; [
  #];

  keybindings = with funcs; [
    (vimKey {
      key = "ctrl+w q";
      command = "workbench.action.closeSidebar";
      when = [
        when.sidebar-visible
        when.in-sidebar
      ];
    })

    {
      key = "ctrl+w o";
      command = "workbench.action.closeOtherEditors";
      when = "editorFocus";
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

    # {
    #   key = "ctrl+w k";
    #   command = "workbench.action.focusActiveEditorGroup";
    #   when = "terminalFocus"
    # }

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
  ];
}
