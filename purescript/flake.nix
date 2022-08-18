{
  description = "A purescript project template";

  inputs =
    {
      nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

      flake-utils.url = "github:numtide/flake-utils";

      ps-tools.follows = "purs-nix/ps-tools";

      # https://github.com/purs-nix/purs-nix
      purs-nix.url = "github:purs-nix/purs-nix/ps-0.15";
    };

  outputs = { nixpkgs, flake-utils, ... }@inputs:
    flake-utils.lib.eachSystem [ "x86_64-linux" "x86_64-darwin" ]
      (system:
        let
          pkgs = nixpkgs.legacyPackages.${system};
          ps-tools = inputs.ps-tools.legacyPackages.${system};
          purs-nix = inputs.purs-nix { inherit system; };

          ps =
            purs-nix.purs
              {
                dependencies =
                  with purs-nix.ps-pkgs;
                  [
                    prelude
                    console
                    effect
                    lists
                    numbers
                    math
                  ];

                dir = ./.;
              };
        in
        {
          packages.default = ps.modules.Main.bundle { };

          devShells.default =
            pkgs.mkShell
              {
                packages =
                  with pkgs;
                  [
                    entr
                    nodejs
                    (ps.command { })
                    ps-tools.for-0_15.purescript-language-server
                    purs-nix.esbuild
                    purs-nix.purescript

                    # formatter
                    # use purs-tidy instead of purty. see: https://github.com/nwolverson/vscode-ide-purescript/pull/204
                    nodePackages.purs-tidy
                  ];

                shellHook =
                  ''
                    alias watch="find src | entr -s 'echo bundling; purs-nix bundle'"
                  '';
              };
        }
      );
}
