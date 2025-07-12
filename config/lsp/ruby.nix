{ pkgs, extra-pkgs, funcs, ... }:

{
  vscodeExtensions = with extra-pkgs.extensions; [
    # This is an extension providing support for ruby in vscode
    #    https://marketplace.visualstudio.com/items?itemName=rebornix.Ruby
    #vscode-marketplace.rebornix.ruby
    #  This is deprecated, will remove in the future

    # This is the language server for ruby
    #    https://marketplace.visualstudio.com/items?itemName=Shopify.ruby-lsp
    (funcs.safePkg vscode-marketplace [ "shopify" "ruby-lsp" ])
  ];

  packages = with pkgs; [
    ruby

    # This is the formatter for ruby
    rubocop
  ];

  vscodeSettings = {
    "[rubyLsp]" = {
      "editor.tabSize" = 2;
      "editor.rulers" = [ 100 120 ];
      "outline.showTypeParameters" = true;
    };

    "rubyLsp.formatter" = "rubocop";

    # "ruby.useBundler" = true; # run non-lint commands with bundle exec
    # "ruby.useLanguageServer" = true; # use the internal language server (see below)
    # "ruby.lint" = {
    #   "rubocop" = {
    #     "useBundler" = true;
    #   };
    # };
    # "ruby.format" = "rubocop"; # use rubocop for formatting
  };
}
