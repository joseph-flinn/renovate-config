{
  description = "renovate-config";
  inputs = { nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable"; };

  outputs = { self, nixpkgs, flake-utils}:
    flake-utils.lib.eachDefaultSystem (system:
      let
        #pkgs = nixpkgs.legacyPackages.x86_64-linux.pkgs;
        pkgs = nixpkgs.legacyPackages.${system};
        packageName = "renovate-config";
      in {
        devShells.default = pkgs.mkShell {
          name = "${packageName}";
          buildInputs = [
            pkgs.nodejs
          ];
          shellHook = ''
            echo "Welcome to '${packageName}'"
            export PS1="\[\e[1;33m\][nix(${packageName})]\$\[\e[0m\] "
          '';
        };
      }
    );
}
