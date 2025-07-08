# Copilot Instructions: Nix Support and Idiomatic Nix Code

## Project Focus
This project is primarily focused on nix delivering an application that is captured in a flake.  It uses multiple inputs, with nixpkgs. Uses idiomatic Nix code for configuration, packaging, and development environments. All code suggestions should prioritize Nix best practices and conventions.

## Guidelines for Copilot

- Prefer idiomatic Nix expressions and functional programming style.
- Use attribute sets, lists, and let/in bindings appropriately.
- Avoid unnecessary repetition; use abstraction and modularization where possible.
- When suggesting code for VS Code extensions or keybindings, use Nix patterns that are compatible with flakes and overlays.
- For package definitions, follow the conventions used in Nixpkgs.
- Use comments to explain non-obvious Nix constructs or patterns.
- When in doubt, refer to the official Nixpkgs manual and NixOS wiki for best practices.
- Avoid deprecated Nix syntax (e.g., prefer `with` only for imports, avoid `rec` unless necessary).
- Ensure that all code is compatible with the latest stable Nix and Nixpkgs.

## Example Patterns

- Use `map` for transforming lists.
- Use `lib` functions from Nixpkgs when available.
- Prefer `mkIf`, `mkMerge`, and other helpers for optionals and conditionals.
- Use `inherit` for passing attributes.

## Formatting
- Keep lines under 100 characters when possible.
- Use two spaces for indentation.

---

By following these instructions, Copilot will help maintain a high standard of Nix code quality and project consistency.
