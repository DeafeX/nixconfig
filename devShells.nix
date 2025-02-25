{
  inputs = {
    nixpkgs = import <nixpkgs>;
    rust-overlay = {
      url = "github:oxalica/rust-overlay";
      nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = { nixpkgs, rust-overlay }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        overlays = [ (import rust-overlay) ];
      };
      toolchain = pkgs.rust-bin.selectLatestNightlyWith (toolchain:
        toolchain.default.override {
          extensions = [ "rust-src" "cargo" "clippy" "rust-analyzer" ];
        }
      );
    in
    {
      devShells.${system} = {
        rust = with pkgs; mkShell {
          buildInputs = with pkgs; [ pkg-config toolchain ];
          shellHook = [ "nushell" ];
        };
      };
    };
}
