{ pkgs, extra-pkgs, funcs, ... }:

{
  vscodeExtensions = with extra-pkgs.extensions; [
    # This is the microsoft official plugin for typescript
    #    https://marketplace.visualstudio.com/items?itemName=ms-vscode.vscode-typescript-next#review-details
    #  This is only for testing new features, stable is built-in to vscode
    #vscode-marketplace.ms-vscode.vscode-typescript-next

    # This is the extension for eslint support in vscode
    #    https://marketplace.visualstudio.com/items?itemName=dbaeumer.vscode-eslint
    (funcs.safePkg vscode-marketplace [ "dbaeumer" "vscode-eslint" ])

    # React Native tools (from microsoft)
    #    https://marketplace.visualstudio.com/items?itemName=msjsdiag.vscode-react-native
    (funcs.safePkg vscode-marketplace [ "msjsdiag" "vscode-react-native" ])
  ];


  packages = with pkgs; [
    eslint_d

    typescript
    nodejs_22 # This is required for typescript
  ];

  vscodeSettings = {
    "[typescript]" = {
      "editor.tabSize" = 2;
      "editor.rulers" = [ 100 120 ];
      "editor.formatOnType" = true;
    };

    # Select the tsdk for the workspace you are in
    "typescript.enablePromptUseWorkspaceTsdk" = true;
    "typescript.experimental.expandableHover" = true;
    "typescript.format.enable" = true;

    # We want the semicolons so lets add them
    "typescript.format.semicolons" = "insert";

    # Start by seeing all the context of an implementation, but if too much turn this off.
    "typescript.implementationsCodeLens.enabled" = true;

    # These might be annoying so we will have to adjust after using for a bit
    "typescript.inlayHints.enumMemberValues.enabled" = true;
    "typescript.inlayHints.functionLikeReturnTypes.enabled" = true;
    "typescript.inlayHints.parameterNames.enabled" = "literals";
    "typescript.inlayHints.parameterTypes.enabled" = true;
    "typescript.inlayHints.parameterNames.suppressWhenArgumentMatchesName" = true;
    "typescript.inlayHints.variableTypes.enabled" = true;
    "typescript.inlayHints.variableTypes.suppressWhenTypeMatchesName" = true;

    # Enable auto completion and suggestions for typescript
    "typescript.suggest.enabled" = true;
    "typescript.suggest.autoImports" = true;
    "typescript.suggest.completeFunctionCalls" = true;
    "typescript.referencesCodeLens.enabled" = true;

    "typescript.validate.enable" = true;

    "eslint.nodePath" = "${pkgs.nodejs_22}/lib/node_modules";
    "eslint.runtime" = "${pkgs.nodejs_22}/bin/node";

    # Enable eslint for typescript
    "eslint.validate" = [ "javascript" "javascriptreact" "typescript" "typescriptreact" ];
  };
}
