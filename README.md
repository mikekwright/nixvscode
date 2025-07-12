Visual Studio Code (deterministic build in Nix)
======================================

I really like the deterministic structure that Nix has, I also do enjoy
visual studio code (I also really like neovim).  This repository is an
attempt to make the Visual Studio Code setup more deterministic for myself
as well as provide a means of breaking out my keybindings and settings
to smaller files where I add/configure for a given extension.

**NOTE:** I am not a nix guru, and am always learning how to do something
differently in nix (and I hope better), but I am not sure how idiomatic
my nix code is, so suggestions and thoughts are all greatly appreciated
while I try to get better.

Consuming
-------------------------------------

As this is a flake, there are a couple of different ways that you can consume
this flake.  I will outline them below, in hopes that it makes it easier
for others in the future.

### Single Run

The first option just dynamically pulls it down, assuming you have both nix
and flakes installed.

```bash
nix run https://github.com/mikekwright/nixvscode

# If you want to run void
nix run https://github.com/mikekwright/nixvscode#void
```

### Flake with NixOS

```nix
{
  ...

  inputs = {
    ...

    vscode = {
      url = "https://github.com/mikekwright/nixvscode"
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  # Configuration.nix
  {
    ...

    packages = [
      ...
      inputs.vscode.packages.${system}.default;
      ...
    ];
  };
}
```

References
----------------------------------------

* [VSCode Documentation](https://code.visualstudio.com/docs)
* [VSCode Settings Schema](https://code.visualstudio.com/docs/getstarted/settings)
* [VSCode Keybindings](https://code.visualstudio.com/docs/getstarted/keybindings)
* [VSCode Extensions](https://code.visualstudio.com/docs/editor/extension-marketplace)
* [Void Editor](https://voideditor.com/)

TODOs
--------------------------------------

* [ ] Get this working with Cursor
* [ ] Add insiders as another option
* [ ] Make the overall flake a little more consumable (overrides, etc.)
