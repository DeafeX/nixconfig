{
  description = "Home Manager configuration of deafex";

  inputs = {
  
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland = {
      url = "github:hyprwm/Hyprland";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, hyprland, ... }@inputs: 
  let
    lib = import ./lib.nix inputs;
  in 
  {     
    nixosConfigurations = {
      phobos = lib.mkHost "phobos";

      nekros = lib.mkHost "nekros";
    };
    
    homeManagerModules = import "./home/modules";
    
    homeConfigurations = {
      "deafex@phobos" = lib.mkHome "phobos";

      "deafex@nekros" = lib.mkHome "nekros";

    };    
  };
}
