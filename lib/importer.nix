{ pkgs, debug, ... }:

let
  loadImports = m: args: if builtins.hasAttr "imports" m
    then builtins.map (i: ((import i) args) // { name=i; }) m.imports
    else [];

  mergeModule = m: args: 
    let
      childrenModules = debug.trace m (loadImports m args);

      # TODO: Would be nice to create a config section that could just update itself into
      #   the lua config (so more declarative), but that is a future piece of work.
      baseModule = {
        name = m.name or "default";
        vscodeExtensions = m.vscodeExtensions or [];
        vscodeSettings = m.vscodeSettings or {};
        vscodeKeybindings = m.vscodeKeybindings or [];
        packages = m.packages or [];
        startScript = m.startScript or "";
      };

      # This is the recursive check to basically pull all the other modules that we
      #   have.
      loadedChildren = builtins.map (m: mergeModule m args) childrenModules;

      completedMerge = builtins.foldl' (b: m: {
        vscodeExtensions = b.vscodeExtensions ++ m.vscodeExtensions;
        vscodeSettings = b.vscodeSettings // m.vscodeSettings;
        vscodeKeybindings = b.vscodeKeybindings ++ m.vscodeKeybindings;
        packages = b.packages ++ m.packages;
        startScript = b.startScript + m.startScript;
      }) baseModule loadedChildren;
    in 
      debug.trace completedMerge completedMerge;

in {
  makeModule = m: 
    let
      # The base module from flake is not a common module definition, this kicks off the
      #   process of building and loading all the modules in the system.
      fullModule = mergeModule (m.module m.extraSpecialArgs) m.extraSpecialArgs;

      # Module packages are any other 3rd party packages that are needed when running vscode
      modulePackages = if builtins.hasAttr "packages" fullModule
        then fullModule.packages
        else [];

      # Create VSCode settings JSON
      settingsJson = pkgs.writeText "settings.json" (builtins.toJSON fullModule.vscodeSettings);

      # Create VSCode keybindings JSON
      keybindingsJson = pkgs.writeText "keybindings.json" (builtins.toJSON fullModule.vscodeKeybindings);

      # Create VSCode extensions list
      extensionsJson = pkgs.writeText "extensions.json" (builtins.toJSON {
        recommendations = fullModule.vscodeExtensions;
      });

      # Create a Nix-managed VSCode user data directory with both files
      vscodeUserDataDir = pkgs.runCommand "vscode-user-data" {} ''
        mkdir -p $out/User
        cp ${settingsJson} $out/User/settings.json
        cp ${keybindingsJson} $out/User/keybindings.json
        cp ${extensionsJson} $out/extensions.json
      '';

      scriptText = fullModule.startScript;
    in pkgs.writeShellApplication {
      name = "vscode";
      runtimeInputs = [ 
        pkgs.vscode 
      ] ++ modulePackages;

      text = /*shell*/ ''
        set +u
        if [[ -n $VSCODE_DEBUG ]]; then
          echo 'VSCode Settings:'
          cat ${settingsJson}

          echo 'VSCode Keybindings:'
          cat ${keybindingsJson}

          echo 'VSCode Extensions:'
          cat ${extensionsJson}

          echo 'Startup scripts:'
          echo '${scriptText}'

          echo '-------------------------'
          echo "VSCode settings file path: ${settingsJson}" 
          echo "VSCode keybindings file path: ${keybindingsJson}" 
          echo "VSCode user data directory: ${vscodeUserDataDir}" 
        else
          ${scriptText}

          # Create a temporary directory for VSCode user data
          #TEMP_USER_DATA_DIR=$(mktemp -d)
          #echo "Using temporary VSCode user data directory: $TEMP_USER_DATA_DIR"
          # Create the User directory structure
          #mkdir -p "$TEMP_USER_DATA_DIR/User"
          
          # Copy our settings to the temporary directory
          #cp ${settingsJson} "$TEMP_USER_DATA_DIR/User/settings.json"
          
          # Copy our keybindings to the temporary directory
          #cp ${keybindingsJson} "$TEMP_USER_DATA_DIR/User/keybindings.json"
          
          # Run VSCode with the temporary user data directory
          #${pkgs.vscode}/bin/code --user-data-dir="$TEMP_USER_DATA_DIR" "$@"
          
          # Clean up the temporary directory when VSCode exits
          #rm -rf "$TEMP_USER_DATA_DIR"
          
          # ${pkgs.vscode}/bin/code "$@"

          # Run VSCode with the Nix-managed user data directory
          echo "Here we go"
          ${pkgs.vscode}/bin/code --user-data-dir="${vscodeUserDataDir}" "$@"
          echo $?
        fi
      '';
    };
}