{
  description = "A purescript project template";

  inputs =
    {
      nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

      flake-utils.url = "github:numtide/flake-utils";

      devshell.url = "github:numtide/devshell";

      ps-tools.follows = "purs-nix/ps-tools";

      # https://github.com/purs-nix/purs-nix
      purs-nix.url = "github:purs-nix/purs-nix/ps-0.15";
    };

  outputs = { nixpkgs, flake-utils, devshell, ... }@inputs:
    flake-utils.lib.eachSystem [ "x86_64-linux" ]
      (system:
        let
          pkgs = import nixpkgs {
            inherit system;

            overlays = [ devshell.overlay ];
          };
          ps-tools = inputs.ps-tools.legacyPackages.${system};
          purs-nix = inputs.purs-nix { inherit system; };

          # https://github.com/purs-nix/purs-nix/blob/master/docs/purs-nix.md#purs
          ps =
            purs-nix.purs
              {
                dependencies =
                  with purs-nix.ps-pkgs;
                  # Add what you need and comment out what you don't need
                  # https://pursuit.purescript.org/
                  [
                    prelude
                    numbers
                    integers
                    strings
                    lists
                    arrays
                    console
                    effect
                    aff
                    maybe
                    tuples
                    either
                    ordered-collections
                    transformers
                    validation
                    parsing
                    formatters
                    argonaut
                  ];

                dir = ./.;
              };

          # https://github.com/purs-nix/purs-nix/blob/master/docs/purs-nix.md#command
          pure-nix-cmd = ps.command {
            bundle.esbuild =
              {
                outfile = "dist/main.js";
              };
          };
        in
        {
          packages.default = ps.modules.Main.bundle { };

          devShells.default = pkgs.devshell.mkShell {
            devshell = {
              packages =
                with pkgs;
                [
                  entr
                  nodejs
                  pure-nix-cmd
                  ps-tools.for-0_15.purescript-language-server
                  purs-nix.esbuild
                  purs-nix.purescript

                  # formatter
                  # use purs-tidy instead of purty. see: https://github.com/nwolverson/vscode-ide-purescript/pull/204
                  nodePackages.purs-tidy
                ];

              motd = ''
                {bold}{14}🔨 PureScript DevShell 🔨{reset}
                $(type -p menu &>/dev/null && menu)
              '';
            };

            commands = [
              {
                name = "dev:help";
                category = "Dev";
                help = "Show purs-nix help";
                command = ''
                  purs-nix
                '';
              }
              {
                name = "dev:run";
                category = "Dev";
                help = "Run project";
                command = ''
                  purs-nix run
                '';
              }
              {
                name = "dev:watch";
                category = "Dev";
                help = "Watch project";
                command = ''
                  find src | entr -s 'echo bundling; purs-nix bundle'
                '';
              }
              {
                name = "dev:bundle";
                category = "Dev";
                help = "Bundle project and output to dist folder";
                command = ''
                  purs-nix bundle
                  echo "run 'node dist/main.js' to execute bundle"
                '';
              }
              {
                name = "dev:build";
                category = "Dev";
                help = "Build project derivation and create result symlink";
                command = ''
                  nix build
                  echo "run 'node result' to execute build result"
                '';
              }
            ];
          };
        }
      );
}
