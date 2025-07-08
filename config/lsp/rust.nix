{ pkgs, extra-pkgs, ... }:

{
  vscodeExtensions = with extra-pkgs.extensions; [
    # This is the main rust extension for vscode
    open-vsx-release.rust-lang.rust-analyzer
  ] ++ (with pkgs.vscode-extensions; [
    # This is the debug tool needed for rust (lldb) on linux/mac
    #  (NOTE this has to be on stable, others are broken)
    #    https://marketplace.visualstudio.com/items?itemName=vadimcn.vscode-lldb
    vadimcn.vscode-lldb
  ]);

  packages = with pkgs; [
    # This is the lsp server, but requires access to cargo and rustc
    rust-analyzer

    rustc
    #rustup
    cargo

    # This is the debugger for rust code
    lldb
  ];

  vscodeSettings = {
    "[rust]" = {
      "editor.tabSize" = 4;
      "outline.showTypeParameters" = false;
      "editor.rulers" = [
        100
        120
      ];
    };
  };
}
