{ extra-pkgs, funcs, ... }:

{
  vscodeExtensions = with extra-pkgs.extensions; [
    # This is the official copilot, needs to be installed this was as it fails to be "setup"
    #   when started with vscode
    #
    #   https://marketplace.visualstudio.com/items?itemName=GitHub.copilot
    (funcs.safePkg vscode-marketplace-release [ "github" "copilot" ])

    # You also need the chat plugin
    #   https://marketplace.visualstudio.com/items?itemName=GitHub.copilot-chat
    (funcs.safePkg vscode-marketplace-release [ "github" "copilot-chat" ])
  ];

  vscodeSettings = {
    "chat.agent.enabled" = true;
    "chat.commandCenter.enabled" = true;

    # This will use the .github/copilot-instructions.md file if one exists.
    "github.copilot.chat.codeGeneration.useInstructionFiles" = true;

    # The below is experimental as of July 5th, 2025
    #   Does not seem to work with nix
    "chat.useFileStorage" = false;

    "github.copilot.enable" = {
      "*" = true;
      "plaintext" = false;
      "markdown" = false;
      "scminput" = false;
    };

    "github.copilot.advanced" = {
      "enableChat" = true;
      "enableCodeWhisperer" = false;
      "enableInlineSuggestions" = true;
      "enableNextEditSuggestions" = true;
      "enableNextLineSuggestions" = true;
      "enableTabCompletions" = true;
      "showStatusBarIcon" = true;
    };

    # This is the language type for the chat instructions that
    #   are in .vscode/copilot-instructions.md
    "[instructions]" = {
      "editor.unicodeHighlight.ambiguousCharacters" = false;
      "editor.unicodeHighlight.invisibleCharacters" = false;
      "diffEditor.ignoreTrimWhitespace" = false;
      "editor.wordWrap" = "on";
    };

    # Trying this our from a discovered gist
    #    https://gist.github.com/okineadev/8a3f392a93ae50e8d523e4ba7f9f9ac3
    "github.copilot.chat.commitMessageGeneration.instructions"= [
      {
        text = "Follow the Conventional Commits format strictly for commit messages. Use the structure below:\n\n```\n<type>[optional scope]: <gitmoji> <description>\n\n[optional body]\n```\n\nGuidelines:\n\n1. **Type and Scope**: Choose an appropriate type (e.g., `feat`, `fix`) and optional scope to describe the affected module or feature.\n\n2. **Gitmoji**: Include a relevant `gitmoji` that best represents the nature of the change.\n\n3. **Description**: Write a concise, informative description in the header; use backticks if referencing code or specific terms.\n\n4. **Body**: For additional details, use a well-structured body section:\n   - Use bullet points (`*`) for clarity.\n   - Clearly describe the motivation, context, or technical details behind the change, if applicable.\n\nCommit messages should be clear, informative, and professional, aiding readability and project tracking.";
      }
    ];
  };

  keybindings = with funcs; [
    #
    # VSCode AI Chat and support shortcuts
    #
    (editorVimBinding {
      key = ", a a";
      command = "workbench.action.chat.openAgent";
    })

    (editorVimBinding {
      key = ", a e";
      command = "github.copilot.chat.explain.palette";
    })

    (editorVimBinding {
      key = ", a r";
      command = "github.copilot.chat.review";
    })

    (editorVimBinding {
      key = ", a f";
      command = "github.copilot.chat.fix";
    })

    (editorVimBinding {
      key = ", a g t";
      command = "github.copilot.chat.generateTests";
    })

    (editorVimBinding {
      key = ", a g c";
      command = "github.copilot.chat.generate";
    })

    (editorVimBinding {
      key = ", a g d";
      command = "github.copilot.chat.generateDocs";
    })

    (editorVimBinding {
      key = ", a h";
      command = "editor.action.showHover";
    })

    (editorVimBinding {
      key = ", a c";
      command = "workbench.action.chat.toggle";
    })

    (vimKey {
      key = ", a a";
      command = "runCommands";
      args = {
        commands = [
          "workbench.action.chat.openAgent"
          "workbench.action.chat.attachSelection"
          "workbench.action.chat.focusInput"
        ];
      };
      when = [
        when.editor
        when.vim-visual
        when.chat-enabled
      ];
    })

    # Toggle the chat window fullscreen experience
    {
      key = "ctrl+w f";
      # command = "workbench.action.maximizeAuxiliaryBar";
      command = "workbench.action.toggleMaximizedAuxiliaryBar";
      when = "!auxiliaryBarMaximized && chatInputHasFocus";
    }
    {
      key = "ctrl+w f";
      # command = "workbench.action.restoreAuxiliaryBar";
      # command = "workbench.action.toggleMaximizedAuxiliaryBar";
      command = "runCommands";
      args = {
        commands = [
          "workbench.action.toggleMaximizedAuxiliaryBar"
          "workbench.action.chat.focusInput"
        ];
      };
      when = "auxiliaryBarMaximized";
    }

    {
      key = "ctrl+c";
      command = "workbench.action.chat.toggle";
      when = "chatInputHasFocus";
    }
  ];
}
