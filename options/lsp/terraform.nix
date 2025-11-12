{ pkgs, extra-pkgs, funcs, options, ... }:

{
  vscodeExtensions = with extra-pkgs.extensions; options.extensions "lsp.terraform" [
    # This is the official hashicorp terraform extension
    #    https://marketplace.visualstudio.com/items?itemName=HashiCorp.terraform
    (funcs.safePkg vscode-marketplace [ "hashicorp" "terraform" ])
  ];

  packages = with pkgs; options.packages "lsp.terraform" [
    terraform-ls
  ];

  vscodeSettings = {
    #  Going to disable for now, but maybe enable later
    #"terraform.validation.enableEnhancedValidation" = false;

    "[terraform]" = {
      "editor.defaultFormatter" = "hashicorp.terraform";
      "editor.formatOnSave" = true;
      "editor.formatOnSaveMode" = "file";
    };

    "[terraform-vars]" = {
      "editor.defaultFormatter" = "hashicorp.terraform";
      "editor.formatOnSave" = true;
      "editor.formatOnSaveMode" = "file";
    };
  };
}
