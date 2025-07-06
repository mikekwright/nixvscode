{ pkgs, debug, extra-pkgs, ... }:

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
        keybindings = m.keybindings or [];
        packages = m.packages or [];
        startScript = m.startScript or "";
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
      keybindingsJson = pkgs.writeText "keybindings.json" (builtins.toJSON fullModule.keybindings);

      # Create VSCode extensions list
      extensionsJson = pkgs.writeText "extensions.json" (builtins.toJSON {
        recommendations = fullModule.vscodeExtensions;
      });

      # Create a Nix-managed VSCode user data directory with both files
      vscodeUserDataDir = pkgs.runCommand "vscode-user-data" {} ''
        mkdir -p $out/User
        cp ${settingsJson} $out/User/settings.json
        cp ${keybindingsJson} $out/User/keybindings.json
        cp ${extensionsJson} $out/User/extensions.json
      '';

      scriptText = fullModule.startScript;

      vscode-wrapper = pkgs.vscode-with-extensions.override {
        vscode = pkgs.vscode-fhs;
        vscodeExtensions = ([
          # This is an input from the nixpkgs extensions list (works fine)
          #pkgs.vscode-extensions.ziglang.vscode-zig

          # This is an open source test with the overlay (works)
          #pkgs.open-vsx-release.rust-lang.rust-analyzer

          # This is an example of an non-opensource extensions
          #pkgs.vscode-marketplace.golang.go
        ]) ++ fullModule.vscodeExtensions;
      };

      vscodeApp = pkgs.writeShellApplication {
        name = "code";
        runtimeInputs = [
          #pkgs.vscode
          vscode-wrapper
        ] ++ modulePackages;


        #
        # NOTE: When using vscode, you need to set it up in a writable directly for the user directory
        #   this is because vscode creates a number of other files, and if it can't create those files
        #   it will just crash.
        #
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
          elif [[ -n $VSCODE_TEMP ]]; then
            ${scriptText}

            # Create a temporary directory for VSCode user data
            TEMP_USER_DATA_DIR=$(mktemp -d)
            echo "using temporary vscode user data directory: $TEMP_USER_DATA_DIR"

            # Make sure the User portion of the directory exists (path for settings)
            mkdir -p "$TEMP_USER_DATA_DIR/User"

            # copy our settings to the temporary directory
            cp ${settingsJson} "$TEMP_USER_DATA_DIR/User/settings.json"
            chmod 444 "$TEMP_USER_DATA_DIR/User/settings.json"

            # copy our keybindings to the temporary directory
            cp ${keybindingsJson} "$TEMP_USER_DATA_DIR/User/keybindings.json"
            chmod 444 "$TEMP_USER_DATA_DIR/User/keybindings.json"

            # Run VSCode with the Nix-managed user data directory
            echo "${pkgs.vscode}/bin/code --user-data-dir=$TEMP_USER_DATA_DIR"
            ${vscode-wrapper}/bin/code --user-data-dir="$TEMP_USER_DATA_DIR" "$@"

            if [[ -z $SKIP_VSCODE_CLEAN ]]; then
              # Clean up the temporary directory when VSCode exits
              #  TODO: We can't clean up the directories as vscode runs in another thread
              #  and this kills it to quickly
              #rm -rf "$TEMP_USER_DATA_DIR"
              echo "Cant delete right now"
            else
              echo "Ignored cleanup of temp directory $TEMP_USER_DATA_DIR"
            fi;
          else
            ${scriptText}

            echo "Using VSCode for user home directory: $HOME/.vscode"
            if [[ ! -d "$HOME/.config/Code" ]]; then
              mkdir -p "$HOME/.config/Code/User"
            fi

            # copy our settings to the temporary directory
            if [[ -e "$HOME/.config/Code/User/settings.json" ]]; then
              echo "Found existing settings.json, removing it"
              rm -f "$HOME/.config/Code/User/settings.json.bak"
              mv "$HOME/.config/Code/User/settings.json" "$HOME/.config/Code/User/settings.json.bak"
            fi
            cp ${settingsJson} "$HOME/.config/Code/User/settings.json"
            chmod 444 "$HOME/.config/Code/User/settings.json"

            # copy our keybindings to the temporary directory
            if [[ -e "$HOME/.config/Code/User/keybindings.json" ]]; then
              echo "Found existing keybindings.json, removing it"
              rm -f "$HOME/.config/Code/User/keybindings.json.bak"
              mv "$HOME/.config/Code/User/keybindings.json" "$HOME/.config/Code/User/keybindings.json.bak"
            fi
            cp ${keybindingsJson} "$HOME/.config/Code/User/keybindings.json"
            chmod 444 "$HOME/.config/Code/User/keybindings.json"

            # Run VSCode with the User's directory
            echo "${pkgs.vscode}/bin/code --user-data-dir=$TEMP_USER_DATA_DIR"
            ${vscode-wrapper}/bin/code --user-data-dir="$TEMP_USER_DATA_DIR" "$@"
          fi
        '';
      };

    in pkgs.stdenv.mkDerivation rec {
      name = "code";
      buildCommand = let
        desktopEntry = pkgs.makeDesktopItem {
          inherit name;
          desktopName = "Visual Studio Code";
          exec = "${vscodeApp}/bin/${name} %f";
          terminal = true;
        };
      in ''
        mkdir -p $out/bin
        cp ${vscodeApp}/bin/${name} $out/bin
        mkdir -p $out/share/applications
        cp ${desktopEntry}/share/applications/${name}.desktop $out/share/applications/${name}.desktop
      '';
      dontBuild = true;
    };
}

