{ pkgs, ... }:

{
  vscodeExtensions = with pkgs; [
    open-vsx-release.rust-lang.rust-analyzer
  ];

  packages = with pkgs; [
    # This is the lsp server, but requires access to cargo and rustc
    rust-analyzer

    rustc
    #rustup
    cargo
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
