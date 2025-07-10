{ pkgs, extra-pkgs, ... }:

{
  vscodeExtensions = with extra-pkgs.extensions; [
    # This is the official copilot, needs to be installed this was as it fails to be "setup"
    #   when started with vscode
    #
    #   https://marketplace.visualstudio.com/items?itemName=GitHub.copilot
    vscode-marketplace-release.github.copilot

    # You also need the chat plugin
    #   https://marketplace.visualstudio.com/items?itemName=GitHub.copilot-chat
    vscode-marketplace-release.github.copilot-chat
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
  };

  keybindings = [
    #
    # VSCode AI Chat and support shortcuts
    #
    {
      key = ", a a";
      command = "workbench.action.chat.openAgent";
      when = "editorTextFocus && vim.active && vim.mode != 'Insert'";
    }

    {
      key = ", a e";
      command = "github.copilot.chat.explain.palette";
      when = "editorTextFocus && vim.active && vim.mode != 'Insert' && !github.copilot.interactiveSession.disabled";
    }

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

    {
      key = ", a g t";
      command = "github.copilot.chat.generateTests";
      when = "editorTextFocus && vim.active && vim.mode != 'Insert' && !github.copilot.interactiveSession.disabled";
    }

    {
      key = ", a g c";
      command = "github.copilot.chat.generate";
      when = "editorTextFocus && vim.active && vim.mode != 'Insert' && !github.copilot.interactiveSession.disabled";
    }

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

    {
      key = "ctrl+c";
      command = "workbench.action.chat.toggle";
      when = "chatInputHasFocus";
    }
  ];
}
