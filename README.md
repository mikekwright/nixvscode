# VSCode config in nix

Starting on this template to get my VSCode configuration working with nix.

This template gives you a good starting point and hopefully a more declarative
and simple/clear process for working with VSCode.

## Configuring

To start configuring, just add or modify the nix files in `./config`.
If you add a new configuration file, remember to add it to the
[`config/default.nix`](./config/default.nix) file

## Testing your new configuration

To test your configuration simply run the following command

```bash
nix run .
```

## References

* [VSCode Documentation](https://code.visualstudio.com/docs)
* [VSCode Settings Schema](https://code.visualstudio.com/docs/getstarted/settings)
* [VSCode Keybindings](https://code.visualstudio.com/docs/getstarted/keybindings)
* [VSCode Extensions](https://code.visualstudio.com/docs/editor/extension-marketplace)

## TODOs

* Install [Vim extension](https://marketplace.visualstudio.com/items?itemName=vscodevim.vim)
* Look at [GitLens extension](https://marketplace.visualstudio.com/items?itemName=eamodio.gitlens)
* Install [k8s support](https://marketplace.visualstudio.com/items?itemName=ms-kubernetes-tools.vscode-kubernetes-tools)
* Decide [Should I use the auto-session (project kind of)](https://marketplace.visualstudio.com/items?itemName=ruakr.vscode-auto-session)
* Look at [Surround that helps surround text](https://marketplace.visualstudio.com/items?itemName=formulahendry.auto-rename-tag)
* Try out [IntelliCode](https://marketplace.visualstudio.com/items?itemName=VisualStudioExptTeam.vscodeintellicode)
* Can also see [Jira plugin for vscode](https://marketplace.visualstudio.com/items?itemName=Atlassian.atlascode)
