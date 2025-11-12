{ pkgs, extra-pkgs, funcs, options, ...}:

{
  vscodeExtensions = with extra-pkgs.extensions; options.extensions "lsp.haskell" [
    # This is the official haskell plugin for vscode
    #    https://marketplace.visualstudio.com/items?itemName=haskell.haskell
    (funcs.safePkg vscode-marketplace [ "haskell" "haskell" ])

    # This is required so that you get the language syntax, it is not pulled down automatically
    #    https://marketplace.visualstudio.com/items?itemName=justusadam.language-haskell
    (funcs.safePkg vscode-marketplace [ "justusadam" "language-haskell" ])
  ];

  packages = with pkgs; options.packages "lsp.haskell" [
    haskell-language-server
    cabal-install
    ghc
  ];

  vscodeSettings = options.packages "lsp.haskell" {
    "haskell.serverExecutablePath" = "${pkgs.haskell-language-server}/bin/haskell-language-server";
  };
}
