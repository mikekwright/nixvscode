{ pkgs, extra-pkgs, funcs, options, system, ... }:

{
  # NOTE: This requires the C/C++ extensions be included for the
  #   platformio solution to work with vscode
  vscodeExtensions = with extra-pkgs.extensions; options.extensions "tools.platformio" [
    # Nginx main extension
    #   https://marketplace.visualstudio.com/items?itemName=nginx.vscode-nginx
    (funcs.safePkg vscode-marketplace [ "platformio" "platformio-ide" ])
  ];

  packages = with pkgs; options.packages "tools.platformio" [
    platformio-core
  ] ++ (if (builtins.elem system pkgs.lib.platforms.linux) then [
    platformio
  ] else [ ]);

  vscodeSettings = {
    # "[nginx]" = {
    #   "editor.tabSize" = 2;
    #   "editor.rulers" = [ 80 120 ];
    #   "outline.showTypeParameters" = true;
    # };
  };
}
