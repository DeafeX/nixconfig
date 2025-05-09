{...} : {
  #nixpkgs.config.allowUnfree = true;
  
  nix.gc = {
    automatic = true;
    dates = "weekly";
  };

  nix.settings = {
    auto-optimise-store = true;

    experimental-features = [ "nix-command" "flakes"];
    warn-dirty = false;
  };
  nix.nixPath = [
    "nixpkgs=flake:nixpkgs"
    "devshell=/home/deafex/.nixconfig/devShells.nix"
  ];
}
