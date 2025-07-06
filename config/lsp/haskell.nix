{pkgs, ...}:

{
  vscodeExtensions = with pkgs; [
    # This is the official haskell plugin for vscode
    #    https://marketplace.visualstudio.com/items?itemName=haskell.haskell
    vscode-marketplace.haskell.haskell

    # This is required so that you get the language syntax, it is not pulled down automatically
    #    https://marketplace.visualstudio.com/items?itemName=justusadam.language-haskell
    vscode-marketplace.justusadam.language-haskell
  ];

  packages = with pkgs; [
    haskell-language-server
    cabal-install
    ghc
  ];

  vscodeSettings = {
    "haskell.serverExecutablePath" = "${pkgs.haskell-language-server}/bin/haskell-language-server";
  };
}
