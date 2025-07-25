{ pkgs, extra-pkgs, funcs, ... }:

{
  vscodeExtensions = with extra-pkgs.extensions; [
    # This is the official python extension
    #    https://marketplace.visualstudio.com/items?itemName=ms-python.python
    (funcs.safePkg vscode-marketplace [ "ms-python" "python" ])

    # This is the official plugin for debugging python
    #    https://marketplace.visualstudio.com/items?itemName=ms-python.debugpy
    (funcs.safePkg vscode-marketplace [ "ms-python" "debugpy" ])

    # This is the python language server
    #    https://marketplace.visualstudio.com/items?itemName=ms-python.vscode-pylance
    (funcs.safePkg vscode-marketplace [ "ms-python" "vscode-pylance" ])

    # This is the black formatter
    #    https://marketplace.visualstudio.com/items?itemName=ms-python.black-formatter
    (funcs.safePkg vscode-marketplace [ "ms-python" "black-formatter" ])

    # This is the ruff formatter (much faster)
    #    https://marketplace.visualstudio.com/items?itemName=charliermarsh.ruff
    (funcs.safePkg vscode-marketplace [ "charliermarsh" "ruff" ])

    # This is the jupyter notebook extension needed for running notebooks
    #    https://marketplace.visualstudio.com/items?itemName=ms-toolsai.jupyter
    (funcs.safePkg vscode-marketplace [ "ms-toolsai" "jupyter" ])

    # This includes the slideshow cell in notebooks
    #    https://marketplace.visualstudio.com/items?itemName=ms-toolsai.vscode-jupyter-slideshow
    (funcs.safePkg vscode-marketplace [ "ms-toolsai" "vscode-jupyter-slideshow" ])

    # This adds tags for the notebook flow
    #    https://marketplace.visualstudio.com/items?itemName=ms-toolsai.vscode-jupyter-cell-tags
    (funcs.safePkg vscode-marketplace [ "ms-toolsai" "vscode-jupyter-cell-tags" ])

    # This is more of the advanced rendering for notebooks
    #    https://marketplace.visualstudio.com/items?itemName=ms-toolsai.jupyter-renderers
    (funcs.safePkg vscode-marketplace [ "ms-toolsai" "jupyter-renderers" ])
  ];

  packages = with pkgs; [
    ruff
    pyright
  ];

  vscodeSettings = {
    "[python]" = {
      "editor.tabSize" = 4;
      "editor.rulers" = [
        100
        120
      ];
      "editor.formatOnType" = true;
      # Lets use the ruff formatter
      "editor.defaultFormatter" = "charliermarsh.ruff";
      # We can ignore the black formatter for now
      #"editor.defaultFormatter" = "ms-python.black-formatter";
      #"editor.formatOnSave" = true;

      "editor.codeActionsOnSave" = {
        "source.fixAll" = "explicit";
        "source.organizeImports" = "explicit";
      };
    };

    "workbench.editorAssociations" = {
      "*.ipynb" = "jupyter-notebook";
    };

    "notebook.formatOnSave.enabled" = true;
    "notebook.codeActionsOnSave" = {
      "notebook.source.fixAll" = "explicit";
      "notebook.source.organizeImports" = "explicit";
    };

    "python.languageServer" = "Pylance";
    "python.analysis.typeCheckingMode" = "standard";
    "python.analysis.inlayHints.functionReturnTypes" = true;
    "python.analysis.inlayHints.variableTypes" = true;

    # This give copilot generated summaries
    "python.analysis.addHoverSummaries" = true;
    # Add pytest support in pylance
    "python.analysis.enablePytestSupport" = true;

    # This enhances the doc flow to allow for goto if it looks like a module
    #   going to start with this disabled
    "python.analysis.gotoDefinitionInStringLiteral" = false;

    # This is a marketing thing for A/B testing, if we want that, but will have it disabled now
    "python.experiments.enabled" = false;

    "python.analysis.fixAll" = [
      "source.unusedImports"
      "source.convertImportFormat"
    ];

    "python.analysis.aiCodeActions" = {
      "generateDocstring" = true;
      "convertFormatString" = true;
      "generateSymbol" = true;
    };

    "python.analysis.reportExtraTelemetry" = false;
  };
}
