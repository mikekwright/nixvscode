{ funcs, ... }:

{
  vscodeSettings = {
    "zenMode.fullScreen" = true;
    "zenMode.centerLayout" = true;
    "zenMode.hideLineNumbers" = false;
    "zenMode.hideActivityBar" = true;
    "zenMode.hideStatusBar" = true;
  };

  keybindings = with funcs; [
    (vimKey {
      key = "ctrl+k z";
      command = "workbench.action.toggleZenMode";
      when = [ when.editor ];
    })

    (vimKey {
      key = ", w f";
      command = "workbench.action.toggleZenMode";
      when = [
        when.vim-editor
      ];
    })
  ];
}
