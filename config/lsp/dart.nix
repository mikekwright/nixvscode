{ pkgs, extra-pkgs, ... }:

{
  vscodeExtensions = with extra-pkgs.extensions; [
    # This is the official dart-lang extension
    #    https://marketplace.visualstudio.com/items?itemName=Dart-Code.dart-code
    vscode-marketplace.dart-code.dart-code

    # This is the official flutter extension for flutter development
    #    https://marketplace.visualstudio.com/items?itemName=Dart-Code.flutter
    vscode-marketplace.dart-code.flutter
  ];

  vscodeSettings = {
    "[dart]" = {
      "editor.formatOnSave" = true;
      "editor.formatOnType" = true;
      "editor.rulers" = [
        100
        120
      ];
      "editor.selectionHighlight" = false;
      "editor.suggest.snippetsPreventQuickSuggestions" = false;
      "editor.suggestSelection" = "first";
      "editor.tabCompletion" = "onlySnippets";
      "editor.wordBasedSuggestions" = "off";
    };
  };
}
