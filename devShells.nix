let system = "x86_64-linux";
in  rec {
  mkShell = { names, extraInputs ? [], overlays ? [] }:
  {
    inputs = shells.rust.inputs;
    outputs = {nixpkgs, ...}@inputs:
    let
      pkgs = import nixpkgs {
        inherit system overlays;
      };
    in {
      devShells.${system}.default = builtins.listToAttrs (builtins.map (x: {name = x; value = pkgs.mkShell shells.${x}.shellArg pkgs;}) names);
    };
  };
  shells = {
    rust = rec {
      inputs = {
        rust-overlay = {
          url = "github:oxalixa/rust-overlay";
          nixpkgs.follows = "nixpkgs";
        };
      };
      shellArg = pkgs: {
          buildInputs = with pkgs; [
            pkg-config
                      ];
          shellHook = "nu";
        };
    };
  };
}
