# The builder will create the module for a single application
#    This means, builder will be called twice, with different
#    package,extension possibilties.  (enables different versions of the apps)
{ pkgs, debug, ... }:

let
  loadImports = m: args:
    if builtins.hasAttr "imports" m then
      builtins.map (i: ((import i) args) // { name = i; }) m.imports
    else
      [ ];

  mergeModule = m: args:
    let
      childrenModules = debug.trace m (loadImports m args);

      # TODO: Would be nice to create a config section that could just update itself into
      #   the lua config (so more declarative), but that is a future piece of work.
      baseModule = {
        name = m.name or "default";
        vscodeExtensions = m.vscodeExtensions or [ ];
        vscodeSettings = m.vscodeSettings or { };
        keybindings = m.keybindings or [ ];
        packages = m.packages or [ ];
        startScript = m.startScript or "";
        aiGenerationInstructions = m.aiGenerationInstructions or [ ];
        aiTestInstructions = m.aiTestInstructions or [ ];
      };

      # This is the recursive check to basically pull all the other modules that we
      #   have.
      loadedChildren = builtins.map (m: mergeModule m args) childrenModules;

      completedMerge = builtins.foldl' (b: m: {
        vscodeExtensions = b.vscodeExtensions ++ m.vscodeExtensions;
        vscodeSettings = b.vscodeSettings // m.vscodeSettings;
        keybindings = b.keybindings ++ m.keybindings;
        packages = b.packages ++ m.packages;
        startScript = b.startScript + m.startScript;
        aiGenerationInstructions = b.aiGenerationInstructions ++ m.aiGenerationInstructions;
        aiTestInstructions = b.aiTestInstructions ++ m.aiTestInstructions;
      }) baseModule loadedChildren;
    in debug.trace completedMerge completedMerge;

  make-code-app = {
    app-wrapper,
    executable,
    modulePackages,
    settingsJson,
    keybindingsJson,
    extensionsJson,
    scriptText,
    userDataDir,
  }: pkgs.writeShellApplication {
    name = executable; # "code" or "void";
    runtimeInputs = [ app-wrapper pkgs.jq ] ++ modulePackages;

    #
    # NOTE: When using vscode, you need to set it up in a writable directly for the user directory
    #   this is because vscode creates a number of other files, and if it can't create those files
    #   it will just crash.
    #
    text = /*bash*/ ''
      set +u
      if [[ -n $CODE_DEBUG ]]; then
        echo 'Settings:'
        cat ${settingsJson}

        echo 'Keybindings:'
        cat ${keybindingsJson}

        echo 'Extensions:'
        cat ${extensionsJson}

        echo 'Startup scripts:'
        echo '${scriptText}'

        echo '-------------------------'
        echo "settings file path: ${settingsJson}"
        echo "keybindings file path: ${keybindingsJson}"
        echo "user data directory: ${userDataDir}"
        exit 0
      fi

      USER_DATA_DIR="${userDataDir}"
      echo "using user data directory: $USER_DATA_DIR"
      if [[ -n $CODE_TEMP_DIR ]]; then
        TEMP_USER_DATA_DIR=$(mktemp -d)
        echo "using temporary vscode user data directory: $TEMP_USER_DATA_DIR"
        USER_DATA_DIR="$TEMP_USER_DATA_DIR"
        # NOTE: Can not cleanup the temp directory until app is closed
      fi

      mkdir -p "$USER_DATA_DIR/User"

      ${scriptText}

      rm -f "$USER_DATA_DIR/User/settings.json"
      echo "// This file is generated by the NixOS module system, do not edit it directly." > "$USER_DATA_DIR/User/settings.json"
      jq . ${settingsJson} >> "$USER_DATA_DIR/User/settings.json"
      echo "// This file is generated by the NixOS module system, do not edit it directly." >> "$USER_DATA_DIR/User/settings.json"
      chmod 444 "$USER_DATA_DIR/User/settings.json"

      rm -f "$USER_DATA_DIR/User/keybindings.json"
      echo "// This file is generated by the NixOS module system, do not edit it directly." > "$USER_DATA_DIR/User/keybindings.json"
      jq . ${keybindingsJson} >> "$USER_DATA_DIR/User/keybindings.json"
      echo "// This file is generated by the NixOS module system, do not edit it directly." >> "$USER_DATA_DIR/User/keybindings.json"
      chmod 444 "$USER_DATA_DIR/User/keybindings.json"

      # Run in temp directory
      echo "${app-wrapper}/bin/${executable} --user-data-dir=$USER_DATA_DIR"
      ${app-wrapper}/bin/${executable} --user-data-dir="$USER_DATA_DIR" "$@"
    '';
  };
