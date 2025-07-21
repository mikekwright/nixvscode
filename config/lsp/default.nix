{ pkgs, funcs, ... }:

{
  name = "lsp";

  imports = [
    # This is not currently working
    #./cobol.nix

    ./cplusplus.nix
    ./csharp.nix

    ./dart.nix
    ./dlang.nix
    ./erlang.nix
    ./golang.nix

    ./haskell.nix
    ./java.nix
    ./lua.nix
    ./markdown.nix
    ./nix.nix

    ./ocaml.nix
    ./python.nix
    ./ruby.nix
    ./rust.nix

    ./scala.nix
    ./shell.nix
    ./terraform.nix
    ./typescript.nix
    ./zig.nix
  ];

  packages = with pkgs; [
    markdownlint-cli
    statix

    dioxus-cli # Provides dx for dxfmt
  ];

  aiGenerationInstructions = funcs.buildAiInstructions [
    "Never use single variable name, except for i and j in loops."
    "Focus on self documenting code that is easy to read and understand."
    "Avoid adding comments that explain what the code does; instead, write code that is clear and understandable on its own."
    "Avoid unnecessary complexity and strive for simplicity."
    "Ensure code is self-documenting through clear naming and small functions."
    "Avoid premature optimization; focus on clarity first."
    "Create code that follows a design pattern when applicable."
    "Write code that is easy to unit test, read and maintain."
    "Do your best to follow the DRY (Don't Repeat Yourself) principle."
    "Use idiomatic constructs of the language."
    "Use appropriate data structures and algorithms for the task."
    "Prefer immutability where possible."
    "Use meaningful variable and function names."
    "Prefer functional programming paradigms when possible."
    "Ensure code is modular and reusable."
    "Ensure code follows inversion of control principles."
  ];

  aiTestInstructions = funcs.buildAiInstructions [
    "Prefer unit tests over integration tests for individual components."
    "Use test-driven development (TDD) principles where applicable."
    "Ensure tests are self-documenting through clear naming and small functions."
    "Enhance test clarity by focusing on a single assertion per test."
    "Write tests that are deterministic and do not rely on external state."
    "Name tests with clear names that follow AAA (Arrange-Act-Assert) pattern."
    "Ensure tests are fast and run in isolation."
    "Create tests that cover both happy path and edge cases."
    "Ensure tests can run in parallel without interference."
    "Use descriptive assertions to clarify intent."
    "Avoid using magic numbers in tests; use constants or variables."
    "Use setup and teardown methods to prepare and clean up test environments."
    "Use parameterized tests to cover multiple scenarios with the same logic when possible."
    "Use assertions to verify expected behavior in tests."
    "Follow the Arrange-Act-Assert pattern in tests."
    "Use mocking frameworks where appropriate to isolate dependencies."
    "Write integration tests to ensure components work together as expected."
    "Do not write tests that use code patching or monkey patching techniques."
  ];
}

#
# Extra notes
#
#  VSCode has builtin support for markdown
#     https://code.visualstudio.com/docs/languages/markdown
#
