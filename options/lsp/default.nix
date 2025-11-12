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
    ./nix.nix

    ./ocaml.nix
    ./python.nix
    ./ruby.nix
    ./rust.nix

    ./scala.nix
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
    #
    # Person view of general Clean Code Principles
    #
    "Write code that is easy to unit test"
    "Write code that is easy to read"
    "Write code that is easy to extend"
    "Write code that is easy to create unit tests for"
    "Prefer variables that are immutable."
    "Prefer functional programming paradigms."
    "Always create idiomatic code"

    # Comments and Names
    "Never use single variable name, except for i and j in loops."
    "Use meaningful variable and function names."
    "Avoid adding comments that explain what the code does; instead, write code that is clear and understandable on its own."
    "Ensure code is self-documenting through clear naming and small functions."

    # Start with a clear solution, don't over-engineer
    "Avoid unnecessary complexity and strive for simplicity."
    "Avoid premature optimization; focus on clarity first."
    "Create code that utilizes design patterns when able."
    "Use appropriate data structures and algorithms for the task."

    # More specific instructions
    "Do your best to follow the DRY (Don't Repeat Yourself) principle."
    "Ensure code is modular and reusable."
    "Ensure code follows inversion of control principles."
  ];

  aiTWestInstructions = funcs.buildAiInstructions [
    #
    # Best practices for tests IMO
    #
    "Write unit tests for all code."
    "Never patch or monkey patch in tests."
    "Always use mocks to keep tests limited to system under test."
    "Follow the Arrange-Act-Assert pattern in tests."
    "Use assertions to verify expected behavior in tests."
    "Use descriptive assertions to clarify intent."
    "Create tests that cover both happy path and edge cases."

    # Test naming
    "Ensure tests are self-documenting through clear naming and small functions."
    "Name tests with clear names that follow AAA (Arrange-Act-Assert) pattern."

    # Test specifics
    "Use parameterized tests to cover multiple scenarios with the same logic when possible."
    "Write tests that are deterministic and do not rely on external state."
    "Enhance test clarity by focusing on a single assertion per test."
    "Ensure unit tests are fast."
    "Ensure unit tests can be run in parallel."
    "Avoid using magic numbers in tests; use constants or variables."

    # Other considerations
    "If needed, use setup and teardown methods to prepare and clean up test environments."
    "Prefer unit tests over integration tests for individual components."
    "Include at least one integration test per 10 unit tests."
    "Use test-driven development (TDD) principles where applicable."
    "Write integration tests to ensure components work together as expected."
  ];
}

#
# Extra notes
#
#  VSCode has builtin support for markdown
#     https://code.visualstudio.com/docs/languages/markdown
#
