{ ... }:

{
  keybindings = [
    #
    # VSCode AI Chat and support shortcuts
    #
    {
      key = ", a a";
      command = "workbench.action.chat.openAgent";
      when = "editorTextFocus && vim.active && vim.mode != 'Insert'";
    }
    
    {
      key = ", a e";
      command = "github.copilot.chat.explain.palette";
      when = "editorTextFocus && vim.active && vim.mode != 'Insert' && !github.copilot.interactiveSession.disabled";
    }
    
    {
      key = ", a r";
      command = "github.copilot.chat.review";
      when = "editorTextFocus && vim.active && vim.mode != 'Insert' && !github.copilot.interactiveSession.disabled";
    }

    {
      key = ", a f";
      command = "github.copilot.chat.fix";
      when = "editorTextFocus && vim.active && vim.mode != 'Insert' && !github.copilot.interactiveSession.disabled";
    }
    
    {
      key = ", a g t";
      command = "github.copilot.chat.generateTests";
      when = "editorTextFocus && vim.active && vim.mode != 'Insert' && !github.copilot.interactiveSession.disabled";
    }
    
    {
      key = ", a g c";
      command = "github.copilot.chat.generate";
      when = "editorTextFocus && vim.active && vim.mode != 'Insert' && !github.copilot.interactiveSession.disabled";
    }
    
    {
      key = ", a g d";
      command = "github.copilot.chat.generateDocs";
      when = "editorTextFocus && vim.active && vim.mode != 'Insert' && !github.copilot.interactiveSession.disabled";
    }

    {
      key = ", a h";
      command = "editor.action.showHover";
      when = "editorTextFocus && vim.active && vim.mode != 'Insert'";
    }

    {
      key = ", a c";
      command = "workbench.action.chat.toggle";
      when = "editorTextFocus && vim.active && vim.mode != 'Insert' && !github.copilot.interactiveSession.disabled";
    }
    
    {
      key = "ctrl+a";
      command = "workbench.action.chat.toggle";
      when = "chatInputHasFocus";
    }
  ];
}
