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

}
