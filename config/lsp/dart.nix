{ extra-pkgs, funcs, ... }:

{
  vscodeExtensions = with extra-pkgs.extensions; [
    # This is the official dart-lang extension
    #    https://marketplace.visualstudio.com/items?itemName=Dart-Code.dart-code
    (funcs.safePkg vscode-marketplace [ "Dart-Code" "dart-code" ])

    # This is the official flutter extension for flutter development
    #    https://marketplace.visualstudio.com/items?itemName=Dart-Code.flutter
    (funcs.safePkg vscode-marketplace [ "Dart-Code" "flutter" ])
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

    "dart.openDevTools" = "flutter";
    # "dart.flutterSdkPath" = "C:\\Development\\Tools\\flutter";
  };
}