in
  # This is returning the function on import
  m: {
    vscode-pkg,
    executable,
    userDataDir,
    desktopName,
    mimeTypes ? [ ],
   }:
    let
      # The base module from flake is not a common module definition, this kicks off the
      #   process of building and loading all the modules in the system.
      fullModule = mergeModule (m.module m.extraSpecialArgs) m.extraSpecialArgs;

      # Module packages are any other 3rd party packages that are needed when running vscode
      modulePackages = if builtins.hasAttr "packages" fullModule then
        pkgs.lib.lists.unique fullModule.packages
      else
        [ ];

      settingsWithInstructions = fullModule.vscodeSettings // {
        "github.copilot.chat.codeGeneration.instructions" = fullModule.aiGenerationInstructions; # = map (t: { "text" = t; }) fullModule.aiGenerationInstructions;
        "github.copilot.chat.testGeneration.instructions" = fullModule.aiTestInstructions; # map (t: { "text" = t; }) fullModule.aiTestInstructions;
      };

      # Create VSCode settings JSON
      settingsJson = pkgs.writeText "settings.json"
        (builtins.toJSON settingsWithInstructions);

      # Create VSCode keybindings JSON
      keybindingsJson = pkgs.writeText "keybindings.json"
        (builtins.toJSON fullModule.keybindings);

      # Create VSCode extensions list
      extensionsJson = pkgs.writeText "extensions.json"
        (builtins.toJSON { recommendations = fullModule.vscodeExtensions; });

      scriptText = fullModule.startScript;

      wrapper = pkgs.vscode-with-extensions.override {
        vscode = vscode-pkg;
        # inherit (extra-pkgs.vscode-pkg) vscode;

        vscodeExtensions = pkgs.lib.lists.unique ([
          # This is an input from the nixpkgs extensions list (works fine)
          #pkgs.vscode-extensions.ziglang.vscode-zig

          # This is an open source test with the overlay (works)
          #pkgs.open-vsx-release.rust-lang.rust-analyzer

          # This is an example of an non-opensource extensions
          #pkgs.vscode-marketplace.golang.go
        ] ++ (builtins.filter (x: x != null) fullModule.vscodeExtensions));
        # NOTE: We added the above filter so the check function can return null
      };

      app = make-code-app {
        inherit executable userDataDir modulePackages settingsJson keybindingsJson extensionsJson scriptText;

        app-wrapper = wrapper;
      };
   in
      pkgs.stdenv.mkDerivation rec {
        inherit executable desktopName;
        name = executable;

        buildCommand = let
          desktopEntry = pkgs.makeDesktopItem {
            inherit desktopName;

            # Using this name as this is the one the mimetype uses to open things
            name = executable;
            comment = "Code Editing. Redefined.";
            icon = "vscode";
            genericName = "Text Editor";
            exec = "${app}/bin/${executable} %f";
            terminal = false;
            categories = [ "TextEditor" "Development" "IDE" ];
            keywords = [ executable ];
            mimeTypes = mimeTypes;
            actions = {
              "new-emtpy-window" = {
                name = "New Empty Window";
                exec = "${app}/bin/${executable} --new-window %f";
                icon = "vscode";
              };
            };
          };
        in ''
          mkdir -p $out/bin
          cp ${app}/bin/${executable} $out/bin
          mkdir -p $out/share/applications
          cp ${desktopEntry}/share/applications/${executable}.desktop $out/share/applications/${executable}.desktop
        '';
        dontBuild = true;
      }
