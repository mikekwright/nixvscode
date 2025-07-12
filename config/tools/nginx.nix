{ pkgs, extra-pkgs, funcs, ... }:

{
  vscodeExtensions = with extra-pkgs.extensions; [
    # Nginx main extension
    #   https://marketplace.visualstudio.com/items?itemName=nginx.vscode-nginx
    (funcs.safePkg vscode-marketplace [ "ahmadalli" "vscode-nginx-conf" ])
  ];

  packages = with pkgs; [
    nginx
  ];

  vscodeSettings = {
    "[nginx]" = {
      "editor.tabSize" = 2;
      "editor.rulers" = [ 80 120 ];
      "outline.showTypeParameters" = true;
    };
  };
}