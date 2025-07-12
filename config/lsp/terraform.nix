{ pkgs, extra-pkgs, ... }:

{
  vscodeExtensions = with extra-pkgs.extensions; [
    # This is the official hashicorp terraform extension
    #    https://marketplace.visualstudio.com/items?itemName=HashiCorp.terraform
    vscode-marketplace.hashicorp.terraform
  ];

  packages = with pkgs; [
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
