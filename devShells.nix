rec {
  concatDefaultShells = {toLoad, pkgs ? (import <nixpkgs> { inherit overlays; system = "x86_64-linux";}), overlays ? [], overrideValues ? {}}:
  (pkgs.mkShell ((builtins.foldl' (old: name: let
    value = (shells.${name} ( { inherit pkgs; } // (toLoad.${name}))); in
    ({
      packages = old.packages ++ value.packages;
    } // (builtins.removeAttrs value ["packages"])) ) {packages = [];} (builtins.attrNames toLoad)) // overrideValues));
  shells = {
    rust = {pkgs, extraInputs ? [], toolchain ? (pkgs.rust-bin.selectLatestNightlyWith (toolchain: toolchain.default.override {
        extensions = [ "rust-src" "cargo" "rust-analyzer" "clippy" ];  
      }) )}:
      let exInputs = if (builtins.isList extraInputs) == true then extraInputs else (extraInputs pkgs);
      in {
      packages = with pkgs; [
        pkg-config
        toolchain 
      ] ++ exInputs;
    };
  };
}
