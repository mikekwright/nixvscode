{ pkgs, ... }:

{
  vscodeSettings = {
    "chat.agent.enabled" = true;
    "chat.commandCenter.enabled" = true;

    # The below is experimental as of July 5th, 2025
    "chat.useFileStorage" = true;
  };

}
