{ pkgs, extra-pkgs, funcs, ... }:

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

  aiGenerationInstructions = funcs.buildLangAiInstructions "rust" [
    "Focus on idiomatic Rust code."
    "Use traits when possible and the Derive trait"
    "Prefer using `match` over `if let` for pattern matching."
    "Use `Option` and `Result` return types for error handling."
    "Use `thiserror` or `anyhow` for error handling."
    "Leverage Rust's ownership model to avoid unnecessary cloning."
    "Use `async` and `await` for asynchronous programming."
    "Prefer using `for` loops over `while` loops for iteration."
    "Use `serde` for serialization and deserialization of data structures."
    "Use `tokio` over `async-std` for asynchronous programming."
    "Use `rayon` for parallel processing when appropriate."
    "Use `diesel` or `sqlx` for database interactions."
    "Use `reqwest` or `hyper` for HTTP requests."
    "Use `log` or `tracing` for logging."
    "Use `clap` or `structopt` for command-line argument parsing."
    "Use `serde_json` for JSON serialization and deserialization."
    "Use `regex` for regular expressions."
    "Use `chrono` for date and time handling."
  ];

  aiTestInstructions = funcs.buildLangAiInstructions "rust" [
    "Prefer using `cargo test` for unit testing."
    "Prefer using built-in test framework."
    "Use `mockall` for mocking dependencies in tests."
    "Use `rstest` for parameterized tests."
  ];
}
