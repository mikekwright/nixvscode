NixVSCode Docs
=========================================

This folder contains the useful docs for explaining and outlining
the solution and configuration that is being used.

Project Structure
-----------------------------------------

The repository structure is being configured so that it can include
multiple different "profiles" of the vscode solution so that it will
only run and include the specific parts desired.

root
├─ samples
│   ├── cplusplus
│   ├── dlang
│   ├── golang
│   └── ...
├─ lib
│   └── editors
├─ docs
│   └── ...
├─ packages
│   ├── minimal
│   ├── complete
│   ├── python
│   ├── frontend
│   ├── mobile
│   └── ...
├─ options
│   ├── lsp
│   ├── tools
│   └── ...
└─ common
    ├── theme
    ├── tools
    ├── shortcuts
    └── ...

Each of the main sections has a specific purpose and we will outline those below.

### samples

The `samples` sections contains folders that can be used to verify that
the plugins and packages are functioning as expected when working with
a given language or in a given paradigm.

### lib

The `lib` section has the "building" code that will combine the combination
of packages, common elements and configurations that will be used to
create the nix package that can be run in a system.

### docs

The folder this file resides in, and the folder that contains all the different
documents (including history of changes if needed) to explain the process
and how things get to the new flow.

### packages

This folder defines the different combinations of plugins, and configurations
that should be used to define a "unique" package system.

### common

As the name implies, all the common portions that will or be included
in all packages. This should be the general plugins, keyboard shortcuts,
and other items that should always exist.

### options

This folder contains the lsp, tools and other plugins that can be
combined to create a given package.  This folder should return a
list of "options" that can be enabled, much like the experience
that can be achived in nixos.
