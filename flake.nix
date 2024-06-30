{
  description = "CarlDots' minimal build of ST with scrollback";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-24.05";
    utils.url = "github:numtide/flake-utils";
  };

  outputs = { nixpkgs, utils, ... }@inputs:
    utils.lib.eachDefaultSystem (system: let
      pkgs = import nixpkgs {
        inherit system;

        overlays = [
          (final: prev: {
            st = prev.st.overrideAttrs (old: {
              src = ./st;
            });
          })
        ];
      };
    in {
      packages.default = pkgs.st;
    });
}
