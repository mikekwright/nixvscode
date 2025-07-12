{ pkgs, extra-pkgs, ... }:

{
  vscodeExtensions = with extra-pkgs.extensions; [
    # Erlang main extension
    #   https://marketplace.visualstudio.com/items?itemName=pgourlain.erlang
    vscode-marketplace.pgourlain.erlang

    # This is the elixir extension (adding with erlang)
    #   https://marketplace.visualstudio.com/items?itemName=JakeBecker.elixir-ls
    vscode-marketplace.jakebecker.elixir-ls
  ];

  packages = with pkgs; [
    erlang_28

    rebar3

    # This will be replaced by expert at some point
    #   https://github.com/lexical-lsp/lexical
    #   https://github.com/elixir-tools/expert-lsp.org
    lexical
  ];

  vscodeSettings = {
    "[erlang]" = {
      "editor.tabSize" = 2;
      "editor.rulers" = [ 100 120 ];
      "outline.showTypeParameters" = true;
    };
  };
}
