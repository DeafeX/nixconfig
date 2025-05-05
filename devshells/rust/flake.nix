{
  outputs = {nixpkgs ? "nixpkgs", ...}:
  let
    pkgs = import nixpkgs {
      system = "x86_64-linux";
    };
  in {
    devShells.x86_64-linux.default = pkgs.mkShell {
      packages = with pkgs; [
        cargo
        rustc
        rustfmt
        rust-analyzer
        clippy
        pkg-config
        openssl
      ];
      RUST_SRC_PATH = pkgs.rust.packages.stable.rustPlatform.rustLibSrc;
      PKG_CONFIG_PATH = "${pkgs.openssl.dev}/lib/pkgconfig";
      shellHook = "nu";
    };
  };
}
