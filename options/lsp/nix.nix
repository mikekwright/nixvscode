{ pkgs, extra-pkgs, funcs, options, ... }:

{
  vscodeExtensions = with extra-pkgs.extensions; options.extensions "lsp.nix" [
    # This is a selector for enabling a flake in an env
    #   https://marketplace.visualstudio.com/items?itemName=arrterian.nix-env-selector
    (funcs.safePkg vscode-marketplace [ "arrterian" "nix-env-selector" ])

    # This is the extension with syntax highlighting for nix
    #   https://marketplace.visualstudio.com/items?itemName=jnoortheen.nix-ide
    (funcs.safePkg vscode-marketplace [ "jnoortheen" "nix-ide" ])
  ];

  packages = with pkgs; options.packages "lsp.nix" [
    nixd

    # This is included to enable the
    nixfmt
  ];

  vscodeSettings = {
    "[nix]" = {
      "editor.tabSize" = 2;
      "editor.rulers" = [ 100 120 ];
      "editor.formatOnType" = true;
    };

    "nix.enableLanguageServer" = true;
    "nix.serverPath" = "${pkgs.nixd}/bin/nixd";
    "nix.serverSettings" = {
      # Check https://github.com/nix-community/nixd/blob/main/nixd/docs/configuration.md for all nixd config
      "nixd" = {
        "formatting" = {
          "command" = ["${pkgs.nixfmt}/bin/nixfmt"];
        };
      };
    };

    "nixEnvSelector.useFlakes" = true;
  };

  aiGenerationInstructions = options.ai "lsp.nix" (funcs.buildLangAiInstructions "nix" [
    "Avoid let and rec when possible."
    "Create code that can be easily tested and debugged."
    "Create solutions that are easy to evaluate with the repl."
    "Prefer using built-in functions and libraries."
    "Focus on using flakes with nix."
  ]);

  aiTestInstructions = options.ai "lsp.nix" (funcs.buildLangAiInstructions "nix" [
    "Prefer using the built-in testing framework."
    "Create tests that are easy to run from a nix flake."
  ]);
}
