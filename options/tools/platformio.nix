{ pkgs, extra-pkgs, funcs, options, ... }:

{
  # NOTE: This requires the C/C++ extensions be included for the
  #   platformio solution to work with vscode
  vscodeExtensions = with extra-pkgs.extensions; options.extensions "tools.platformio" [
    # Nginx main extension
    #   https://marketplace.visualstudio.com/items?itemName=nginx.vscode-nginx
    (funcs.safePkg vscode-marketplace [ "platformio" "platformio-ide" ])
  ];

  packages = options.packages "tools.platformio" [
  ];

  vscodeSettings = {
    # "[nginx]" = {
    #   "editor.tabSize" = 2;
    #   "editor.rulers" = [ 80 120 ];
    #   "outline.showTypeParameters" = true;
    # };
  };
}
