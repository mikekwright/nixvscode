{ pkgs, extra-pkgs, is-void, ... }:

if is-void then 
  let
    x = 10;
  in {
    # This solution will allow for local model execution
    packages = with pkgs; [
      ollama
    ];
} else {
  # Code does not support Ollama, so not installing
}
