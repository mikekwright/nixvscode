{ extra-pkgs, funcs, ... }:

{
  # Tried this on July 5th, 2025.  Did not really provide the expected support
  #   so dropping this extension
  vscodeExtensions = with extra-pkgs; [
    # This is a whichkey like flow for vscode
    #   https://marketplace.visualstudio.com/items?itemName=VSpaceCode.whichkey
    (funcs.safePkg vscode-marketplace-release [ "vspacecode" "whichkey" ])
  ];

  keybindings = [
    {
      key = "alt+space";
      command = "whichkey.show";
      when = "editorTextFocus";
    }
  ];
}
