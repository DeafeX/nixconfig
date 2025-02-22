{nixpkgs, rust-overlay, ...}@inputs:
let
  system = "x86_64-linux";
  pkgs = import nixpkgs {
    inherit system;
    overays = [ (import rust-overlay) ];
  };
in {
  rust = with pkgs; mkShell {
    packages = [
      pkg-config
      rust-bin.fromRustupToolchainFile ./rust-toolchain
    ];

  };
}
