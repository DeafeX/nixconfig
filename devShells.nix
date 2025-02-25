{
  __functor = (self: x: {
    inputs = self.inputs;
    outputs = {...}@inputs: {
      default = (self.outputs inputs).${x.name}.overrideAttrs (x.derivation inputs);
    };
  });
  extension = {}; 
  inputs = {
    nixpkgs= import <nixpkgs>;
    rust-overlay = {
      url = "github:oxalica/rust-overlay";
      nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = {nixpkgs, rust-overlay }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        overlays = [ (import rust-overlay) ];
      };
      toolchain = pkgs.rust-bin.selectLatestNightlyWith (toolchain:
        toolchain.default.override {
          extensions = [ "rust-src" "cargo" "clippy" "rust-analyzer" ];
        });
    in {
      rust = with pkgs; mkShell {
        buildInputs = [ pkg-config toolchain ];
        shellHook = ["nushell"];
      };
    };
}
